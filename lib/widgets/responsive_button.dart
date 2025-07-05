import 'package:fair_travel/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;

  const ResponsiveButton({Key? key, this.width, this.isResponsive = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.arrow_right,
          size: 30,
          color: Colors.white, // Use white or contrast color
        ),
      ),
    );
  }
}
