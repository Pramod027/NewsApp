import 'package:flutter/material.dart';

class Relatedposts extends StatelessWidget {
  final String posts_image;

  const Relatedposts({Key key, this.posts_image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
              image: DecorationImage(image: AssetImage(posts_image))),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
