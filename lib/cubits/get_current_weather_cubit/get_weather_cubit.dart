import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/messages_to_user.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_states.dart';
import 'package:weather_app/functions/check_internet.dart';
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
      bool checkInternet = await isInternetConnected();
      if (checkInternet == true) {
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
      } else {
        emit(FailureWeatherState(
          description: MessagesToUser.noInternet,
        ));
      }
    } on DioException catch (e) {
      // there was an error when get the data from the api
      emit(
        FailureWeatherState(
          description: MessagesToUser.errorWhenRequest,
        ),
      );
      throw Exception(e);
    } catch (e) {
      // the city not found
      emit(
        FailureWeatherState(
          description: MessagesToUser.notFoundCity,
        ),
      );
      return null;
    }
  }

  getWeatherAtDeviceLocation() async {
    String currentLocation = await getLocation();
    emit(LoadingWeatherState());
    try {
      bool checkInternet = await isInternetConnected();
      if (checkInternet == true) {
        // i make the getLocation function to return with empty sentence if can not get the location
        if (currentLocation.isEmpty) {
          // can not get the location
          emit(
            FailureWeatherState(
              description: MessagesToUser.notFoundYourLocation,
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
      } else {
        emit(FailureWeatherState(
          description: MessagesToUser.noInternet,
        ));
      }
    } on Exception catch (e) {
      // there was an error when get the data from the api
      emit(
        FailureWeatherState(
          description: MessagesToUser.errorWhenRequest,
        ),
      );
      throw Exception(e);
    }
  }
}
