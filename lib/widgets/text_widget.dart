import 'package:flutter/material.dart';
import 'package:quiz_game/theme/app_fonts.dart';

class ForText extends StatelessWidget {
  final String text;
  const ForText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: AppFonts.w400s12,
      ),
    );
  }
}
