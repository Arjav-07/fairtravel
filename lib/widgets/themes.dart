import 'package:flutter/material.dart';

class AppColors {
  static const Color textColor1 = Color(0xFF989ACD);
  static const Color textColor2 = Color(0xFF878593);
  static const Color bigTextColor = Color(0xFF2E2E31);
  static const Color mainColor = Color(0xFF5D69B3);
  static const Color starColor = Color(0xFF7BB4E4);
  static const Color mainTextColor = Color(0xFFABAAD4);
  static const Color buttonBackground = Color(0xFFFFFFFF);
}

// -------------------------
// LIGHT THEME
// -------------------------
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.mainColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black87),
    titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.textColor2),
  ),
  iconTheme: const IconThemeData(color: AppColors.textColor1),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.mainColor,
    secondary: AppColors.starColor,
  ),
);

// -------------------------
// DARK THEME
// -------------------------
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.mainColor,
  scaffoldBackgroundColor: const Color(0xFF1E1E2C),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E2C),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white70)),
  iconTheme: const IconThemeData(color: Colors.white70),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ).copyWith(primary: AppColors.mainColor, secondary: AppColors.starColor),
);
