import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

import 'app_strings.dart';

class LanguageProvider extends ChangeNotifier {
  String _lang = "en";

  String get lang => _lang;

  /// 🔥 INIT ตอนเปิดแอป
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLang = prefs.getString('lang');

    if (savedLang != null) {
      _lang = savedLang;
    } else {
      /// 👉 ใช้ภาษาจากเครื่อง
      final deviceLang = PlatformDispatcher.instance.locale.languageCode;

      _lang = (deviceLang == 'th') ? 'th' : 'en';
    }

    notifyListeners();
  }

  /// 🔁 เปลี่ยนภาษา + save
  Future<void> setLanguage(String value) async {
    _lang = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', _lang);

    notifyListeners();
  }

  void toggleLanguage() {
    setLanguage(_lang == 'en' ? 'th' : 'en');
  }

  /// 🔥 ฟังก์ชันที่คุณอยากได้
  String getValueLang(String key) {
    return AppStrings.data[key]?[_lang] ?? key;
  }
}
