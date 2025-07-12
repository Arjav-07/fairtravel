import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fair_travel/cubit/app_cubit.dart';
import 'package:fair_travel/cubit/app_cubit_state.dart';
import 'package:fair_travel/pages/nav_pages/home_page.dart';
import 'package:fair_travel/pages/welcome_page.dart';

class AppCubitLogics extends StatelessWidget {
  const AppCubitLogics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        } else if (state is LoadedState) {
          return const HomePage();
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("Unknown state"));
        }
      },
    );
  }
}
