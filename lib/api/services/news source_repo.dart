import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newsbloc/model/news.dart';

class NewsSource {
  List<Article> categorySourceList = [];

  //method to fetch news
  Future<void> getNewsSource(String source) async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=9de6c2e484fc472587f9734a8411d9c1";

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
          categorySourceList.add(newsArticleModel);
        }
      });
    }
  }
}
