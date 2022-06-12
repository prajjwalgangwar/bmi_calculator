import 'package:bmi_calculator/screens/GenderPage.dart';
import 'package:bmi_calculator/screens/HeightPage.dart';
import 'package:bmi_calculator/screens/WeightPage.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: const [
            GenderPage(),
            HeightPage(),
            WeightPage(),
          ],
        ),
      ),
    );
  }
}