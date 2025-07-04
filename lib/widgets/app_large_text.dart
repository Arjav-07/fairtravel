import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final double size;
  final Color color;
  final String text;

  const AppLargeText({
    Key? key,
    this.size = 30, // default font size
    required this.text,
    this.color = Colors.black, // default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold, // or customize if needed
      ),
    );
  }
}
