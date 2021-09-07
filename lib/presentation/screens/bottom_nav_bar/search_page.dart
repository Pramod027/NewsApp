import 'package:flutter/material.dart';
import 'package:newsbloc/data/export_data.dart';
import 'package:newsbloc/presentation/widgets/export_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search news',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        height: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(12),
        child: TextFormField(
          controller: mycontroller,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => NewsSearch(
                    //               categoryTitle: mycontroller.text,
                    //             )));
                    Navigator.pushNamed(context, '/newsSearch',
                        arguments: mycontroller.text);
                  })),
        ),
      ),
    );
  }
}

class NewsSearch extends StatefulWidget {
  final categoryTitle;

  NewsSearch({this.categoryTitle});

  @override
  _NewsSearchState createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  bool isLoading = true;
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async {
    SearchNewsRepo categoryNews = new SearchNewsRepo();
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
          title: Text(
            widget.categoryTitle[0].toString().toUpperCase() +
                widget.categoryTitle.toString().substring(1),
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
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
    return SingleChildScrollView(
        child: Container(
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
              author: newsList[index].author,
            );
          }),
    ));
  }
}
