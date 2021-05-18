import 'package:flutter/material.dart';
import 'package:newsbloc/ui/bottom_nav_bar/new_page.dart';

class NewsBlogTile extends StatelessWidget {
  final urlToImage, title, description, url;

  NewsBlogTile(
      {@required this.urlToImage,
      @required this.title,
      @required this.description,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewPage(
                    title: title, image: urlToImage, desc: description)));
      },
      child: Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(urlToImage)),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
