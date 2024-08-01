 import 'package:flutter/material.dart';
import 'package:news_app_infinte_scrolling/utils/colors.dart';
import 'package:news_app_infinte_scrolling/view_model/news_view_model.dart';

  void errorSnackBar(BuildContext context, NewsViewModel value) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
            backgroundColor: AppColors.redColor,
            content: Center(child: Text(value.errorMessage!))),
      );
    });
  }
