import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData buildTheme(AppColors colors, Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,

      /// 🎯 พื้นหลังหลักของแอป
      scaffoldBackgroundColor: colors.background,

      /// 🎯 ColorScheme = หัวใจของ theme
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: Colors.white,
        secondary: colors.primary,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: colors.surface,
        onSurface: colors.text,
      ),

      /// 🎯 AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.text,
        elevation: 0,
      ),

      /// 🎯 Text
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: colors.text),
        titleLarge: TextStyle(
          color: colors.text,
          fontWeight: FontWeight.bold,
        ),
      ),

      /// 🎯 ปุ่ม
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
