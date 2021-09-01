// import 'package:cached_network_image/cached_network_image.dart';
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
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   elevation: 0,
      //   title: Text(widget.title, style: AppStyles().header),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child:
                            // CachedNetworkImage(
                            //   imageUrl: widget.image,
                            //   fit: BoxFit.cover,
                            //   placeholder: (context, url) => Center(
                            //     child: CircularProgressIndicator(),
                            //   ),
                            //   errorWidget: (context, url, error) => Icon(
                            //     Icons.image,
                            //     color: Colors.grey,
                            //   ),
                            // )
                            Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // Text(article.url),
              kSboxH10,
              Text(widget.desc),
            ],
          ),
        ),
      ),
    );
  }
}
