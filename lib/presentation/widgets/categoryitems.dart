import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsbloc/presentation/screens/export_screens.dart';

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
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                padding: EdgeInsets.all(10.w),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
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
