import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class TextsStyles {
  // Headlines
  static TextStyle h1 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static TextStyle h3 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // Titles
  static TextStyle titleLarge = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle titleSmall = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Buttons
  static TextStyle buttonLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle buttonMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Inputs
  static TextStyle input = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle hint = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.hintColor,
  );

  static TextStyle label = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );

  // Captions
  static TextStyle caption = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Links
  static TextStyle link = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
    decoration: TextDecoration.underline,
  );

  // Error
  static TextStyle error = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
  );
}