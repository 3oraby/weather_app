import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_states.dart';
import 'package:weather_app/functions/get_location.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/hour_weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<CurrentWeatherState> {
  GetWeatherCubit() : super(InitialNoWeatherState());

  List<GeneralWeatherModel>? daysWeatherList;
  getWeatherFunction({required String cityName}) async {
    emit(LoadingWeatherState()); // emit loading state before getting the data
    try {
      daysWeatherList = await WeatherService().getGeneralWeather(
        cityName: cityName,
      );
      List<HourWeatherModel> nextHoursList =
          await WeatherService().getNextHoursWeather(
        cityName: cityName,
      );
      emit(
        WeatherLoadedSuccessfullyState(
          daysWeatherList: daysWeatherList!,
          nextHoursList: nextHoursList,
        ),
      );
    } on DioException catch (e) {
      // there was an error when get the data from the api
      emit(
        FailureWeatherState(
          description:
              "oops, there was an error when we get the data, try again later",
        ),
      );
      throw Exception(e);
    } catch (e) {
      // the city not found
      emit(
        FailureWeatherState(
          description:
              "The city which you have searched for was not found! Please try searching for another city.",
        ),
      );
      return null;
    }
  }

  getWeatherAtDeviceLocation() async {
    String currentLocation = await getLocation();
    emit(LoadingWeatherState());
    try {
      // i make the getLocation function to return with empty sentence if can not get the location
      if (currentLocation.isEmpty) {
        // can not get the location
        emit(
          FailureWeatherState(
            description:
                "Sorry, We can not find your location try again or search for the city name",
          ),
        );
      } else {
        daysWeatherList = await WeatherService().getGeneralWeather(
          cityName: currentLocation,
        );
        List<HourWeatherModel> nextHoursList =
            await WeatherService().getNextHoursWeather(
          cityName: currentLocation,
        );
        emit(
          WeatherLoadedSuccessfullyState(
            daysWeatherList: daysWeatherList!,
            nextHoursList: nextHoursList,
          ),
        );
      }
    } on Exception catch (e) {
      // there was an error when get the data from the api
      emit(
        FailureWeatherState(
          description:
              "oops, there was an error when we get the data, try again later",
        ),
      );
      throw Exception(e);
    }
  }
}
