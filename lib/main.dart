import 'package:flutter/material.dart';
import 'package:news_app_infinte_scrolling/view/home_screen.dart';
import 'package:news_app_infinte_scrolling/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider<NewsViewModel>(
    create: (_) => NewsViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
