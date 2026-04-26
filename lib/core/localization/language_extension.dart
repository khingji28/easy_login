import 'package:easy_login/core/localization/language_povider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension LangExt on BuildContext {
  String keyLang(String key) {
    return watch<LanguageProvider>().getValueLang(key);
  }
}
