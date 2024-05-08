import 'package:flutter/material.dart';
import 'package:weather_app/functions/fetch_weather_data_at_location.dart';
import 'package:weather_app/widgets/customs/custom_weather_pages_button.dart';

class NoWeatherBodyWidget extends StatelessWidget {
  const NoWeatherBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "there is no weather now , let's search on city to get the weather there",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 72),
          // device location
          CustomWeatherPagesButton(
            description: "Get the location in your current location 📍",
            onPressed: () async {
              await fetchWeatherDataAtLocation(context: context);
            },
          ),
          const SizedBox(height: 32),
          // search for another location
          CustomWeatherPagesButton(
            description: "Get the location in another location 🕵",
            onPressed: () =>
                Navigator.pushNamed(context, "/search"), // go to SearchPage
          ),
        ],
      ),
    );
  }
}
