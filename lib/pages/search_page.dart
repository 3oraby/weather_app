import 'package:flutter/material.dart';
import 'package:weather_app/constants/messages_to_user.dart';
import 'package:weather_app/functions/delay_and_pop.dart';
import 'package:weather_app/functions/fetch_weather_data.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 40, 117, 153),
        title: Text(
          MessagesToUser.searchPageAppBarTitle,
          style: const TextStyle(
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
            onSubmitted: (value) async {
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
                fetchWeatherData(
                  context: context,
                  cityName:
                      value.trim(), // to avoid spaces before and after the text
                );
                delayAndPop(context: context);
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
                onPressed: () => delayAndPop(context: context),
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
