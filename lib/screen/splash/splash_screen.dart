import 'package:easy_login/core/core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    await Future.delayed(const Duration(seconds: 3));

    final path = GoRouterState.of(context).uri.path;
    print('PATH:= ${GoRouterState.of(context).uri.path}');
    final uri = GoRouterState.of(context).uri;
    print('URI HOST: ${uri.host}');
    print('URI PATH: ${uri.path}');
    // 🔥 ถ้ามี deep link → ไม่ต้องทำอะไร
    if (path != '/') return;

    bool isLoggedIn = await _mockCheckLogin();

    if (isLoggedIn) {
      context.go('/home');
    } else {
      context.go('/login');
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
