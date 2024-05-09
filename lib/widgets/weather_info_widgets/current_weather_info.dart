import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/weather_body_constants.dart';
import 'package:weather_app/functions/datetime_formatter.dart';
import 'package:weather_app/models/current_weather_model.dart';

class CurrentWeatherInfo extends StatelessWidget {
  const CurrentWeatherInfo({
    super.key,
    required this.generalWeatherModel,
  });

  final GeneralWeatherModel generalWeatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20),
            ),
            // declare the name of the city to user
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(width: 20),
                Text(
                  generalWeatherModel.city,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "Last Update at ${formatTimeStringWithAMPM(generalWeatherModel.lastUpdated)}",
              style: const TextStyle(
                fontSize: 25,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 64),
          Container(
            height: 300,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(70),
              gradient: WeatherBodyConstants.linearGradientColor,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // image
                Positioned(
                  left: -40,
                  bottom: 70,
                  child: Lottie.asset(
                    generalWeatherModel.imageName,
                    width: 350,
                    height: 350,
                  ),
                ),
                // weather condition
                Positioned(
                  bottom: 20,
                  right: 10,
                  left: 10,
                  child: Center(
                    child: Text(
                      generalWeatherModel.weatherCondition,
                      style: WeatherBodyConstants.currentTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                // avg temp
                Positioned(
                  right: 40,
                  top: 30,
                  child: Text(
                    "${generalWeatherModel.avgTemp.round()}",
                    style: WeatherBodyConstants.currentTextStyle,
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 15,
                  child: Text(
                    "o",
                    style: WeatherBodyConstants.currentTextStyle,
                  ),
                ),
                // max temp
                Positioned(
                  left: 60,
                  bottom: 75,
                  child: Text(
                    "${generalWeatherModel.maxTemp.round()} 🔼",
                    style: WeatherBodyConstants.currentTextStyle,
                  ),
                ),
                // min temp
                Positioned(
                  right: 60,
                  bottom: 75,
                  child: Text(
                    "${generalWeatherModel.minTemp.round()} 🔽",
                    style: WeatherBodyConstants.currentTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
