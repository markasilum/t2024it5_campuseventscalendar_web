import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2024it5_campuseventscalendar_web/provider/SignInProvider.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/eventsCards.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/header.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/sideBarWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF08228D),
        centerTitle: false,
        title: Header()
      ),
      body: Row(
        children: [
          SideBar(),
          
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('events').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final events = snapshot.data?.docs.reversed.toList();
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Limit to three columns
                      crossAxisSpacing: 10.0, // Spacing between columns
                      mainAxisSpacing: 10.0, // Spacing between rows
                      childAspectRatio: .7
                    ),
                    itemCount: events!.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return EventCard(event: event);
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator(); // Placeholder while data is loading
              }
            },
          ),
        ],
      ),
    );
  }
}
