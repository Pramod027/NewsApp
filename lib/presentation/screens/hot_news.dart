import 'package:flutter/material.dart';
import 'package:newsbloc/data/export_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsbloc/presentation/screens/export_screens.dart';
import 'package:newsbloc/shared/export_shared.dart';

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
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newsList.length,
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
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
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                              image: NetworkImage(newsList[index].urlToImage),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 10,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 15.0, bottom: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(newsList[index].title,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: AppStyles().black600),
                            kSboxH4,
                            Text(
                                newsList[index].author == null
                                    ? 'Author'
                                    : newsList[index].author,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: AppStyles().blueAccent800),
                            kSboxH4,
                            Text(
                                newsList[index].author == null
                                    ? 'Date'
                                    : newsList[index].author,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: AppStyles().grey400),
                          ],
                        ),
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
}
