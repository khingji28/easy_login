import 'package:easy_login/core/theme/theme_extension.dart';
import 'package:easy_login/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();
  runApp(
    ChangeNotifierProvider.value(
      value: themeProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: context.watch<ThemeProvider>().isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(
        const Duration(seconds: 3)); // ✅ จำลองโหลด 2 วิ (process)

    bool isLoggedIn =
        await _mockCheckLogin(); // ✅ จำลองเช็ค login (เปลี่ยนเป็นเช็คจริงในอนาคต)

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  Future<bool> _mockCheckLogin() async {
    // ✅ Mock: เปลี่ยนเป็นเช็คจริงจาก shared preferences หรือ secure storage
    // ตัวอย่าง: return true; // ให้สมมติว่าล็อกอินแล้ว
    return false; // สมมติว่ายังไม่ได้ login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.bg,
      body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: context.appTheme.primary,
          size: 100,
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
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
                labelText: 'Password',
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
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
