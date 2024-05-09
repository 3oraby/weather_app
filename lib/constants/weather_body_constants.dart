import 'package:flutter/material.dart';

class WeatherBodyConstants {
  static LinearGradient linearGradientColor = const LinearGradient(
    colors: [
      Colors.cyan,
      Color.fromARGB(255, 6, 75, 132),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
  );

  static LinearGradient currentWeatherLinearGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 214, 213, 210),
      Color.fromARGB(255, 194, 230, 164),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static TextStyle currentTextStyle = TextStyle(
    color: Colors.grey[900],
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  static TextStyle nextDaysTextStyle = TextStyle(
    color: Colors.grey[900],
    fontSize: 27,
    fontWeight: FontWeight.bold,
  );

  static TextStyle nextHoursTextStyle = TextStyle(
    color: Colors.grey[900],
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
