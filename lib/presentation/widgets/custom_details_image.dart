import 'package:flutter/material.dart';

class CustomDetailImage extends StatelessWidget {
  final String author;

  const CustomDetailImage({Key key, this.author}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(
              'assets/images/news-reporter.png',
              height: 40,
              width: 40,
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
        SizedBox(
          width: 90,
          child: Text(
            author ?? 'Author unknown',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
