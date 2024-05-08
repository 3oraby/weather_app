import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingBodyWidget extends StatelessWidget {
  const LoadingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/animations/download data.json"),
    );
  }
}
