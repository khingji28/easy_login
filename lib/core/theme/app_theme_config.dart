import 'package:flutter/material.dart';
import 'app_theme_data.dart';

class AppThemeConfig {
  static final light = AppThemeData(
    bg: const Color(0xFFF6F8FA), // เทา iOS style
    surface: Colors.white,
    appBar: Colors.blue.shade200,
    text: const Color(0xFF1C1C1E),
    primary: const Color(0xFF007AFF), // iOS blue
  );

  static final dark = AppThemeData(
    bg: const Color.fromARGB(255, 68, 74, 82), // ดำ premium
    surface: const Color(0xFF121821),
    appBar: const Color.fromARGB(255, 19, 113, 227),
    text: Colors.white,
    primary: const Color(0xFF4DA3FF),
  );
}
