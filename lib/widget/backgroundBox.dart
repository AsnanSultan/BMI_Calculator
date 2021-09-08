import 'package:flutter/material.dart';

class BackgroundBox extends StatelessWidget {
  final Color color;
  final Widget cardWidget;

  const BackgroundBox({required this.color, required this.cardWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardWidget,
    );
  }
}
