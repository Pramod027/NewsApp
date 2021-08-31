import 'package:flutter/material.dart';
import 'package:newsbloc/presentation/widgets/carousal_tittle_card.dart';
import 'package:newsbloc/presentation/widgets/custom_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderCard extends StatelessWidget {
  final String title;
  final String author;
  final String image;

  const CarouselSliderCard({Key key, this.title, this.author, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Stack(
        children: <Widget>[
          Container(
              decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            shape: BoxShape.rectangle,
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: image == null
                    ? AssetImage("assets/img/placeholder.jpg")
                    : NetworkImage(image)),
          )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [
                    0.1,
                    0.9
                  ],
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.white.withOpacity(0.0)
                  ]),
            ),
          ),
          Positioned(left: 10, top: 10, child: CustomCard(text: 'Breaking')),
          Positioned(
              bottom: 20,
              left: 10,
              child: CarouselTitleCard(title: title, author: author))
        ],
      ),
    );
  }
}
