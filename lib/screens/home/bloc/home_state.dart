part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState(
      {required this.publications, required this.articles, this.error});

  final List<Publication> publications;
  final List<Article> articles;
  final DataSourceError? error;

  HomeState copyWith(
      {List<Publication>? publications,
      List<Article>? articles,
      DataSourceError? error}) {
    return HomeState(
      publications: publications ?? this.publications,
      articles: articles ?? this.articles,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [publications, articles, error];
}
