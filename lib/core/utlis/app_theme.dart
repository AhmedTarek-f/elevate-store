import 'package:elevate_store/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: "Inter",
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: AppColors.white,
      inversePrimary: AppColors.black,
      secondary: AppColors.blue,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.blue,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.indigo,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.indigo,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.indigo,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.indigo,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.lightBlue,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: "Inter",
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: AppColors.black,
      secondary: AppColors.blue,
      inversePrimary: AppColors.white,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.blue,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.lightBlue,
      ),
    ),
  );
}
