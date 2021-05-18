import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsbloc/api/services/repository.dart';
import 'package:newsbloc/bloc/bloc.dart';
import 'package:newsbloc/bloc/states.dart';
import 'package:newsbloc/model/news.dart';
import 'package:newsbloc/ui/bottom_nav_bar/search_page.dart';
import 'package:newsbloc/widgets/categoryitems.dart';
import 'package:newsbloc/widgets/error_message.dart';
import 'package:newsbloc/widgets/newsblog.dart';

import 'hot_news.dart';
import 'news_details.dart';
import 'bottom_nav_bar/news_source.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoryItems;
  NewsServices services = NewsServices();

  @override
  void initState() {
    super.initState();
    categoryItems = getAllCategories();
    services.getAllNews();
    _loading();
  }

  _loading() async {
    context.bloc<NewsBloc>().add(NewsEvents.fetchNews);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
          title: Text(
            'News App',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: _newsBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 20,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 9.5,
        selectedFontSize: 9.5,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text("Home",
                    style: TextStyle(fontWeight: FontWeight.w600))),
            icon: Icon(EvaIcons.homeOutline),
            activeIcon: Icon(EvaIcons.home),
          ),
          BottomNavigationBarItem(
            title: Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text("Sources",
                    style: TextStyle(fontWeight: FontWeight.w600))),
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsSources()));
                },
                child: Icon(EvaIcons.gridOutline)),
            activeIcon: Icon(EvaIcons.grid),
          ),
          BottomNavigationBarItem(
            title: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text("Search",
                      style: TextStyle(fontWeight: FontWeight.w600))),
            ),
            icon: Icon(EvaIcons.searchOutline),
            activeIcon: Icon(EvaIcons.search),
          )
        ],
      ),
    );
  }

  _newsBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //category list
//          Container(
//            padding:
//                EdgeInsets.symmetric(horizontal: NewsAppConstants().margin16),
//            height: NewsAppConstants().columnHeight70,
//            child: ListView.builder(
//              itemCount: categoryItems.length,
//              itemBuilder: (context, index) {
//                return TitleCategory(
//                  title: categoryItems[index],
//                );
//              },
//              shrinkWrap: true,
//              scrollDirection: Axis.horizontal,
//            ),
//          ),

          Divider(),

          BlocBuilder<NewsBloc, NewsState>(builder: (_, NewsState newsState) {
            //check states and update UI
            if (newsState is NewsErrorState) {
              // shows an error widget when something goes wrong
              final error = newsState.error;
              final errorMsg = "${error.message}\nTap to retry";
              ShowErrorMessage(
                errorMessage: errorMsg,
                onTap: _loading,
              );
            }
            if (newsState is NewsLoadedState) {
              List<Article> newsList = newsState.newsList;
              return updateUI(newsList);
            }

            return Center(child: CircularProgressIndicator());
          }),
        ],
      ),
    );
  }

  Widget updateUI(List<Article> newsList) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: false,
              height: 200.0,
              viewportFraction: 0.9,
            ),
            items: getExpenseSliders(newsList),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text(
                "Hot news",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
            ],
          ),
        ),
        HotNews(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 70.0,
          child: ListView.builder(
            itemCount: categoryItems.length,
            itemBuilder: (context, index) {
              return TitleCategory(
                title: categoryItems[index],
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
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
          ],
        ),
      ],
    );
  }

  //list of items to display as news category
  getAllCategories() {
    List<String> categoryList = [
      "Business",
      "Entertainment",
      "General",
      "Sports",
      "Technology",
      "Health",
      "Science"
    ];
    return categoryList;
  }

  getExpenseSliders(List<Article> articles) {
    return articles
        .map(
          (article1) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetails(
                            article: article1,
                          )));
            },
            child: Container(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                      decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: article1.urlToImage == null
                            ? AssetImage("assets/img/placeholder.jpg")
                            : NetworkImage(article1.urlToImage)),
                  )),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                            0.1,
                            0.9
                          ],
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.white.withOpacity(0.0)
                          ]),
                    ),
                  ),
                  Positioned(
                      bottom: 30.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: 250.0,
                        child: Column(
                          children: <Widget>[
                            Text(
                              article1.title,
                              style: TextStyle(
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 10.0,
                      left: 10.0,
                      child: Text(
                        article1.title,
                        style: TextStyle(color: Colors.white54, fontSize: 9.0),
                      )),
                  Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      child: Text(
                        article1.author,
                        style: TextStyle(color: Colors.white54, fontSize: 9.0),
                      )),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
