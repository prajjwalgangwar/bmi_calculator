import 'package:bmi_calculator/AppConstants.dart';
import 'package:bmi_calculator/widgets/pageTitle.dart';
import 'package:flutter/material.dart';

import '../widgets/genderCard.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PageTitle(
          title: 'GENDER',
        ),
        GenderCard(
          imageURL: AppConstants.maleLogo,
          genderText: 'Male',
          widthX: MediaQuery.of(context).size.width / 2,
          heightY: MediaQuery.of(context).size.height / 2,
        ),
        GenderCard(
          imageURL: AppConstants.femaleLogo2,
          genderText: 'Female',
          widthX: MediaQuery.of(context).size.width / 2,
          heightY: MediaQuery.of(context).size.height / 2,
        ),
        GenderCard(
          imageURL: AppConstants.transLogo,
          genderText: 'Others',
          widthX: MediaQuery.of(context).size.width / 2,
          heightY: MediaQuery.of(context).size.height / 2,
        ),
      ],
    );
  }
}
