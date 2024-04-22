import 'package:flutter/material.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}
