import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_infinte_scrolling/model/news_model.dart';
import 'package:news_app_infinte_scrolling/services/fetching_news_service.dart';

class NewsViewModel extends ChangeNotifier {
  bool _isLoading = false;
  final NewsFetchingService _newsFetchingService = NewsFetchingService();
  final List<NewsModel> _newsModelList = [];
  int _offset = 0;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  int get offset => _offset;
  List<NewsModel> get newsModel => _newsModelList;
  String? get errorMessage => _errorMessage;

  void refreshPage() {
    // clearing the list and starting fetching again from initial stage
    _newsModelList.clear();
    _offset = 0;
    notifyListeners();
  }

  Future<void> fetchNews() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      // waiting for response after making the api call
      final http.Response response =
          await _newsFetchingService.fetchNewsFromService(_offset);
      if (response.statusCode == 200) {
       
        final List<dynamic> body = jsonDecode(response.body);
       // after successfull fetching we take the required elements to disaplay of UI in the form of NewsModel and add it to list  
        for (var element in body) {
          final news = NewsModel.fromJson(element);
          _newsModelList.add(news);
        }
        // incrementing the offset (starting point of fetching data) to 20 after every successfull fetching
        _offset += 20;
      } else {
        _errorMessage = "Fetching failed with status code ${response.statusCode}";
        log(_errorMessage!);
      }
    } catch (e) {
      _errorMessage = 'Error while fetching news: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
