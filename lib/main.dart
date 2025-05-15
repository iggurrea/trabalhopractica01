import 'package:flutter/material.dart';
import 'basecalc.dart';

//Main of the apliccation
void main() {
  runApp(const MyCalcApp());
}

//Principal class for the calculator
class MyCalcApp extends StatelessWidget {
  const MyCalcApp({super.key});

  // The root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number base converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BaseCalc(),
    );
  }
}
