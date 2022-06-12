import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final Color bordercolor;
  final double width;
  final double height;
  final Color backgroundcolor;
  final bool leadingiconVisble;
  final bool trailingiconVisble;
  final String text;



  CustomButton(
      {required this.bordercolor,
        required this.leadingiconVisble,
        required this.trailingiconVisble,
      required this.width,
      required this.height,
      required this.backgroundcolor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: OutlinedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(width, 40)),
          side: MaterialStateProperty.all(BorderSide(
            color: bordercolor,
          )),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all(backgroundcolor)
        ),
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: leadingiconVisble,
                  child: const Icon(Icons.arrow_back_rounded, color: Colors.black54,size: 16,)),
              Text(text, style: TextStyle(fontSize: 18, color: bordercolor),),
              Visibility(
                  visible: trailingiconVisble,
                  child: const Icon(Icons.arrow_right_alt, color: Colors.white70,)),

            ],
          )
      ),
    );
  }

}