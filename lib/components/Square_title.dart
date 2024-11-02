import 'package:flutter/material.dart';


class SquareTitles extends StatelessWidget {
  final String imagepath;

  const SquareTitles({super.key, required this.imagepath});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
      ),


      child: Image.asset(
        imagepath, 
        height: 30),
        );
  }
}