import 'package:flutter/material.dart';
import '../views/login_screen.dart';
import '../views/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case "/login":
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
