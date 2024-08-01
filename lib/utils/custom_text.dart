import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final int? maxlines;

  const CustomText(this.text,
      {required this.fontSize,
      this.maxlines,
      required this.fontColor,
      this.fontWeight = FontWeight.normal,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
     
      text,
       maxLines: maxlines,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
    );
  }
}
