import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/weather_body_constants.dart';
import 'package:weather_app/functions/datetime_formatter.dart';
import 'package:weather_app/models/current_weather_model.dart';

class NextDaysWeather extends StatelessWidget {
  const NextDaysWeather({
    super.key,
    required this.daysWeatherList,
  });
  final List<GeneralWeatherModel> daysWeatherList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: daysWeatherList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient:
              index == 0 ? WeatherBodyConstants.currentWeatherLinearGradient : WeatherBodyConstants.linearGradientColor,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -40,
              left: 20,
              child: Lottie.asset(
                daysWeatherList[index].imageName,
                height: 120,
                width: 120,
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              left: 20,
              child: Center(
                child: Text(
                  index == 0
                      ? "Today"
                      : getDayName(daysWeatherList[index].lastUpdated),
                  style: WeatherBodyConstants.nextDaysTextStyle,
                ),
              ),
            ),
            // avg temp
            Positioned(
              right: 40,
              top: 10,
              child: Text(
                daysWeatherList[index].avgTemp.round().toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              right: 25,
              top: 2,
              child: Text(
                "o",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 20,
              left: 20,
              child: Center(
                child: Text(
                  daysWeatherList[index].weatherCondition,
                  style: WeatherBodyConstants.nextDaysTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
