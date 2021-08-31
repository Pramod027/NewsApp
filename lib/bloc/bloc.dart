import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsbloc/bloc/export_bloc.dart';
import 'package:newsbloc/data/export_data.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  //List<News> newsList;
  List<Article> newsList;

  // final NewsRepo newsRepository;
  final NewsRepository newsRepository;

  NewsBloc({this.newsRepository}) : super(NewsInitialState());

  @override
  Stream<NewsState> mapEventToState(NewsEvents event) async* {
    switch (event) {
      case NewsEvents.fetchNews:
        yield NewsLoadingState();
        try {
          newsList = (await newsRepository.getAllNews());
          yield NewsLoadedState(newsList: newsList);
        } on SocketException {
          NewsErrorState(
              error: NoInternetException(errorMessage: "No Internet"));
        } on FormatException {
          NewsErrorState(
              error: InvalidFormatException(message: "Invalid response"));
        } on HttpException {
          yield NewsErrorState(
              error: NoServicesFoundException(message: "No Services found"));
        } catch (e) {
          yield NewsErrorState(
              error:
                  UnknownErrorException(message: "An Unknown error occurred"));
        }
    }
  }
}

//Events.dart
enum NewsEvents {
  fetchNews,
}
