import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  redirect() {
    Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 238, 238),
      body: SafeArea(
        child: Center(
          child: Text(
            'Food App',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 222, 61, 104)),
          ),
        ),
      ),
    );
  }
}
