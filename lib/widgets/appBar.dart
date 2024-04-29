import 'package:flutter/material.dart';
import 'package:t2024it5_campuseventscalendar_web/widgets/header.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: Color(0xFF08228D),
        centerTitle: false,
        title: Header(),
        actions: [
          TextButton(
            onPressed: () {
              // Add your onPressed action here
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Color(0xFF08228D), // Set icon color to blue
                  ),
                  SizedBox(width: 8), // Add some spacing between icon and text
                  Text(
                    'Add Event',
                    style: TextStyle(
                      color: Color(0xFF08228D), // Set text color to blue
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
