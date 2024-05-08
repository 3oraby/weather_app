import 'package:flutter/material.dart';

const LinearGradient linearGradientColor = LinearGradient(
  colors: [
    Colors.cyan,
    Colors.purple,
    Colors.blue,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
);

const LinearGradient currentWeatherLinearGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 231, 230, 228), 
    Color.fromARGB(255, 146, 149, 167), 
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);