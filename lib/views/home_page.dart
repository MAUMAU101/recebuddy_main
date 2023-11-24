import 'package:flutter/material.dart';
import 'package:recebuddy_main/views/recipe_info_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // TextEditingController for the search field
  final TextEditingController _searchController = TextEditingController();

  // Dummy function to simulate search - replace with your actual database query logic
  void searchRecipes(String query, [String? text]) {
    // Implement your database search logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Picture Frame
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'path_to_your_image.jpg'), // Replace with your image asset path
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome to your opportunity to see the recommended recipes',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Search Field
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search Recipes',
                  suffixIcon: Icon(Icons.search),
                ),
                onFieldSubmitted: (String value) {
                  searchRecipes(value);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  searchRecipes(context as String, _searchController.text),
              child: const Text('Search'),
            ),

            // Dynamic Recipe Recommendations and other UI elements...
            // Dynamic Recipe Recommendations
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text('Recommended Recipes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text('Recipe ${index + 1}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Implement navigation or action
                      },
                      child: const Text('LetsGo'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
