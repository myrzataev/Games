import 'package:flutter/material.dart';
import 'package:quiz_game/resources/resources.dart';
import 'package:quiz_game/screens/main_screen.dart';
import 'package:quiz_game/theme/app_fonts.dart';

class ShowModeDialog {
  Future<void> show(BuildContext context, final dynamic score,
      final int maxScore, final String modeText) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(),
          content: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff317166),
                  Color(0xff0C2D27).withOpacity(0.88),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    modeText,
                    style: AppFonts.w400s23,
                    textAlign: TextAlign.justify,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.timerIcon,
                          height: 101,
                          width: 89,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'You score: ${score}',
                                style: AppFonts.w400s20,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Max score: ${maxScore}',
                                style: AppFonts.w400s20,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'You world position: 563',
                                style: AppFonts.w400s20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 65,
                        width: 240,
                        decoration: BoxDecoration(
                          color: Color(0xffD9D9D9),
                        ),
                        child: Center(
                          child: Text(
                            'CONTINUE',
                            style:
                                AppFonts.w400s24.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
