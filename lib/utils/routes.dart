import 'package:flutter/material.dart';
import '../views/login_screen.dart';
import '../views/main_screen.dart';
import '../views/sign_up_screen.dart';
import '../views/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case "/login":
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case "/main":
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case "/signUp":
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
