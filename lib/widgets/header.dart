import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                "https://i.imgur.com/aspOC2Y.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Campus Events Calendar",
              style: TextStyle(color: Colors.white),
            ),
          ],
    );
  }
}