import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final String title;
  final String desc;
  final String image;

  const NewPage({Key key, this.title, this.desc, this.image}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: Theme.of(context).platform == TargetPlatform.iOS
                  ? 17.0
                  : 17.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 1 / 3,
                ),
              ),
              // Text(article.url),
              SizedBox(height: 10),
              Text(widget.desc),
              SizedBox(height: 10),
              // Text(article.content)
            ],
          ),
        ),
      ),
    );
  }
}
