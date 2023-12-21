import 'package:bmi_calculator/widgets/page_title.dart';
import 'package:flutter/material.dart';

import '../widgets/gender_card.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const PageTitle(
          title: 'GENDER',
        ),
        GenderCard(
          imageURL: 'assets/male.png',
          genderText: 'Male',
          widthX: MediaQuery.of(context).size.width / 2,
          heightY: MediaQuery.of(context).size.height / 2,
        ),
        GenderCard(
          imageURL: 'assets/female.png',
          genderText: 'Female',
          widthX: MediaQuery.of(context).size.width / 2,
          heightY: MediaQuery.of(context).size.height / 2,
        ),
        GenderCard(
          imageURL: 'assets/trans.png',
          genderText: 'Others',
          widthX: MediaQuery.of(context).size.width / 2,
          heightY: MediaQuery.of(context).size.height / 2,
        ),
      ],
    );
  }
}
