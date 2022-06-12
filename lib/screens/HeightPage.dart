import 'package:bmi_calculator/toggle_cubit/toggle_cubit.dart';
import 'package:bmi_calculator/widgets/pageTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/customButton.dart';
import '../widgets/toggleUnits.dart';

class HeightPage extends StatelessWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PageTitle(
          title: 'HEIGHT',
        ),
        BlocProvider(
  create: (context) => ToggleCubit(),
  child: ToggleUnits(text1: 'Meters', text2: 'Feet',),
),
        Container(
          margin: const EdgeInsets.only(top: 10),
          color: Colors.blue.shade100,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Stack(
            children: [

            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                bordercolor: Colors.black54,
                height: 40,
                text: 'BACK',
                width: MediaQuery.of(context).size.width * 0.35,
                backgroundcolor: Colors.white,
                leadingiconVisble: true,
              trailingiconVisble: false,
            ),
            CustomButton(
              bordercolor: Colors.white70,
              height: 40,
              text: 'NEXT',
              width: MediaQuery.of(context).size.width * 0.35,
              backgroundcolor: const Color(0xFF5780D3),
              leadingiconVisble: false,
              trailingiconVisble: true,
            ),
          ],
        )
      ],
    );
  }
}
