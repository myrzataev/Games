import 'package:flutter/material.dart';
import 'package:quiz_game/data/models/best_scores_model.dart';
import 'package:quiz_game/data/models/sports_models.dart';

import 'package:quiz_game/widgets/custom_card_category.dart';
import 'package:quiz_game/widgets/text_widget.dart';
import 'package:quiz_game/widgets/type_of_sports.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF317166),
          Color.fromARGB(255, 0, 0, 0).withOpacity(0.88)
        ], begin: Alignment.topCenter, end: Alignment.center)),
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ForText(
                  text: 'BEST SCORES',
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    height: 51,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          CardCategories(model: BestScoresData.cards[index]),
                      itemCount: BestScoresData.cards.length,
                    ),
                  ),
                ),
                const ForText(
                  text: 'CATEGORIES',
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        Sports(model: SportsData.sports[index]),
                    itemCount: SportsData.sports.length,
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
