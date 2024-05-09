import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/messages_to_user.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_current_weather_cubit/get_weather_states.dart';
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
        backgroundColor: const Color.fromARGB(255, 40, 117, 153),
        title: Text(
          MessagesToUser.homePageAppBarTitle,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        // search icon to go to search page
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/search"),
            icon: const Icon(
              Icons.location_searching_outlined,
              size: 35,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, CurrentWeatherState>(
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
    );
  }
}
