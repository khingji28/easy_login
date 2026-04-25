import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_config.dart';
import 'app_theme_data.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  /// 🔥 โหลดค่าตอนเปิดแอป
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    print("Loaded theme: ${prefs.getBool('isDark')}");
    _isDark = prefs.getBool('isDark') ?? false;
    notifyListeners();
  }

  /// 🔥 set + save
  Future<void> setTheme(bool value) async {
    _isDark = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', _isDark);

    notifyListeners();
  }

  void toggleTheme() {
    setTheme(!_isDark);
  }

  /// 🎨 อันนี้คือหัวใจใหม่
  AppThemeData get appTheme =>
      _isDark ? AppThemeConfig.dark : AppThemeConfig.light;
}
