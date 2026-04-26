import 'package:easy_login/core/core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.bg,
      appBar: AppBar(
        backgroundColor: context.appTheme.appBar,
        title: Text(
          'Login Page',
          style: TextStyle(color: context.appTheme.text),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              context.read<LanguageProvider>().toggleLanguage();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: context.keyLang("username"),
                labelStyle: TextStyle(color: context.appTheme.text),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.appTheme.text),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.appTheme.primary),
                ),
              ),
              style: TextStyle(color: context.appTheme.text),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: context.keyLang("password"),
                labelStyle: TextStyle(color: context.appTheme.text),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.appTheme.text),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.appTheme.primary),
                ),
              ),
              obscureText: true,
              style: TextStyle(color: context.appTheme.text),
            ),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;

                print('JIRATCHECK: username: $username');
                print('JIRATCHECK: password: $password');
                if (username != '' && password != '') {
                  context.replace('/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Please enter username and password')),
                  );
                }
              },
              child: Text(context.keyLang("login")),
            ),
          ],
        ),
      ),
    );
  }
}
