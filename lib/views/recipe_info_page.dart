// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class RecipeInfoPage extends StatefulWidget {
  const RecipeInfoPage({super.key});

  @override
  _RecipeInfoPageState createState() => _RecipeInfoPageState();
}

class _RecipeInfoPageState extends State<RecipeInfoPage> {
  int _servingSize = 1; // Default serving size

  // Dummy data for demonstration. Replace with actual recipe data.
  final Map<String, double> _nutritionalFacts = {
    'Calories': 200,
    'Protein (g)': 10,
    'Carbs (g)': 30,
    'Fats (g)': 10,
  };

  // Function to calculate nutritional facts based on serving size
  Map<String, double> calculateNutritionPerServing(int servingSize) {
    return _nutritionalFacts
        .map((key, value) => MapEntry(key, value * servingSize));
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> nutritionForServing =
        calculateNutritionPerServing(_servingSize);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Cook Time: 30 mins', // Replace with actual cook time
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButton<int>(
              value: _servingSize,
              items: [1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value person${value > 1 ? 's' : ''}'),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  _servingSize = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Nutritional Facts for $_servingSize serving${_servingSize > 1 ? 's' : ''}:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...nutritionForServing.entries.map((entry) =>
                Text('${entry.key}: ${entry.value.toStringAsFixed(2)}')),
          ],
        ),
      ),
    );
  }
}
