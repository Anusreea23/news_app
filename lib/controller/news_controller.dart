import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

import 'package:http/http.dart' as http;

class NewsController with ChangeNotifier {
  List<Article>? news = [];
  bool isLoading = false;

  Future<void> getNewsDetails() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=keyword&apiKey=ccb4ed33c49e421db16e143aea9c11d6');

    isLoading = true;
    notifyListeners();
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        log(response.body);
        var article = newsModelFromJson(response.body);
        news = article.articles;
      }
    } catch (error) {
      print('$error');
    }
    isLoading = false;
    notifyListeners();
  }
}
