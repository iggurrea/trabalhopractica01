import 'dart:math';

import 'package:flutter/material.dart';

class BaseCalc extends StatefulWidget {
  const BaseCalc({super.key});

  @override
  State<BaseCalc> createState() => _BaseCalcState();
}

class _BaseCalcState extends State<BaseCalc> {
  final TextEditingController _input = TextEditingController();
  String _fromBase = 'Decimal';
  String _toBase = 'Binary';
  String _result = '';

  final List<String> bases = ['Decimal', 'Binary', 'Octal', 'Hexadecimal'];

  void _convert() {
    try {
      int numberInBase = parseInput(_input.text, _fromBase);
      String newResult = parseOutput(numberInBase, _toBase);

      setState(() {
        _result = newResult;
      });
    } catch (ex) {
      setState(() {
        _result = 'Invalid input. Try with other';
      });
    }
  }

  int parseInput(String input, String base) {
    switch (base) {
      case 'Decimal':
        return int.parse(input, radix: 10);
      case 'Binary':
        return int.parse(input, radix: 2);
      case 'Octal':
        return int.parse(input, radix: 8);
      case 'Hexadecimal':
        return int.parse(input, radix: 16);
      default:
        return int.parse(input);
    }
  }

  String parseOutput(int input, String base) {
    switch (base) {
      case 'Decimal':
        return input.toRadixString(10);
      case 'Binary':
        return input.toRadixString(2);
      case 'Octal':
        return input.toRadixString(8);
      case 'Hexadecimal':
        return input.toRadixString(16);
      default:
        return '';
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base Converter'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(padding: const EdgeInsets.all(20.0)),
  }
}
