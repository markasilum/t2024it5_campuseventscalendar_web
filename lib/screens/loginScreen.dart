import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2024it5_campuseventscalendar_web/provider/SignInProvider.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);

    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 130, vertical: 50),
          color: Colors.green[100],
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .70,
              width: MediaQuery.of(context).size.width * .3,
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 45),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.calendar_month, size: 50),
                        Text(
                          "Campus Events",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter your email address",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "name@example.com",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Enter you password"),
                    SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "atleast 8 characters",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: 400,
                          height: 40,
                          child: TextButton(
                              onPressed: () {
                                if (FirebaseAuth.instance.currentUser != null) {
                                  print(FirebaseAuth.instance.currentUser?.uid);
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: 400,
                          height: 40,
                          child: TextButton(
                              onPressed: () {
                                signInProvider.signInWithGoogle(context);
                                
                              },
                              child: Text(
                                "Login with google",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ]),
            ),
          )),
    );
  }

//   Future<UserCredential> signInWithGoogle() async {
//     // Create a new provider
//     GoogleAuthProvider googleProvider = GoogleAuthProvider();

//     // Once signed in, return the UserCredential
//     try {
//     var userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);
//     // print(userCredential);

//     return userCredential;
// } catch (error) {
//     // Handle the error appropriately
//    print("An error occurred while signing in: $error");
//     // Optionally, you can throw the error again to let the caller handle it
//     throw error;
// }

//     // Or use signInWithRedirect
//     // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
//   }
}
