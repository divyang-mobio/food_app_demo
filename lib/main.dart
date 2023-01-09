import 'package:flutter/material.dart';
import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0)),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/');
  }
}
