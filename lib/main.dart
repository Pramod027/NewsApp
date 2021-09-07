import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsbloc/data/export_data.dart';
import 'package:newsbloc/shared/app_navigation.dart';
import 'bloc/bloc.dart';
import 'presentation/screens/onboarding_screens/export_onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key key, this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        allowFontScaling: true,
        builder: () => MultiBlocProvider(
              providers: [
                BlocProvider<NewsBloc>(
                  create: (context) => NewsBloc(newsRepository: NewsServices()),
                )
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'News app',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                // home: BlocProvider(
                //   child: HomePage(),
                //   create: (context) => NewsBloc(newsRepository: NewsServices()),
                // ),
                initialRoute: '/',
                onGenerateRoute: AppRouter.onGenerateRoute,
              ),
            ));
  }
}
