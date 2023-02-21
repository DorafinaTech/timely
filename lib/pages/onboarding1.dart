import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:timely/pages/onboarding.dart';
import 'package:timely/pages/onboarding1.dart';
import 'package:timely/pages/onboarding2.dart';

class NewOnboarding extends StatelessWidget {
  NewOnboarding({Key? key}) : super(key: key);
  final PageController _controller = PageController();
  static const routeName = "/onboarding1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Onboarding2(),
              Onboarding(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.5),
            child: SmoothPageIndicator(controller: _controller, count: 3),
          ),

        ],
      ),
    );
  }
}