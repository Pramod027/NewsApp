import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsbloc/data/export_data.dart';

abstract class NewsRepository {
  Future<List<Article>> getAllNews();
}

class NewsServices implements NewsRepository {
  @override
  Future<List<Article>> getAllNews() async {
    //  List<Article> articleList = [];

    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9de6c2e484fc472587f9734a8411d9c1";

    return getData(url);
  }
}

Future<List<Article>> getData(String url) async {
  List<Article> items = [];

  var response = await http.get(url);

  //decode the response into a json object
  var jsonData = jsonDecode(response.body);

  //check if the status of the response is OK
  if (jsonData["status"] == "ok") {
    jsonData["articles"].forEach((item) {
//check if the imageUrl and description are not null
      if (item["urlToImage"] != null && item["description"] != null) {
        //create an object of type NewsArticles
        Article article = new Article(
            author: item["author"],
            title: item["title"],
            description: item["description"],
            url: item["url"],
            urlToImage: item["urlToImage"],
            content: item["content"]);

        //add data to news list
        items.add(article);
      }
    });
  }

  return items;
}
