import 'package:flutter/material.dart';
import 'package:newsbloc/model/news.dart';
import 'package:newsbloc/ui/news_details.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:newsbloc/api/services/hot_news_repo.dart';

class HotNews extends StatefulWidget {
  @override
  _HotNewsState createState() => _HotNewsState();
}

class _HotNewsState extends State<HotNews> {
  bool isLoading = true;
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();

    getHotNews();
  }

  getHotNews() async {
    HotNewsRepo categoryNews = new HotNewsRepo();
    await categoryNews.getHotNewsREpo();
    articles = categoryNews.hotNewsList;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return updateUI(articles);
  }

  Widget updateUI(List<Article> newsList) {
    return Container(
      height: 250,
      padding: EdgeInsets.all(5.0),
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsDetails(
                              article: newsList[index],
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          1.0,
                          1.0,
                        ),
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 150,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0)),
                            image: DecorationImage(
                                image: newsList[index].urlToImage == null
                                    ? AssetImage(
                                        'assets/images/placeholder.jpg')
                                    : NetworkImage(newsList[index].urlToImage),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        newsList[index].title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(height: 1.3, fontSize: 15.0),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          width: 180,
                          height: 1.0,
                          color: Colors.black12,
                        ),
                        Container(
                          width: 30,
                          height: 3.0,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
//                                  Text(
//                                    snapshot.data.articles[index].source.name
//                                        .toString(),
//                                    style: TextStyle(
//                                        color: Colors.black, fontSize: 9.0),
//                                  ),
                          SizedBox(
                            width: 5,
                          ),
//                          Text(
//                            timeUntil(DateTime.parse(
//                                newsList[index].publishedAt.toString())),
//                            style:
//                                TextStyle(color: Colors.black, fontSize: 9.0),
//                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
