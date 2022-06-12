import 'package:bmi_calculator/toggle_cubit/toggle_cubit.dart';
import 'package:bmi_calculator/widgets/toggleUnits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/customButton.dart';
import '../widgets/pageTitle.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PageTitle(title: 'WEIGHT',),
        BlocProvider(
          create: (context) => ToggleCubit(),
          child: ToggleUnits(text1: 'KGS', text2: 'LBS',),
        ),
        Container(
          height: 400,
          color: Colors.blue.shade100,
          margin: const EdgeInsets.only(top: 10),
        ),
        Container(
          height: 80,
          margin: const EdgeInsets.only(top: 30),
          child: const Text('55 KG', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF5780D3), fontSize: 40),),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              bordercolor: Colors.black54,
              height: 40,
              text: 'BACK',
              width: MediaQuery.of(context).size.width * 0.8,
              backgroundcolor: Colors.white,
              leadingiconVisble: true,
              trailingiconVisble: false,
            ),
            CustomButton(
              bordercolor: Colors.white70,
              height: 40,
              text: 'CALCULATE BMI',
              width: MediaQuery.of(context).size.width * 0.8,
              backgroundcolor: const Color(0xFF5780D3),
              leadingiconVisble: false,
              trailingiconVisble: false,
            ),
          ],
        )
      ],
    );
  }
}