import 'package:easy_login/screen/login/login_screen.dart';
import 'package:easy_login/screen/splash/splash_screen.dart';
import 'package:easy_login/screen/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final isLoggedIn = false;

    // 🔥 ถ้ามี deep link → ปล่อยผ่าน
    if (state.uri.path != '/') return null;

    return isLoggedIn ? '/home' : '/login';
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
