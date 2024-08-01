import 'package:flutter/material.dart';
import 'package:news_app_infinte_scrolling/model/news_model.dart';
import 'package:news_app_infinte_scrolling/utils/colors.dart';
import 'package:news_app_infinte_scrolling/utils/custom_text.dart';
import 'package:news_app_infinte_scrolling/utils/mediaquery.dart';
import 'package:timeago/timeago.dart' as timeago;

class TitleAndPostedDate extends StatelessWidget {
  const TitleAndPostedDate({
    super.key,
    required this.item,
  });

  final NewsModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            item.title,
            fontSize: mediaqueryWidth(0.05, context),
            fontColor: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            maxlines: 3,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomText(formatTimeAgo(item.createdAt),
              fontSize: mediaqueryWidth(0.038, context), fontColor: AppColors.blackColor),
        ],
      ),
    );
  }
}

String formatTimeAgo(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  return timeago.format(now.subtract(difference));
}
