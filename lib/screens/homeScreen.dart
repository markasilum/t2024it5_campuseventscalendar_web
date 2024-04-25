import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2024it5_campuseventscalendar_web/provider/SignInProvider.dart';
import 'package:t2024it5_campuseventscalendar_web/screens/loginScreen.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/sideBarWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: false,
        title: Text(
          "Campus Events Calendar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Row(
        children: [
          SideBar(),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('events').snapshots(),
              builder: (context, snapshot) {
                List<Column> eventWidgets = [];

                if (snapshot.hasData) {
                  final events = snapshot.data?.docs.reversed.toList();
                  for (var event in events!) {
                    final eventWidget = Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 350,
                          width: 340,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF0072ff),
                                    const Color(0xFF75d5fd),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                      imageUrl: event['images'][0],
                                      height: 200,
                                      width: 300,
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error)),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20),
                                          Text(
                                           event['organizer'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            event['location'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          Text(
                                           event['eventName'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          //Column(

                          //children: [
                          // CachedNetworkImage(

                          // imageUrl: event['images'][0],
                          // height: 200,
                          // placeholder: (context, url) => CircularProgressIndicator(),
                          // errorWidget: (context, url, error) => Icon(Icons.error),),
                          // Text(event['eventName']),
                          // Text(event['location']),
                          //]
                          //),
                        ),

                        // Text(event['startDate'])
                      ],
                    );

                    eventWidgets.add(eventWidget);
                  }
                }
                return Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: eventWidgets,
                  ),
                );
              }),
        ],
      ),

      //
      // Center(
      //   child: Container(
      //     decoration: BoxDecoration(
      //         color: Colors.purple,
      //         borderRadius: BorderRadius.all(Radius.circular(10))),
      //     width: 400,
      //     height: 40,
      //     child: TextButton(
      //         onPressed: () async {
      //           await signInProvider.signOutGoogle(context);

      //         },
      //         child: Text(
      //           "Logout",
      //           style: TextStyle(
      //             color: Colors.white,
      //           ),
      //         )),
      //   ),
      // ),
    );
  }
}
