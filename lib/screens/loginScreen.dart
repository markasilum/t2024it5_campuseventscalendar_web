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
          // color: Color.fromARGB(255, 128, 183, 235),
          // 'https://i.imgur.com/VPg47zp.png'
          decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://i.imgur.com/hnQrSM4.jpeg"),
            fit: BoxFit.cover, // This will cover the entire container
          ),
        ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .40,
              width: MediaQuery.of(context).size.width * .2,
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 45),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image(
                              image: NetworkImage(
                                  'https://i.imgur.com/VPg47zp.png'),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text( 
                            "Ateneo de Davao University Campus Events",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // const Text(
                    //   "Enter your email address",
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     prefixIcon: Icon(Icons.person,size: 24), // Adding the icon
                    //     hintText: "name@example.com",
                    //     hintStyle: TextStyle(color: Colors.grey),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // Text("Enter you password"),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // const TextField(
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       prefixIcon: Icon(Icons.key,size: 24), // Adding the icon
                    //       hintText: "atleast 8 characters",
                    //       hintStyle: TextStyle(color: Colors.grey)),
                    // ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF08228D),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            width: 250,
                            height: 50,
                            child: TextButton(
                                onPressed: () {
                                  signInProvider.signInWithGoogle(context);
                                },
                                child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 20),
                                    Image(
                                      height: 30,
                                      image: NetworkImage(
                                          'https://i.imgur.com/VCNBCZt.png'),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      "Login with Google",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ))),
                          ),
                        )
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
