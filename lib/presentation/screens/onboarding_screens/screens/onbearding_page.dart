import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:newsbloc/presentation/screens/export_screens.dart';
import 'package:newsbloc/presentation/screens/onboarding_screens/export_onboarding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Create new issues',
              body: 'Create,share,assign new issues whenever,wherever ',
              image: buildImage('assets/vector/onboarding1.svg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Stay connected',
              body:
                  "Doing great work with your team shouldn't stop when you're on the go",
              image: buildImage('assets/vector/onboarding2.svg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Respond quickly',
              body:
                  'Collaborate with your team with comments and direct mentions',
              image: buildImage('assets/vector/onboarding3.svg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Today a reader, tomorrow a leader',
              body: 'Start your journey',
              footer: ButtonWidget(
                text: 'Start Reading',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('assets/vector/onboarding4.svg'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );

  Widget buildImage(String path) =>
      Center(child: SvgPicture.asset(path, width: 350.w));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10.w, 10.h),
        activeSize: Size(22.w, 10.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20.sp),
        descriptionPadding: EdgeInsets.all(16.h).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24.w),
        pageColor: Colors.white,
      );
}
