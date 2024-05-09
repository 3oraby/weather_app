import 'package:flutter/material.dart';
import 'package:weather_app/constants/messages_to_user.dart';
import 'package:weather_app/functions/fetch_weather_data_at_location.dart';
import 'package:weather_app/widgets/customs/custom_weather_pages_button.dart';

class FailureBodyWidget extends StatelessWidget {
  const FailureBodyWidget({
    super.key,
    required this.description,
  });
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 128, 11, 2),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Icon(
              Icons.error,
              size: 60,
              color: Color.fromARGB(255, 128, 11, 2),
            ),
            const SizedBox(height: 24),
            CustomWeatherPagesButton(
              description: MessagesToUser.searchAfterErrorInLocation,
              onPressed: () async{
                await fetchWeatherDataAtLocation(context: context);              
              }
            ),
            const SizedBox(height: 24),
            CustomWeatherPagesButton(
              description: MessagesToUser.searchAfterError,
              onPressed: () => Navigator.pushNamed(context, "/search"),
            ),
          ],
        ),
      ),
    );
  }
}
