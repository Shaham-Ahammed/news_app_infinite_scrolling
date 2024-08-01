import 'package:flutter/material.dart';
import 'package:news_app_infinte_scrolling/model/news_model.dart';
import 'package:news_app_infinte_scrolling/services/api/api.dart';
import 'package:news_app_infinte_scrolling/utils/colors.dart';
import 'package:news_app_infinte_scrolling/utils/mediaquery.dart';

class ImageOfNews extends StatelessWidget {
  const ImageOfNews({
    super.key,
    required this.item,
  });

  final NewsModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        color: AppColors.greyColor,
      ),
      height: mediaqueryHeight(0.25, context),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        child: Image.network(
          API.imageBaseUrl + item.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}