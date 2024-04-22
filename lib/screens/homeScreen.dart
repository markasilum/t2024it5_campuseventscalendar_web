import 'package:flutter/material.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/loginScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: false,
        title: Text(
          "Campus Events Calendar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: 400,
          height: 40,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}
