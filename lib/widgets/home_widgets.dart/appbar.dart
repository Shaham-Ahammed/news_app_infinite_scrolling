import 'package:flutter/material.dart';
import 'package:news_app_infinte_scrolling/utils/colors.dart';
import 'package:news_app_infinte_scrolling/utils/mediaquery.dart';
import 'package:news_app_infinte_scrolling/utils/paths.dart';
import 'package:news_app_infinte_scrolling/utils/texts.dart';

  AppBar homeScreenAppBar(context) {
    return AppBar(
      backgroundColor: AppColors.greyColor,
      leading: Image.asset(ImagePaths.logoImage),
      title: GradientText(
        text: ConstantTexts.title,
        style:  TextStyle(
          fontSize: mediaqueryWidth(0.07, context),
          fontWeight: FontWeight.bold,
        ),
        gradient: LinearGradient(
          colors: [AppColors.redColor, AppColors.blackColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }




class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({super.key, 
    required this.text,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}