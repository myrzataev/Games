import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color red = Color(0xffE05050);
  static const Color orange = Color(0xffF39F61);
  static const Color green = Color(0xff9ACC5C);
  static const Color blue = Color(0xff4C7AF1);
  static const Color purple = Color(0xff8E44C9);
  static  LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF317166), Color(0xFF0C2D27).withOpacity(0.88)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
