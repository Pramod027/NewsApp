import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsbloc/data/export_data.dart';
import 'package:newsbloc/presentation/screens/homepage.dart';
import 'bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        allowFontScaling: true,
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'News app',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: BlocProvider(
                child: HomePage(),
                create: (context) => NewsBloc(newsRepository: NewsServices()),
              ),
            ));
  }
}
