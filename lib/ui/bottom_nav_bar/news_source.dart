import 'package:flutter/material.dart';
import 'package:newsbloc/ui/bottom_nav_bar/source_details.dart';

class NewsSources extends StatefulWidget {
  @override
  _NewsSourcesState createState() => _NewsSourcesState();
}

class _NewsSourcesState extends State<NewsSources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          itemCount: news.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SourceDetails(newsSource: names[index])));
                },
                child: Container(
                  width: 100,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(news[index]),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(names[index]),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<String> news = [
  'assets/logos/abc-news.png',
  'assets/logos/bbc-news.png',
  'assets/logos/cbc-news.png',
  'assets/logos/cbs-news.png',
  'assets/logos/cnn.png',
  'assets/logos/espn.png',
  'assets/logos/fox-news.png',
  'assets/logos/google-news.png',
  'assets/logos/abc-news.png',
  'assets/logos/bbc-news.png',
  'assets/logos/cbc-news.png',
  'assets/logos/cbs-news.png',
  'assets/logos/cnn.png',
  'assets/logos/espn.png',
  'assets/logos/fox-news.png',
  'assets/logos/google-news.png'
];
List<String> names = [
  'abc-news',
  'bbc-news',
  'cbc-news',
  'cbs-news',
  'cnn',
  'espn',
  'fox-news',
  'google-news',
  'abc-news',
  'bbc-news',
  'cbc-news',
  'cbs-news',
  'cnn',
  'espn',
  'fox-news',
  'google-news'
];
