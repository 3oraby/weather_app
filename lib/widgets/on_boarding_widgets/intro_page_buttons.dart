import 'package:flutter/material.dart';

class IntroPageButtons extends StatelessWidget {
  const IntroPageButtons({
    super.key,
    required this.pageController,
    required this.buttonDescription,
    required this.pageNumbers,
  });

  final PageController pageController;
  final String buttonDescription;
  final int pageNumbers;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        if (buttonDescription == "Next") {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        } else if (buttonDescription == "previous") {
          pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        } else if (buttonDescription == "Skip") {
          pageController.jumpToPage(pageNumbers-1);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 120,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            buttonDescription,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
