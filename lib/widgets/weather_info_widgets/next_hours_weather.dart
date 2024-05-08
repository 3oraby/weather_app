import 'package:flutter/material.dart';
import 'package:weather_app/models/hour_weather_model.dart';
import 'package:weather_app/widgets/customs/custom_next_hours_widget.dart';

class NextHoursWeather extends StatelessWidget {
  const NextHoursWeather({
    super.key,
    required this.nextHoursList
  });
  final List<HourWeatherModel> nextHoursList;
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scrollbar(
      controller: scrollController,
      thickness: 5,
      radius: const Radius.circular(40),
      interactive: true,
      thumbVisibility: true,
      trackVisibility: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: SizedBox(
          height: 250,
          child: ListView.separated(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: nextHoursList.length,
            separatorBuilder: (context, index) => const VerticalDivider(
              width: 30,
              thickness: 1,
            ),
            itemBuilder: (context, index) => CustomNextHoursWidget(
              hourWeatherModel: nextHoursList[index],  
            ),
          ),
        ),
      ),
    );
  }
}
