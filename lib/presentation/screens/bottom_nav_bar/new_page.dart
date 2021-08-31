import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsbloc/shared/app_sized_box.dart';
import 'package:newsbloc/shared/app_styles.dart';

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
        title: Text(widget.title, style: AppStyles().header),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 4 / 2,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                          // height: MediaQuery.of(context).size.height * 1 / 3,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      left: 10.w,
                      child: DecoratedBox(
                        child: Padding(
                          padding: EdgeInsets.all(8.h),
                          child:
                              Text('Current News', style: AppStyles().black600),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    )
                  ],
                ),
                // Text(article.url),
                kSboxH10,
                Text(widget.desc),

                // Text(article.content)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
