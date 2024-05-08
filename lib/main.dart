import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_states.dart';
import 'package:weather_app/functions/get_theme_color.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/pages/on_boarding_page.dart';
import 'package:weather_app/pages/search_page.dart';

void main() async {
  // to know it is the first time to open the app or not
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isFirstTime = preferences.getBool("isFirstTime") ?? true;
  runApp(
    WeatherApp(isFirstTime: isFirstTime),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    super.key,
    required this.isFirstTime,
  });
  final bool isFirstTime;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(), // create cubit
      child: Builder(
        // to provide a new context which come after the create cubit in the tree widget
        builder: (context) =>
            // use bloc builder to change the theme automatic when user search about city
            BlocBuilder<GetWeatherCubit, CurrentWeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .daysWeatherList?[0]
                      .weatherCondition,
                ),
              ),
              routes: {
                "/intro": (context) => const OnBoardingPage(),
                "/home": (context) => const HomePage(),
                "/search": (context) => const SearchPage(),
              },
              initialRoute: isFirstTime ? "/intro" : "/home",
            );
          },
        ),
      ),
    );
  }
}
