import 'package:flutter/material.dart';

MaterialColor getThemeColor(String ?weatherCondition) {
  if (weatherCondition == null){
    return Colors.indigo;
  }
  switch (weatherCondition.toLowerCase()) {
    case "sunny":
      return Colors.orange;
    case "clear":
      return Colors.yellow;
    case "partly cloudy":
      return Colors.lightBlue;
    case "cloudy":
    case "overcast":
      return Colors.blueGrey;
    case "mist":
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "thundery outbreaks possible":
    case "blowing snow":
    case "blizzard":
    case "fog":
    case "freezing fog":
      return Colors.grey;
    case "patchy light drizzle":
    case "light drizzle":
    case "freezing drizzle":
    case "heavy freezing drizzle":
    case "light freezing rain":
    case "moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "patchy light rain":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
    case "light sleet":
    case "moderate or heavy sleet":
      return Colors.blue;
    case "patchy light snow":
    case "light snow":
      return Colors.cyan;
    case "patchy moderate snow":
    case "moderate snow":
      return Colors.indigo;
    case "patchy heavy snow":
    case "heavy snow":
      return Colors.deepPurple;
    case "ice pellets":
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return Colors.lightGreen;
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.amber;
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.red;
    default:
      return Colors.grey; 
  }
}
