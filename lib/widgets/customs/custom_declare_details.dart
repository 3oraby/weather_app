import 'package:flutter/material.dart';

class CustomDeclareDetails extends StatelessWidget {
  const CustomDeclareDetails({
    super.key,
    required this.description,
  });

  final String description;
  @override
  Widget build(BuildContext context) {
    // use the column to make the container take the least width
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 220,
          height: 60,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
