import 'package:fair_travel/widgets/app_buttons.dart';
import 'package:fair_travel/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fair_travel/widgets/app_large_text.dart';
import 'package:fair_travel/widgets/app_text.dart';
import 'package:fair_travel/widgets/themes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedPeople = -1;
  int rating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            top: 50,
            child: Container(
              width: double.maxFinite,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/mountaintwo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Menu button
          Positioned(
            left: 20,
            top: 50,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: Vx.white,
            ),
          ),

          // Detail container
          Positioned(
            top: 320,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 320,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Yosemite", color: Colors.black87),
                      AppLargeText(text: "\$ 250", color: AppColors.mainColor),
                    ],
                  ),
                  10.heightBox,

                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.mainColor),
                      10.widthBox,
                      AppText(
                        text: "USA, California",
                        color: AppColors.textColor1,
                      ),
                    ],
                  ),
                  20.heightBox,

                  // Stars
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < rating
                                ? AppColors.starColor
                                : AppColors.textColor2,
                          );
                        }),
                      ),
                      10.widthBox,
                      AppText(text: "4.0", color: AppColors.textColor2),
                    ],
                  ),
                  25.heightBox,

                  // People selection
                  AppLargeText(
                    text: "People",
                    color: Colors.black.withOpacity(0.8),
                    size: 20,
                  ),
                  AppText(
                    text: "Number of people in your group",
                    color: Colors.grey,
                  ),
                  15.heightBox,
                  Wrap(
                    children: List.generate(5, (index) {
                      int value = index + 1;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedPeople = value;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: AppButtons(
                            size: 50,
                            color: selectedPeople == value
                                ? Colors.white
                                : Colors.black,
                            backgroundColor: selectedPeople == value
                                ? Colors.black
                                : AppColors.buttonBackground,
                            borderColor: selectedPeople == value
                                ? Colors.black
                                : AppColors.buttonBackground,
                            text: value.toString(),
                            isIcon: false,
                          ),
                        ),
                      );
                    }),
                  ),

                  20.heightBox,

                  // Description
                  AppLargeText(
                    text: "Description",
                    size: 20,
                    color: Colors.black,
                  ),
                  10.heightBox,
                  const Text(
                    "Yosemite National Park is located in central Sierra Nevada in the US state of California. It is located near the wild protected areas.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom buttons outside the detail container
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            height: 60,
            child: Row(
              children: [
                AppButtons(
                  color: AppColors.textColor2,
                  backgroundColor: Colors.white,
                  size: 60,
                  borderColor: AppColors.textColor2,
                  isIcon: true,
                  icon: Icons.favorite_border,
                ),
                20.widthBox,
                const Expanded(child: ResponsiveButton(isResponsive: true)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
