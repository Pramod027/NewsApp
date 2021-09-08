import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Relatedposts extends StatelessWidget {
  final String posts_image;

  const Relatedposts({Key key, this.posts_image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200.h,
          width: 150.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                  image: AssetImage(posts_image), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
  }
}
