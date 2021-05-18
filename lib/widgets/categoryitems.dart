import 'package:flutter/material.dart';
import 'package:newsbloc/ui/categoriespage.dart';

//news title category
class TitleCategory extends StatelessWidget {
  final title;

  TitleCategory({this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String titleToLowerCase = title.toString().toLowerCase();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categories(
                      categoryTitle: titleToLowerCase,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
