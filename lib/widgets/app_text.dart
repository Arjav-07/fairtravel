import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final Color color;
  final String text;

  const AppText({
    Key? key,
    this.size = 16, // default font size
    required this.text,
    this.color = Colors.black54, // default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        // or customize if needed
      ),
    );
  }
}
