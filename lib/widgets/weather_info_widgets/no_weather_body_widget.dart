import 'package:flutter/material.dart';
import 'package:weather_app/constants/messages_to_user.dart';
import 'package:weather_app/functions/fetch_weather_data_at_location.dart';
import 'package:weather_app/widgets/customs/custom_weather_pages_button.dart';

class NoWeatherBodyWidget extends StatelessWidget {
  const NoWeatherBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Text(
                  MessagesToUser.primaryBodyMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 72),
                // device location
                CustomWeatherPagesButton(
                  description: MessagesToUser.getWeatherLocation,
                  onPressed: () async {
                    await fetchWeatherDataAtLocation(context: context);
                  },
                ),
                const SizedBox(height: 32),
                // search for another location
                CustomWeatherPagesButton(
                  description: MessagesToUser.searchFirstTime,
                  onPressed: () async{
                      Navigator.pushNamed(context, "/search"); // go to SearchPage
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
