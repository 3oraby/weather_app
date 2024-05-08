import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/home_page_constants.dart';
import 'package:weather_app/functions/datetime_formatter.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/widgets/customs/custom_drop_down_button.dart';

class CurrentWeatherInfo extends StatelessWidget {
  CurrentWeatherInfo({
    super.key,
    required this.generalWeatherModel,
  });

  final GeneralWeatherModel generalWeatherModel;
  final TextStyle currentTextStyle = TextStyle(
    color: Colors.grey[800],
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropDownButton(
            cityName: generalWeatherModel.city,
          ),
          Text(
            "Last Update at ${formatTimeStringWithAMPM(generalWeatherModel.lastUpdated)}",
            style: const TextStyle(
              fontSize: 25,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 64),
          Container(
            height: 250,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(60),
              gradient: linearGradientColor
            ),
            child: Stack(
              clipBehavior: Clip.none,              
              children: [
                // image
                Positioned(
                  left: -40,
                  bottom: 40,
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
                      style: currentTextStyle,
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
                    style: currentTextStyle,
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 15,
                  child: Text(
                    "o",
                    style: currentTextStyle,
                  ),
                ),
                // max temp
                Positioned(
                  left: 60,
                  bottom: 75,
                  child: Text(
                    "${generalWeatherModel.maxTemp.round()} 🔼",
                    style: currentTextStyle,
                  ),
                ),
                // min temp
                Positioned(
                  right: 60,
                  bottom: 75,
                  child: Text(
                    "${generalWeatherModel.minTemp.round()} 🔽",
                    style: currentTextStyle,
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
