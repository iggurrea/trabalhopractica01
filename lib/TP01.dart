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
