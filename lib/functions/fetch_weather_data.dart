import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';

Future<void> fetchWeatherData({
  required BuildContext context,
  required String cityName,
}) async {
  // access on the cubit
  GetWeatherCubit cubit = BlocProvider.of<GetWeatherCubit>(context);
  // make the request from api then show the data
  await cubit.getWeatherFunction(
    cityName: cityName,
  );
}
