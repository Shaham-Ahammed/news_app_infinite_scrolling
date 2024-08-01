import 'package:flutter/material.dart';
import 'package:news_app_infinte_scrolling/model/news_model.dart';
import 'package:news_app_infinte_scrolling/widgets/home_widgets.dart/news_image.dart';
import 'package:news_app_infinte_scrolling/widgets/home_widgets.dart/title_and_date.dart';

class NewsDispalyWidget extends StatelessWidget {
  const NewsDispalyWidget({
    super.key,
    required this.item,
  });

  final NewsModel item;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(18),
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [ImageOfNews(item: item), TitleAndPostedDate(item: item)],
        ),
      ),
    );
  }
}
