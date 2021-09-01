import 'package:flutter/material.dart';
import 'package:newsbloc/data/export_data.dart';
import 'package:newsbloc/presentation/widgets/export_widget.dart';
import 'package:newsbloc/shared/app_styles.dart';

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
              style: AppStyles().header),
        ),
        body: isLoading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(), //progress bar
                ),
              )
            : updateUI(articles));
  }

  Widget updateUI(List<Article> newsList) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsBlogTile(
            urlToImage: newsList[index].urlToImage,
            title: newsList[index].title,
            description: newsList[index].description,
            author: newsList[index].author,
            url: newsList[index].url,
          );
        });
  }
}
