import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/intro_page_model.dart';

class IntroPageWidget extends StatelessWidget {
  const IntroPageWidget({
    super.key,
    required this.item,
  });

  final IntroPageModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: item.pageColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              item.pageImage,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                item.pageDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
