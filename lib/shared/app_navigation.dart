import 'package:flutter/material.dart';
import 'package:newsbloc/presentation/screens/bottom_nav_bar/news_source.dart';
import 'package:newsbloc/presentation/screens/bottom_nav_bar/search_page.dart';
import 'package:newsbloc/presentation/screens/export_screens.dart';
import 'package:newsbloc/presentation/screens/news_details.dart';
import 'package:newsbloc/presentation/screens/onboarding_screens/screens/onbearding_page.dart';
import 'package:newsbloc/shared/app_screens.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
        break;

      case newsSource:
        return MaterialPageRoute(builder: (_) => NewsSources());
        break;

      case searchScreen:
        return MaterialPageRoute(builder: (_) => SearchScreen());
        break;
      case newsDetails:
        return MaterialPageRoute(
            builder: (_) => NewsDetails(
                  article: args,
                ));
        break;
      case sourceDetails:
        return MaterialPageRoute(
            builder: (_) => SourceDetails(
                  newsSource: args,
                ));
        break;
      case newsSearch:
        return MaterialPageRoute(
            builder: (_) => NewsSearch(
                  categoryTitle: args,
                ));
        break;

      default:
        return null;
    }
  }
}
