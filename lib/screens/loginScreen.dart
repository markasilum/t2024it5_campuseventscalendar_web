import 'package:flutter/material.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 130, vertical: 50),
          color: Color.fromARGB(255, 128, 183, 235),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .55,
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
                          Text(
                            "Ateneo de Davao Campus Events",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Enter your email address",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person,size: 24), // Adding the icon
                        hintText: "name@example.com",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
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
                            width: 400,
                            height: 40,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          )),
    );
  }
}
