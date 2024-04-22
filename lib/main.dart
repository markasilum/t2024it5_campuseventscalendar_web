import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2024it5_campuseventscalendar_web/provider/SignInProvider.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/homeScreen.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/loginScreen.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/splashScreen.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider())
      ],
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Consumer<SignInProvider>(builder: (context, signInProvider, _){
              return signInProvider.isAuthorized
              ? const HomeScreen()
              : FutureBuilder(
                  future: signInProvider.signInWithGoogle(), 
                  builder: (context, snapshot) =>
                  snapshot.connectionState==ConnectionState.waiting
                  ? const SplashScreen()
                  :const LoginScreen()
                  );
          }),
          routes: {
            '/home': (context) => HomeScreen(),
            '/login': (context) => LoginScreen()
          },
        ),
    );
  }
}
