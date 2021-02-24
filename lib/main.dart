import 'package:flutter/material.dart';
import 'package:lateck/screens/login.dart';
import 'package:lateck/screens/onBoard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: OnboardingScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
        });
  }
}