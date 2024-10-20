import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/new_res_model.dart';

class SearchScreenController with ChangeNotifier {
  NewResModel? newResModel;
  List<Article> newsArticle = [];
  bool isLoading = false;
  onSearch(String keyword) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$keyword&apiKey=5dba0d2367d546cb9b92306a7c73fc4e");
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        newResModel = newResModelFromJson(res.body);
        if (newResModel != null) {
          newsArticle = newResModel!.articles ?? [];
        }
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
