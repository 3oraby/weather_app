import 'package:weather_app/functions/get_suitable_image_name.dart';

class GeneralWeatherModel {
  GeneralWeatherModel({
    required this.city,
    required this.lastUpdated,
    required this.weatherCondition,
    required this.imageName,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
  });

  // data which we want from the api to show
  final String city;
  final String lastUpdated;
  final String weatherCondition;
  final String imageName;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;

  factory GeneralWeatherModel.fromJson({
    required Map<String, dynamic> json,
    required int index,
  }) {
    Map<String, dynamic> forecastDay = json["forecast"]["forecastday"][index];
    return GeneralWeatherModel(
      city: json["location"]["name"],
      lastUpdated: forecastDay["hour"][0]["time"],
      weatherCondition: forecastDay["day"]["condition"]["text"],
      imageName: getSuitableImageName(forecastDay["day"]["condition"]["text"]),
      avgTemp: forecastDay["day"]["avgtemp_c"],
      maxTemp: forecastDay["day"]["maxtemp_c"],
      minTemp: forecastDay["day"]["mintemp_c"],
    );
  }

}
