import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsbloc/presentation/screens/bottom_nav_bar/export_bottom_nav.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             SourceDetails(newsSource: names[index])));
                  Navigator.pushNamed(context, '/sourceDetails',
                      arguments: names[index]);
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
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
                      //Use Aspect ratio insted
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
