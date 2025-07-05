import 'package:fair_travel/widgets/app_large_text.dart';
import 'package:fair_travel/widgets/app_text.dart';
import 'package:fair_travel/widgets/responsive_button.dart';
import 'package:fair_travel/widgets/themes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];
  List text = ['Mountain', 'Sea', 'Forest'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),

            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(text: text[index], size: 30),
                        SizedBox(height: 20),

                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Mountain hikes give you an incredible sense of freedom along with endurance tests.",
                            size: 14,
                            color: AppColors.textColor2,
                          ),
                        ),
                        SizedBox(height: 40),
                        ResponsiveButton(width: 100),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
