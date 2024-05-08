import 'package:flutter/material.dart';
import 'package:weather_app/models/intro_page_model.dart';

final List<IntroPageModel> introPagesDataList = [
  IntroPageModel(
    pageColor: const Color.fromARGB(255, 67, 79, 87),
    pageDescription: "Weather App ",
    pageImage: "assets/animations/intro gif1.json",
  ),
  IntroPageModel(
    pageColor: const Color.fromARGB(255, 8, 77, 83),
    pageDescription: "you can search for the current and future weather in any city now",
    pageImage: "assets/animations/intro gif2.json",
  ),
  IntroPageModel(
    pageColor: const Color.fromARGB(255, 44, 43, 43),
    pageDescription: "let's make search now for the weather in your city or in another city 🔍",
    pageImage: "assets/animations/intro gif3.json",
  ),
];
