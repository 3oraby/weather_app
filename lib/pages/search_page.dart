import 'package:flutter/material.dart';
import 'package:weather_app/functions/fetch_weather_data.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "search for the city",
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            onChanged: (value) {
              // write here the code of auto complete
            },
            onSubmitted: (value) {
              if (value.trim().isEmpty) {
                // Show error message for empty input
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please enter a city name',
                    ),
                  ),
                );
              } else {
                // do not use await to return immediately to home page and show Loading or Failure Widget to the user
                fetchWeatherData(
                  context: context,
                  cityName: value.trim(),
                );
                Navigator.pop(context); // return to the Home Page
              }
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 40,
              ),
              label: const Text(
                "Search",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              hintText: "Enter the name of the city..",
              suffixIcon: IconButton(
                onPressed: () {
                  // write code for close the keyboard and make search here
                },
                icon: const Icon(
                  Icons.search,
                ),
                iconSize: 35,
                color: Colors.deepPurple,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              hintStyle: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
