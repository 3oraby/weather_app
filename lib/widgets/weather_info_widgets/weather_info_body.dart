import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/hour_weather_model.dart';
import 'package:weather_app/widgets/customs/custom_declare_details.dart';
import 'package:weather_app/widgets/weather_info_widgets/current_weather_info.dart';
import 'package:weather_app/widgets/weather_info_widgets/next_days_weather_info.dart';
import 'package:weather_app/widgets/weather_info_widgets/next_hours_weather.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.daysWeatherList,
    required this.nextHoursList,
  });

  final List<GeneralWeatherModel> daysWeatherList;
  final List<HourWeatherModel> nextHoursList;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomDeclareDetails(
          description: "Current Weather:",
        ),
        CurrentWeatherInfo(
          generalWeatherModel: daysWeatherList[0], // pass the current weather
        ),
        const Divider(
          color: Colors.grey,
          thickness: 2,
          indent: 60,
          endIndent: 60,
          height: 32,
        ),
        const CustomDeclareDetails(
          description: "Next 24 Hours: ",
        ),
        const SizedBox(height: 8),
        NextHoursWeather(
          nextHoursList: nextHoursList,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 2,
          indent: 60,
          endIndent: 60,
          height: 108,
        ),
        const CustomDeclareDetails(
          description: "Next 7 Days: ",
        ),
        const SizedBox(height: 32),
        NextDaysWeather(
          daysWeatherList: daysWeatherList,
        ),
      ],
    );
  }
}
