import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_current_weather_states.dart';
import 'package:weather_app/drawers/home_page_drawer.dart';
import 'package:weather_app/widgets/others/failure_body_widget.dart';
import 'package:weather_app/widgets/others/loading_body_widget.dart';
import 'package:weather_app/widgets/weather_info_widgets/no_weather_body_widget.dart';
import 'package:weather_app/widgets/weather_info_widgets/weather_info_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomePageDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Weather Conditions",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<GetWeatherCubit, CurrentWeatherState>(
              builder: (context, state) {
            if (state is InitialNoWeatherState) {
              return const NoWeatherBodyWidget();
            } else if (state is FailureWeatherState) {
              return FailureBodyWidget(
                description: state.description,
              );
            } else if (state is WeatherLoadedSuccessfullyState) {
              return WeatherInfoBody(
                daysWeatherList: state.daysWeatherList,
                nextHoursList: state.nextHoursList,
              );
            } else {
              return const LoadingBodyWidget();
            }
          }),
        ],
      ),
    );
  }
}
