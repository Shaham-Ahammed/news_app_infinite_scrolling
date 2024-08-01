import 'package:flutter/material.dart';

double mediaqueryHeight(double height, BuildContext context) {
  return MediaQuery.of(context).size.height * height;
}

double mediaqueryWidth(double width, BuildContext context) {
  return MediaQuery.of(context).size.width * width;
}
