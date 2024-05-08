import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.cityName,
  });

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(40),
      ),
      margin: const EdgeInsets.only(
        left: 8,
        top: 8,
      ),
      padding: const EdgeInsets.all(8),
      child: DropdownButton(
        value: cityName,
        onChanged: (newValue) {},
        borderRadius: BorderRadius.circular(40),
        dropdownColor: Colors.grey[300],
        items: [
          // item 1 "name of the current city"
          DropdownMenuItem(
            value: cityName,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 26,
                ),
                const SizedBox(width: 20),
                Text(
                  cityName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // item 2 "let the user search on another city"
          DropdownMenuItem(
            value: "",
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, "/search"),
              child: const Text("make search for another city"),
            ),
          ),
        ],
      ),
    );
  }
}
