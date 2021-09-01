// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsbloc/presentation/screens/bottom_nav_bar/new_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsBlogTile extends StatelessWidget {
  final urlToImage, title, description, url, author;

  NewsBlogTile(
      {@required this.urlToImage,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewPage(
                    title: title, image: urlToImage, desc: description)));
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child:
                          // CachedNetworkImage(
                          //   imageUrl: urlToImage,
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
                        urlToImage,
                        fit: BoxFit.cover,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 1.2,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          author == null ? 'Author' : author,
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
