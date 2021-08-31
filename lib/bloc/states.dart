import 'package:equatable/equatable.dart';
import 'package:newsbloc/data/export_data.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  //final List<News> newsList;
  final List<Article> newsList;

  NewsLoadedState({this.newsList});
}

//class ArticleLoadedState extends NewsState {
//  final List<Article> newsList;
//  final category;
//
//  ArticleLoadedState({this.newsList, this.category});
//}

class NewsErrorState extends NewsState {
  final error;

  NewsErrorState({this.error});
}
