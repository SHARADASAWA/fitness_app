import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PageView(
              children: [
                _builPageIndicator(
                    imageAsset: 'assets/OnBoardingImages/Onboarding1.jpg'),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                )
              ],
            )
          ],
        ));
  }

  Widget _builPageIndicator({required String imageAsset}) {
    return Stack(
      children: [
        Image.asset(
          imageAsset,
          height: 300.0,
        )
      ],
    );
  }
}
