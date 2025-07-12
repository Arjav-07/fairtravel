import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fair_travel/widgets/app_text.dart';
import 'package:fair_travel/widgets/themes.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  final VoidCallback? onTap;

  const ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonChild = Container(
      height: 60,
      width: isResponsive ? null : width, // <- allow parent to constrain it
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: isResponsive
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          AppText(text: "Book Trip Now", color: Colors.white),
          if (isResponsive)
            const Icon(
              CupertinoIcons.arrow_right,
              size: 30,
              color: Colors.white,
            ),
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: isResponsive ? Expanded(child: buttonChild) : buttonChild,
    );
  }
}
