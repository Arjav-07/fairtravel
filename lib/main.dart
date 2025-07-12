import 'package:fair_travel/cubit/app_cubit.dart';
import 'package:fair_travel/pages/nav_pages/detail_page.dart';
import 'package:fair_travel/pages/nav_pages/mainpage.dart';
import 'package:fair_travel/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FairTravel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BlocProvider<AppCubits>(
        create:(context)=>AppCubits(),
        child: ,
      ),
    );
  }
}
