import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/weather_body_constants.dart';
import 'package:weather_app/functions/datetime_formatter.dart';
import 'package:weather_app/models/hour_weather_model.dart';

class CustomNextHoursWidget extends StatelessWidget {
  const CustomNextHoursWidget({
    super.key,
    required this.hourWeatherModel,
    required this.isCurrent,
  });

  final HourWeatherModel hourWeatherModel;
  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // must define it to make the container show
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
        gradient: isCurrent
            ? WeatherBodyConstants.currentWeatherLinearGradient
            : WeatherBodyConstants.linearGradientColor,
      ),
      child: Column(
        children: [
          Lottie.asset(
            hourWeatherModel.imageName,
            width: 80,
            height: 80,
          ),
          Text(formatTimeStringWithAMPM(hourWeatherModel.hour),
              style: WeatherBodyConstants.nextHoursTextStyle),
          const SizedBox(height: 8),
          Text(hourWeatherModel.avgTemp.round().toString(),
              style: WeatherBodyConstants.nextHoursTextStyle),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              hourWeatherModel.weatherCondition,
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
