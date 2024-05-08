import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/widgets/on_boarding_widgets/intro_page_buttons.dart';

class IntroPageSliderWidget extends StatelessWidget {
  const IntroPageSliderWidget({
    super.key,
    required this.pageController,
    required this.pageNumbers,
  });

  final PageController pageController;
  final int pageNumbers;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // previous button
        IntroPageButtons(
          pageController: pageController,
          buttonDescription: "previous",
          pageNumbers: pageNumbers,
        ),
        // smooth page indicator
        SmoothPageIndicator(
          controller: pageController,
          count: pageNumbers,
          effect: WormEffect(
            spacing: 16,
            dotColor: Colors.grey[300]!,
            activeDotColor: Colors.deepOrange,
          ),
        ),
        // next button
        IntroPageButtons(
          pageController: pageController,
          buttonDescription: "Next",
          pageNumbers: pageNumbers,
        ),
      ],
    );
  }
}
