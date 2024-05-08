import 'package:flutter/material.dart';

class CustomWeatherPagesButton extends StatelessWidget {
  const CustomWeatherPagesButton({
    super.key,
    required this.description,
    required this.onPressed,
  });

  final String description;
  final Future Function() onPressed;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: BorderRadius.circular(60),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
