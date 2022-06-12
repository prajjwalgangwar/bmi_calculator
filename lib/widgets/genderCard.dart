import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget{
  final String imageURL;
  final String genderText;
  final double widthX;
  final double heightY;

  const GenderCard({Key? key, required this.imageURL, required this.genderText, required this.widthX, required this.heightY}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      height: heightY * 2 * 0.25,
      width: widthX * 2 * 0.65,
      margin: const EdgeInsets.all(5),
      child: Card(
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        elevation: 10,
        child: Stack(
          children: [
            Positioned(
              top: heightY * 0.25 / 2 - 15 ,
              left: widthX * 0.8 / 2,
              child: Container(
                height: heightY  * 0.29 ,
                width: heightY  * 0.99  ,
                decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
            ),
            Positioned(
              top: heightY  * 0.25 / 2 - 15 ,
              left: widthX  * 0.8 / 2 -15 ,
              child: Container(
                padding: const EdgeInsets.all(16),
                height: heightY  * 0.29 ,
                width: heightY  * 0.29  ,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26
                  ),
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageURL)
                  )
                ),
              ),
            ),
            Positioned(
              top: heightY  * 0.40 ,
              left: widthX  * 0.53,
              child: SizedBox(
                height: heightY  * 0.29 ,
                width: heightY  * 0.99  ,
                child: Text(genderText, style:  const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}