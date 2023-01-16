import 'package:flutter/material.dart';
import 'package:food_app_demo/model/data_model.dart';
import '../model/navigation_model.dart';
import '../views/detail_screen.dart';
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
      case "/detail":
        final args = setting.arguments as NavigationModel;
        return MaterialPageRoute(
            builder: (context) =>
                DetailScreen(dataModel: args.dataModel, isSalad: args.isSalad));
      case "/signUp":
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
