import 'package:flutter/material.dart';
import 'package:weather_app/constants/intro_pages_data.dart';
import 'package:weather_app/models/intro_page_model.dart';
import 'package:weather_app/widgets/on_boarding_widgets/get_started_button.dart';
import 'package:weather_app/widgets/on_boarding_widgets/intro_page_widget.dart';
import 'package:weather_app/widgets/on_boarding_widgets/intro_page_buttons.dart';
import 'package:weather_app/widgets/on_boarding_widgets/intro_pages_slider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              // check about the index of the page
              setState(() {
                // return true if the value become equal to the index of the last page
                isLastPage = (value == IntroPageData.introPagesDataList.length - 1);
              });
            },
            children: [
              for (IntroPageModel item in IntroPageData.introPagesDataList)
                IntroPageWidget(item: item),
            ],
          ),
          // skip button which move you to the last page
          Align(
            alignment: Alignment(isLastPage ? -1 : 1, -0.8),
            child: IntroPageButtons(
              pageController: pageController,
              buttonDescription: isLastPage ? "previous" : "Skip",
              pageNumbers: IntroPageData.introPagesDataList.length,
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.75),
            child: isLastPage
                ? const GetStartedButton()
                : IntroPageSliderWidget(
                    pageController: pageController,
                    pageNumbers: IntroPageData.introPagesDataList.length,
                  ),
          ),
        ],
      ),
    );
  }
}
