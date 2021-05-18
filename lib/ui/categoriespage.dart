import 'package:flutter/material.dart';
import 'package:newsbloc/api/services/category_news_repo.dart';
import 'package:newsbloc/model/news.dart';
import 'package:newsbloc/widgets/newsblog.dart';

class Categories extends StatefulWidget {
  final categoryTitle;

  Categories({this.categoryTitle});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool isLoading = true;
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews categoryNews = new CategoryNews();
    await categoryNews.getCategoryNews(widget.categoryTitle);
    articles = categoryNews.categoryNewsList;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: Text(
            widget.categoryTitle[0].toString().toUpperCase() +
                widget.categoryTitle.toString().substring(1),
            style: TextStyle(
                fontSize: Theme.of(context).platform == TargetPlatform.iOS
                    ? 17.0
                    : 17.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
//        appBar: header(context,
//            isAppTitle: false,
//            title: widget.categoryTitle[0].toString().toUpperCase() +
//                widget.categoryTitle.toString().substring(1)),
//        backgroundColor: Colors.orange,
        body: isLoading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(), //progress bar
                ),
              )
            : updateUI(articles));
  }

  Widget updateUI(List<Article> newsList) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.95,
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsBlogTile(
                  urlToImage: newsList[index].urlToImage,
                  title: newsList[index].title,
                  description: newsList[index].description,
                  url: newsList[index].url,
                );
              }),
        ),
        Divider(),
      ],
    ));
  }
}
