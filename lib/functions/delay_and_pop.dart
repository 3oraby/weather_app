import 'package:flutter/material.dart';

void delayAndPop({required BuildContext context}) {
  // Delay before closing keyboard and navigating to next page
  Future.delayed(const Duration(milliseconds: 500), () {
    // Close the keyboard after search to avoid render
    FocusScope.of(context).unfocus();
    // go to the last page
    Navigator.pop(context);
  });
}
