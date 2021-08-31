import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsbloc/data/export_data.dart';

class HotNewsRepo {
  List<Article> hotNewsList = [];

  //method to fetch news
  Future<void> getHotNewsREpo() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df74fc47f0dd401bb5e56c34893a7795";

    var response = await http.get(url);

    //decode the response into a json object
    var jsonData = jsonDecode(response.body);

    //check if the status of the response is OK
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((item) {
//check if the imageUrl and description are not null
        if (item["urlToImage"] != null && item["description"] != null) {
          //create an object of type NewsArticles
          Article newsArticleModel = new Article(
              author: item["author"],
              title: item["title"],
              description: item["description"],
              url: item["url"],
              urlToImage: item["urlToImage"],
              content: item["content"]);

          //add data to news list
          hotNewsList.add(newsArticleModel);
        }
      });
    }
  }
}
