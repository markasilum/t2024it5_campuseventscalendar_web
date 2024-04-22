import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: false,
        title: Text("Campus Events Calendar", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Container(
          child: Text("HOME SCREEN"),
        ),
      ),
    );
  }
}