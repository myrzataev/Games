import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_game/models/best_scores_model.dart';
import 'package:quiz_game/theme/app_fonts.dart';

class CardCategories extends StatelessWidget {
  final BestScoresModel model;

  const CardCategories({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: InkWell(
        onTap: () {   
        },
        child: Container(
          height: 51.h,
          width: 86.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13), color: model.color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                model.sportTypeLogo,
                height: 26.h,
                width: 32.w,
                color: Colors.white,
              ),
              Text(
                ':',
                style: AppFonts.w400s12,
              ),
              Text(
                model.bestScore.toString(),
                style: AppFonts.w400s12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
