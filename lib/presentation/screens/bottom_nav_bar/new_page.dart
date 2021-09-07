import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsbloc/presentation/widgets/custom_details_image.dart';
import 'package:newsbloc/presentation/widgets/custom_social_media.dart';
import 'package:newsbloc/presentation/widgets/related_post.dart';
import 'package:newsbloc/shared/app_sized_box.dart';
import 'package:newsbloc/shared/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPage extends StatefulWidget {
  final String title;
  final String desc;
  final String image;
  final String author;
  final String publishedAt;
  final String content;

  const NewPage(
      {Key key,
      this.title,
      this.desc,
      this.image,
      this.author,
      this.publishedAt,
      this.content})
      : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Positioned(
              top: 0,
              child: Container(
                  // height: 100,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.15,
                          child: CustomDetailImage(
                            author: widget.author,
                          ))
                    ],
                  )),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                // height: 100,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                // color: Colors.blue,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kSboxH10,
                      Text(
                        widget.title,
                        style: AppStyles().categoryTopic,
                      ),
                      kShboxH12,
                      Text(widget.desc ?? 'description'),
                      kSboxH8,
                      Align(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            widget.image,
                            height: 150.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      kShboxH12,
                      Text(
                        'Share this Post',
                        style: AppStyles().categoryTopic,
                      ),
                      kSboxH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomSocialMedia(
                            app_image: 'assets/vector/facebook.svg',
                            app_name: 'facebook',
                            color: Colors.blue,
                          ),
                          CustomSocialMedia(
                            app_image: 'assets/vector/twitter.svg',
                            app_name: 'Twitter',
                            color: Colors.red,
                          ),
                          CustomSocialMedia(
                            app_image: 'assets/vector/instagram.svg',
                            app_name: 'Instagram',
                            color: Colors.pink,
                          ),
                        ],
                      ),
                      kShboxH12,
                      Text(
                        'Related Posts',
                        style: AppStyles().categoryTopic,
                      ),
                      kSboxH8,
                      SizedBox(
                        height: 150.h,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Relatedposts(
                              posts_image: 'assets/screenshots/homepage.png',
                            ),
                            Relatedposts(
                              posts_image: 'assets/screenshots/homepage.png',
                            ),
                            Relatedposts(
                              posts_image: 'assets/screenshots/homepage.png',
                            ),
                            Relatedposts(
                              posts_image: 'assets/screenshots/homepage.png',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
