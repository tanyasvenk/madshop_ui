import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w700,
    fontSize: 52,
    color: AppColors.darkText,
    letterSpacing: -0.5,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w300,
    fontSize: 19,
    color: AppColors.darkText,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.grey,
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w300,
    fontSize: 22,
    color: AppColors.lightText,
  );
}
