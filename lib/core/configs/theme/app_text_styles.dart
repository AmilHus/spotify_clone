import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle mainTextBold = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.lightText,
  );

  static const TextStyle subText = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );

  static const TextStyle mainTextMedium = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppColors.lightText,
  );

  static const TextStyle buttonTextBold = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: AppColors.lightText,
  );
}
