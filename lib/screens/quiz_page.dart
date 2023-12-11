import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_game/resources/resources.dart';
import 'package:quiz_game/screens/main_screen.dart';
import 'package:quiz_game/services/shared_preferences_manager.dart';
import 'package:quiz_game/theme/app_fonts.dart';
import 'package:quiz_game/widgets/aler_dialog_widget.dart';

class QuizScreen extends StatefulWidget {
  final dynamic model;
  final GameMode gameMode;
  // final TypeSport;
  final List questions;

  const QuizScreen(
      {Key? key,
      required this.model,
      required this.gameMode,
      required this.questions})
      : super(key: key);

  @override
  State<QuizScreen> createState() => _DetailPageState();
}

class _DetailPageState extends State<QuizScreen> {
  late int timeSeconds;
  late Timer? timer;
  int score = 0;
  bool buttonPressed = false;
  PageController _pageController = PageController();
  bool answered = false;
  bool correctAnswer = false;
  List<Color?> buttonColors = List.filled(4, null);
  int maxScoreForOneChanceMode =
      SharedPreferencesManager.instance.getMaxScoreOneChance();
  int maxScoreForTimeAttackMode =
      SharedPreferencesManager.instance.getMaxScoreTimeAttack();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
    timeSeconds = 15;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.black),
            ),
            Image.asset(
              Images.basketballScreenBakground,
              height: 436,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Image.asset(
                          Images.basketballLogo,
                          height: 25.h,
                        ),
                        SizedBox(
                          width: 4.5.w,
                        ),
                        Text(
                          widget.model.nameOfSport,
                          style: AppFonts.w400s24,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()));
                          },
                          child: Image.asset(
                            Images.exitIcon,
                            height: 35,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 51),
                      child: SizedBox(
                        height: 102.h,
                        child: Text(
                          '${widget.questions[index].question}',
                          style: AppFonts.w400s23,
                        ),
                      ),
                    ),
                    for (int i = 0;
                        i < widget.questions[index].answers!.length;
                        i++) ...[
                      Container(
                        width: double.infinity,
                        height: 77.h,
                        margin: const EdgeInsets.only(
                            bottom: 20.0, left: 12.0, right: 12.0),
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          // fillColor: buttonColors[i],
                          fillColor: buttonPressed && buttonColors[i] != null
                              ? buttonColors[i]
                              : Colors.white,
                          onPressed: !answered
                              ? () async {
                                  bool isCorrect = widget
                                      .questions[index].answers!.values
                                      .toList()[i];
                                  setState(() {
                                    buttonColors = List.filled(
                                        4, null); // Reset all button colors
                                    buttonColors[i] = isCorrect
                                        ? Colors.green
                                        : Colors
                                            .red; // Set color for the pressed button
                                    buttonPressed = true;
                                    answered = true;
                                    correctAnswer = isCorrect;
                                  });

                                  if (isCorrect) {
                                    score++;
                                  } else {
                                    if (widget.gameMode == GameMode.oneChance) {
                                      // oneChance();
                                      // correctAnswer =  true;
                                      ShowModeDialog().show(
                                          context,
                                          score,
                                          maxScoreForOneChanceMode,
                                          'You made a mistake!');
                                      // print(timeSeconds);
                                    } else {
                                      // Handle other modes
                                    }
                                  }

                                  await Future.delayed(Duration(seconds: 1),
                                      () {
                                    if (_pageController.page?.toInt() ==
                                        widget.questions.length - 1) {
                                      ShowModeDialog().show(context, score, 550,
                                          'You made a mistake!');
                                    } else {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOutExpo,
                                      );
                                    }
                                  });
                                  setState(() {
                                    buttonPressed = false;
                                    answered = false;
                                    correctAnswer = false;
                                  });
                                  handleGameMode(index);
                                  print(score);
                                }
                              : null,
                          child: Text(
                              widget.questions[index].answers!.keys.toList()[i],
                              style: AppFonts.w400s27
                                  .copyWith(color: Colors.black)),
                        ),
                      ),
                    ],
                    Text(
                      widget.gameMode == GameMode.oneChance
                          ? 'One Chance'
                          : timeSeconds.toString(),
                      style: AppFonts.w400s29,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
      itemCount: widget.questions.length,
    ));
  }

  void startTimer() {
    if (widget.gameMode == GameMode.timeAttack) {
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        setState(() {
          if (timeSeconds > 0 && !answered) {
            timeSeconds--;
          } else if (timeSeconds == 0 && !answered) {
            timer?.cancel();
            ShowModeDialog()
                .show(context, score, maxScoreForTimeAttackMode, 'Time is up!');
          }
        });
      });
    }
  }

  void handleGameMode(int index) {
    if (widget.gameMode == GameMode.oneChance) {
      oneChance();
    } else {
      timeAttack();
    }
  }

  void oneChance() {
    if (correctAnswer) {
      ShowModeDialog().show(
          context, score, maxScoreForOneChanceMode, 'You made a mistake!');
    } else {
      navigateToNextQuestion();
    }
  }

  void timeAttack() {
    if (!correctAnswer) {
      score++;
      SharedPreferencesManager.instance.saveMaxScoreTimeAttack(score);
    }
    navigateToNextQuestion();
  }

  navigateToNextQuestion() {
    if (_pageController.page?.toInt() == widget.questions.length) {
      timer?.cancel();
      ShowModeDialog().show(context, score, 550, 'The end!');
    } else {
      _pageController.nextPage(
          duration: Duration(microseconds: 500), curve: Curves.easeInBack);
      resetTimer();
    }
    setState(() {
      buttonPressed = false;
      answered = false;
      correctAnswer = false;
    });
  }

  void resetTimer() {
    timeSeconds = 15;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  //Stack
}

enum GameMode {
  oneChance,
  timeAttack;
}

enum TypeSport {
  basketball,
  football,
  hockey;
}
