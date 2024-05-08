
import 'package:dio/dio.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/hour_weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  // to control the url in all service methods
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "bbdad22fad3b4242aa164548242304";
  final int nDays = 7;

  Future<List<GeneralWeatherModel>> getGeneralWeather(
      {required String cityName}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=$nDays",
      );
      List<GeneralWeatherModel> daysWeatherList = [];

      for (int i = 0; i < 7; i++) {
        daysWeatherList.add(
          GeneralWeatherModel.fromJson(
            json: response.data,
            index: i,
          ),
        );
      }
      return daysWeatherList;
    } on DioException catch (err) {
      // error in statues code which dio check on auto
      final String errMessage = err.response?.data["error"]["message"] ??
          "oops there was an error , try later";
      throw Exception(errMessage);
    } catch (e) {
      // any another error
      throw Exception("oops");
    }
  }

  Future<List<HourWeatherModel>> getNextHoursWeather(
      {required String cityName}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=$nDays",
      );
      List hour = response.data["forecast"]["forecastday"][0]["hour"];
      List<HourWeatherModel> nextHoursList = [];
      for (int i = 0; i < 24; i++) {
        nextHoursList.add(HourWeatherModel.fromJson(json: hour[i]));
      }
      return nextHoursList;
    } on DioException catch (err) {
      // error in statues code which dio check on auto
      final String errMessage = err.response?.data["error"]["message"] ??
          "oops there was an error , try later";
      throw Exception(errMessage);
    } catch (e) {
      // any another error
      throw Exception("oops");
    }
  }
}
