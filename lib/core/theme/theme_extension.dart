import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';
import 'app_theme_data.dart';

extension ThemeExt on BuildContext {
  AppThemeData get appTheme => watch<ThemeProvider>().appTheme;
}
