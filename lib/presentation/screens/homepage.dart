import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsbloc/bloc/export_bloc.dart';
import 'package:newsbloc/data/export_data.dart';
import 'package:newsbloc/presentation/screens/export_screens.dart';
import 'package:newsbloc/presentation/widgets/export_widget.dart';
import 'package:newsbloc/shared/app_sized_box.dart';
import 'package:newsbloc/shared/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        preferredSize: Size.fromHeight(50.h),
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
        // unselectedFontSize: 9.5,
        // selectedFontSize: 9.5,
        selectedItemColor: Colors.blue,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text("Home",
                    style: TextStyle(fontWeight: FontWeight.w600))),
            icon: Icon(EvaIcons.homeOutline),
            activeIcon: Icon(EvaIcons.home),
          ),
          BottomNavigationBarItem(
            title: Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text("Sources",
                    style: TextStyle(fontWeight: FontWeight.w600))),
            icon: GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => NewsSources()));
                  Navigator.pushNamed(context, '/newsSource');
                },
                child: Icon(EvaIcons.gridOutline)),
            activeIcon: Icon(EvaIcons.grid),
          ),
          BottomNavigationBarItem(
            title: Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text("Search",
                    style: TextStyle(fontWeight: FontWeight.w600))),
            icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/searchScreen');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                child: Icon(EvaIcons.searchOutline)),
            activeIcon: Icon(EvaIcons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  //  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  height: 60.h,
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
                );
              });
        },
        child: Icon(Icons.ac_unit),
      ),
    );
  }

  _newsBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 16.0),
            height: 40.h,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: false,
              height: 200.h,
              viewportFraction: 0.9,
            ),
            items: getExpenseSliders(newsList),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text("Top news", style: AppStyles().categoryTopic),
        ),
        kSboxH10,
        HotNews(),
        kSboxH4,
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text('Published Today', style: AppStyles().categoryTopic),
        ),
        kSboxH4,
        Container(
          height: 250.h,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: newsList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return NewsBlogTile(
                    urlToImage: newsList[index].urlToImage,
                    title: newsList[index].title,
                    description: newsList[index].description,
                    url: newsList[index].url,
                    author: newsList[index].author,
                    content: newsList[index].content,
                    publishedAt: newsList[index].publishedAt);
              }),
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => NewsDetails(
                //               article: article1,
                //             ))
                //             );
                Navigator.pushNamed(context, '/newsDetails',
                    arguments: article1);
              },
              child: CarouselSliderCard(
                title: article1.title,
                author: article1.author,
                image: article1.urlToImage,
              )),
        )
        .toList();
  }
}
