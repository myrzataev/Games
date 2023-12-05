import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_game/data/models/sports_models.dart';

class Sports extends StatelessWidget {
  final SportsModels model;

  const Sports({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          child: Image.asset(model.photo),
          height: 205.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
