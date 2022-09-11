import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_paper_api/Model/news_model.dart';
import 'package:news_paper_api/Widget/const.dart';

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=28c995b3691342a082357ec3e9a68055&pageSize=5

class NewsApiService {
  Future<List<Articles>> fetchNewsData() async {
    List<Articles> newsList = [];

    var link = Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=28c995b3691342a082357ec3e9a68055&pageSize=5");

    var response = await http.get(link);

    var data = jsonDecode(response.body);
    Articles articles;
    for (var i in data["articles"]) {
      articles = Articles.fromJson(i);
      newsList.add(articles);
    }
    return newsList;
  }
}
