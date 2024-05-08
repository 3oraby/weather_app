import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/home_page_constants.dart';
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
    return ListView.separated(
      shrinkWrap: true,
      itemCount: daysWeatherList.length,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        thickness: 1,
        indent: 40,
        endIndent: 40,
        height: 64,
        color: Colors.blueGrey[900],
      ),
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.all(16),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(40),
          gradient:
              index == 0 ? currentWeatherLinearGradient : linearGradientColor,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -40,
              left: 20,
              child: Lottie.asset(
                daysWeatherList[index].imageName,
                height: 100,
                width: 100,
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                    fontSize: 25,
                  ),
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
