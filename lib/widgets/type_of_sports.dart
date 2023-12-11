import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_game/data/question_data.dart';
import 'package:quiz_game/models/sports_models.dart';
import 'package:quiz_game/resources/resources.dart';
import 'package:quiz_game/screens/quiz_page.dart';
import 'package:quiz_game/theme/app_fonts.dart';

class Sports extends StatelessWidget {
  final SportsModels model;
  const Sports({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                insetPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(),
                content: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff317166),
                      Color(0xff0C2D27).withOpacity(0.88)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'SELECT MODE',
                          style: AppFonts.w400s23,
                        ),
                        InkWell(
                          //oneChanceMode
                          onTap: () {
                            Navigator.pop(context);
                            navigateToQuizScreen(
                                context, model.category, GameMode.oneChance);
                          },
                          child: Image.asset(
                            Images.oneChance,
                            height: 199,
                            width: 363,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            navigateToQuizScreen(
                                context, model.category, GameMode.timeAttack);
                          },
                          child: Image.asset(
                            Images.timeAttack,
                            height: 199,
                            width: 363,
                          ),
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: AppFonts.w400s17,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 205.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Image.asset(model.photo),
        ),
      ),
    );
  }

  void navigateToQuizScreen(
      BuildContext context, String category, GameMode gameMode) {
    SportsModels selectedSport = SportsModels(
      photo: '', // Provide the correct photo path or leave it empty
      nameOfSport:
          '', // Provide the correct name of the sport or leave it empty
      category: category,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          model: selectedSport,
          gameMode: gameMode,
          questions: getQuestionsForCategory(category),
        ),
      ),
    );
  }
}
