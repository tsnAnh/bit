part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({required this.publications, required this.articles});
  final List<Publication> publications;
  final List<Article> articles;

  HomeState copyWith(
      {List<Publication>? publications, List<Article>? articles}) {
    return HomeState(
      publications: publications ?? this.publications,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [publications, articles];
}
