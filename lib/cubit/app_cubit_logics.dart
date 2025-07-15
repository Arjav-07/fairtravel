import 'package:fair_travel/cubit/app_cubit.dart';
import 'package:fair_travel/cubit/app_cubit_state.dart';
import 'package:fair_travel/pages/nav_pages/detail_page.dart';
import 'package:fair_travel/pages/nav_pages/mainpage.dart';
import 'package:fair_travel/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatelessWidget {
  const AppCubitLogics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          } else if (state is LoadedState) {
            return const MainPage();
          } else if (state is DetailState) {
            return DetailPage(place: state.place, favorites: state.favorites);
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: Text("Unknown state"));
          }
        },
      ),
    );
  }
}
