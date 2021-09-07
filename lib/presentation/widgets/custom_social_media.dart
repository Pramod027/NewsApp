import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSocialMedia extends StatelessWidget {
  final String app_name;
  final String app_image;
  final Color color;

  const CustomSocialMedia({Key key, this.app_name, this.app_image, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          SvgPicture.asset(app_image,
              height: 12, width: 12, color: Colors.white),
          SizedBox(
            width: 3,
          ),
          Text(
            app_name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
