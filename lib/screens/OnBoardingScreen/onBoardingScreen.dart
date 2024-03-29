import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: ClipRect(
          child: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [
                  _builPageIndicator(
                      text: 'MEET YOUR COACH, \n START YOUR JOURNEY',
                      imageAsset:
                          'assets/OnBoardingImages/img_background_3.png'),
                  _builPageIndicator(
                      text: 'ACTION IS THE \n KEY TO SUCCESS',
                      imageAsset:
                          'assets/OnBoardingImages/img_background_2.png'),
                  _builPageIndicator(
                      text: 'CREATE A PERSONAL \n WORKOUT PLAN',
                      imageAsset:
                          'assets/OnBoardingImages/img_background_1.png'),
                ],
              ),
              isLastPage
                  ? const SizedBox.shrink()
                  : Positioned(
                      top: size.height * 0.05,
                      right: size.width * 0.05,
                      child: TextButton(
                        onPressed: () {
                          controller.animateToPage(2,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              isLastPage
                  ? Positioned(
                      left: size.width * 0.25,
                      bottom: size.height * 0.09,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 20),
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(208, 253, 62, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Positioned(
                  bottom: size.height * 0.045,
                  left: size.width * 0.415,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: Color.fromRGBO(208, 253, 62, 1),
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget _builPageIndicator(
      {required String text, required String imageAsset}) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          imageAsset,
          height: size.height * 0.6,
          width: size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: -1,
          child: Container(
            height: size.height * 0.4,
            width: size.width,
            child: Center(
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
