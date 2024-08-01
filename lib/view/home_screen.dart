import 'package:flutter/material.dart';
import 'package:news_app_infinte_scrolling/utils/mediaquery.dart';
import 'package:news_app_infinte_scrolling/view_model/news_view_model.dart';
import 'package:news_app_infinte_scrolling/widgets/home_widgets.dart/appbar.dart';
import 'package:news_app_infinte_scrolling/widgets/home_widgets.dart/error_snackbar.dart';
import 'package:news_app_infinte_scrolling/widgets/home_widgets.dart/loading_indicator.dart';
import 'package:news_app_infinte_scrolling/widgets/home_widgets.dart/news_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsViewModel>().fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeScreenAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<NewsViewModel>(
          builder: (context, value, child) {
            if (value.errorMessage != null) {
              errorSnackBar(context, value);
            }
            if (value.isLoading && value.newsModel.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                value.refreshPage();
                await value.fetchNews();
              },
              child: ListView.separated(
                controller: scrollController,
                itemCount: value.newsModel.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: mediaqueryHeight(0.035, context),
                  );
                },
                itemBuilder: (context, index) {
                  final item = value.newsModel[index];
                  return NewsDispalyWidget(item: item);
                },
              ),
            );
          },
        ),
      ),
    );
  }
  // performing fetching function whenever the scroll reaches end of the list
  _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      showLoadingDialog(context);
      await context.read<NewsViewModel>().fetchNews();
      Navigator.pop(context);
    }
  }
}
