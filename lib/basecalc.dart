import 'dart:math';

import 'package:flutter/material.dart';

//Statefull class with the converter componenets
class BaseCalc extends StatefulWidget {
  const BaseCalc({super.key});

  @override
  State<BaseCalc> createState() => _BaseCalcState();
}

class _BaseCalcState extends State<BaseCalc> {
  //The controller of the input for the text
  final TextEditingController _input = TextEditingController();

  //Default selected bases for do the conversion
  String _fromBase = 'Decimal';
  String _toBase = 'Binary';
  String _result = '';

  //List of the supported number bases 
  final List<String> bases = ['Decimal', 'Binary', 'Octal', 'Hexadecimal'];

  //Funcion to do the conversion
  void _convert() {
    try {
      int numberInBase = parseInput(_input.text, _fromBase);
      String newResult = parseOutput(numberInBase, _toBase);

      //Update the result changing the state
      setState(() {
        _result = newResult;
      });
      
    } catch (ex) {//If we have an error, we need to show the error message
      setState(() {
        _result = 'Invalid input. Try with other';
      });
    }
  }


//Converts the string in a integer in the specified base
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

  //Pass the integer to a string in the base of the output
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
      body: Padding(
  // Adds 20 pixels of padding around the entire body content
  padding: const EdgeInsets.all(20.0),

  // Column widget arranges its children vertically
  child: Column(
    children: [

      // Dropdown to select the base from which the number will be converted
      DropdownButton<String>(
        value: _fromBase, // Currently selected value
        onChanged: (val) => setState(() => _fromBase = val!), // Updates state when new value is selected
        items: bases
            .map((b) => DropdownMenuItem(
                  value: b,
                  child: Text('From: $b'), // Text shown in dropdown
                ))
            .toList(), // Converts map result into a list of DropdownMenuItem
      ),

      // Text input for the number the user wants to convert
      TextField(
        controller: _input, // Controller to read and manage the input text
        decoration: const InputDecoration(labelText: 'input number'), // Placeholder/label
        keyboardType: TextInputType.text, // Accepts text input 
      ),

      // Dropdown to select the base to which the number will be converted
      DropdownButton<String>(
        value: _toBase, // Currently selected target base
        onChanged: (val) => setState(() => _toBase = val!), // Updates state on selection
        items: bases
            .map((b) => DropdownMenuItem(
                  value: b,
                  child: Text('In: $b'), // Text shown in dropdown
                ))
            .toList(), // Converts map result into a list
      ),

      // Spacer for layout separation between dropdowns and button
      const SizedBox(height: 20),

      // Button that triggers the conversion process
      ElevatedButton(
        onPressed: _convert, // Calls the conversion function when tapped
        child: const Text('Convert'), // Button label
      ),

      // Spacer for layout separation between button and result
      const SizedBox(height: 20),

      // Text widget displaying the result of the conversion
      Text(
        'Result: $_result', // Displays conversion output
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ), // Styling the text to stand out
      ),
    ],
  ),
),
    );
      
  }
}
