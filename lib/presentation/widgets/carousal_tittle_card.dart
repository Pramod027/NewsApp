import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselTitleCard extends StatelessWidget {
  final String title;
  final String author;

  const CarouselTitleCard({Key key, this.title, this.author}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  height: 1.4,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  author,
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  author,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
