import 'package:flutter/material.dart';
import 'package:newsbloc/data/export_data.dart';
import 'package:newsbloc/shared/app_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatefulWidget {
  final Article article;

  const NewsDetails({Key key, this.article}) : super(key: key);
  @override
  _NewsDetailsState createState() => _NewsDetailsState(article);
}

class _NewsDetailsState extends State<NewsDetails> {
  final Article article;

  _NewsDetailsState(this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
          title: Text(
            article.title,
            style: AppStyles().categoryTopic,
          )),
      body: Scaffold(
        body: WebView(
          initialUrl: article.url,
        ),
      ),
    );
  }
}
