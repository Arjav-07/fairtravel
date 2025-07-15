import 'package:fair_travel/model/data_model.dart';
import 'package:fair_travel/widgets/app_buttons.dart';
import 'package:fair_travel/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fair_travel/widgets/app_large_text.dart';
import 'package:fair_travel/widgets/app_text.dart';
import 'package:fair_travel/widgets/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fair_travel/cubit/app_cubit.dart';
import 'package:fair_travel/cubit/app_cubit_state.dart';

class DetailPage extends StatelessWidget {
  final DataModel place;
  final List<DataModel> favorites;

  const DetailPage({super.key, required this.place, required this.favorites});

  @override
  Widget build(BuildContext context) {
    int rating = 4;
    int selectedPeople = -1;
    bool isFavorite = favorites.contains(place);

    return Scaffold(
      body: StatefulBuilder(
        builder: (context, setState) {
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 50,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(place.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<AppCubits>(context).goHome();
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: place.name, color: Colors.black87),
                          AppLargeText(
                            text: "\$${place.price}",
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          10.widthBox,
                          AppText(
                            text: place.location,
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                      20.heightBox,
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
                          const AppText(
                            text: "4.0",
                            color: AppColors.textColor2,
                          ),
                        ],
                      ),
                      25.heightBox,
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const AppText(
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
                      const AppLargeText(
                        text: "Description",
                        size: 20,
                        color: Colors.black,
                      ),
                      10.heightBox,
                      AppText(text: place.description, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                height: 60,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<AppCubits>(
                          context,
                        ).toggleFavorite(place);
                      },
                      child: AppButtons(
                        color: isFavorite ? Colors.red : AppColors.textColor2,
                        backgroundColor: Colors.white,
                        size: 60,
                        borderColor: AppColors.textColor2,
                        isIcon: true,
                        icon: isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                    ),
                    20.widthBox,
                    const Expanded(child: ResponsiveButton(isResponsive: true)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
