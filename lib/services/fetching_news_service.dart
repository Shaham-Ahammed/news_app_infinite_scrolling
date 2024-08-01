import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app_infinte_scrolling/services/api/api.dart';

class NewsFetchingService {
   
  //setting the limit to 20 inorder to only fetch 20 items in desceding order according to id from the api

  Future<http.Response> fetchNewsFromService(int offset) async {
    final Uri uri = Uri.http(API.domain, API.path, {
      'limit': '20',
      'offset': offset.toString(),
      'order': 'id',
      'orderType': 'desc',
    });

    try {
      final response = await http.get(uri);
      log(response.body);
      return response;
    } catch (e) {
      log("error :$e");
      return throw Exception("error while fetching news :$e");
    }
  }
}
