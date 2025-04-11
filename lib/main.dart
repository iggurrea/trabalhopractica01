import 'package:flutter/material.dart';

void main() {
  runApp(const MyCalcApp());
}

class MyCalcApp extends StatelessWidget {
  const MyCalcApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number base converter',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyCalcApp(),
    );
  }
}
