import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fair_travel/cubit/app_cubit.dart';
import 'package:fair_travel/services/data_services.dart';
import 'package:fair_travel/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubits(data: DataServices()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FairTravel',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
