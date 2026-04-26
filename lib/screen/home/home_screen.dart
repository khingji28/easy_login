import 'package:easy_login/core/core.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.bg,
      appBar: AppBar(
        backgroundColor: context.appTheme.appBar,
        title: Text(
          'Home Page',
          style: TextStyle(color: context.appTheme.text),
        ),
        actions: [
          // Switch(
          //   value: context.watch<ThemeProvider>().isDark,
          //   onChanged: (value) {
          //     context.read<ThemeProvider>().toggleTheme();
          //   },
          // ),
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().isDark
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: context.appTheme.text,
            ),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome Home!',
          style: TextStyle(color: context.appTheme.text),
        ),
      ),
    );
  }
}
