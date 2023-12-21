import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 26),
          children: <TextSpan>[
            const TextSpan(
                text: 'SELECT YOUR ',
                style: TextStyle(fontWeight: FontWeight.w300)),
            TextSpan(
                text: title,
                style: const TextStyle(fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
