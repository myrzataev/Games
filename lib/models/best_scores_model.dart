import 'package:flutter/material.dart';
import 'package:quiz_game/resources/resources.dart';
import 'package:quiz_game/theme/app_color.dart';

class BestScoresModel {
  final String sportTypeLogo;
  final int bestScore;
  final Color color;

  BestScoresModel({required this.sportTypeLogo, required this.bestScore, required this.color});
}

abstract class BestScoresData {
  static List<BestScoresModel> cards = [
    BestScoresModel(sportTypeLogo: Images.football, bestScore: 335, color: AppColors.red),
    BestScoresModel(sportTypeLogo: Images.hokkey, bestScore: 615, color: AppColors.orange),
    BestScoresModel(sportTypeLogo: Images.basketball, bestScore:211, color: AppColors.green ),
    BestScoresModel(sportTypeLogo: Images.tennis, bestScore: 225, color: AppColors.blue),
    BestScoresModel(sportTypeLogo: Images.tennis, bestScore: 335, color: AppColors.purple),
  ];
}
