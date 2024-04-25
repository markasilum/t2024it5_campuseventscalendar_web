import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2024it5_campuseventscalendar_web/provider/SignInProvider.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/loginScreen.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

        final signInProvider = Provider.of<SignInProvider>(context, listen: false);

    return Scaffold(
       appBar: AppBar(
        backgroundColor:Color(0xFF08228D),
        title: Header(),
        automaticallyImplyLeading: false, // Remove the back icon

      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF08228D),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: 400,
          height: 40,
          child: TextButton(
              onPressed: () async {
                await signInProvider.signOutGoogle(context);
               
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
