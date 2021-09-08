import 'package:flutter/material.dart';

class BoxIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  BoxIconText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
