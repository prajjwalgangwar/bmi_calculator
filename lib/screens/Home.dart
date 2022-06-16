import 'package:bmi_calculator/screens/GenderPage.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: GenderPage(),
          )),
    );
  }
}
