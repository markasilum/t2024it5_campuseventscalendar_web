import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:t2024it5_campuseventscalendar_web/screens/errorPage.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/splashScreen.dart';

import 'package:provider/provider.dart';
import 'package:t2024it5_campuseventscalendar_web/provider/SignInProvider.dart';
import 'package:flutter/material.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/homeScreen.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorPage();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ChangeNotifierProvider(
              create: (_) => SignInProvider(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: LoginScreen(),
                routes: {
                  '/home': (context) => HomeScreen(),
                  '/login': (context) => LoginScreen()
                },
              ),
            );
          }
          return SplashScreen();
        });
  }
}
