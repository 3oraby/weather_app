import 'package:flutter/material.dart';
import 'package:weather_app/widgets/customs/custom_weather_pages_button.dart';

class FailureBodyWidget extends StatelessWidget {
  const FailureBodyWidget({
    super.key,
    required this.description,
  });
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 128, 11, 2),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Icon(
          Icons.error,
          size: 60,
          color: Color.fromARGB(255, 128, 11, 2),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomWeatherPagesButton(
            description: "Search again for another location 🕵",
            onPressed: () => Navigator.pushNamed(context, "/search"),
          ),
        ),
        // const SizedBox(height: 24),
        // CustomWeatherPagesButton(
        //   description: "Go to home page 🏠",
        //   onPressed: () =>
        //       Navigator.pushNamed(context, "/home"), // back to home page
        // ),
      ],
    );
  }
}
