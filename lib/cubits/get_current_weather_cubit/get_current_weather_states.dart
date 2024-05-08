import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/hour_weather_model.dart';

class CurrentWeatherState {}

class WeatherLoadedSuccessfullyState extends CurrentWeatherState {
  WeatherLoadedSuccessfullyState({
    required this.daysWeatherList,
    required this.nextHoursList,
  });
  final List<GeneralWeatherModel> daysWeatherList;
  final List<HourWeatherModel> nextHoursList;
}

class InitialNoWeatherState extends CurrentWeatherState {}

class LoadingWeatherState extends CurrentWeatherState {}

class FailureWeatherState extends CurrentWeatherState {
  final String description;

  FailureWeatherState({required this.description});
}
