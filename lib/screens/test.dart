import 'package:flutter/material.dart';
import 'package:quiz_game/data/models/best_scores_model.dart';
import 'package:quiz_game/widgets/custom_card_category.dart';

class MyWidget1 extends StatelessWidget {
  const MyWidget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CardCategories(model: BestScoresData.cards[index]),
                itemCount: BestScoresData.cards.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
