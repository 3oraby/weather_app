import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({super.key});

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  
  @override
  void initState() {
    super.initState();
    setPreferences();
  }

  void setPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isFirstTime", false);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: (){
        Navigator.pushReplacementNamed(context, "/home");
      },
      child: Container(
        height: 70,
        width: screenWidth,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Center(
          child: Text(
            "Get Started",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
