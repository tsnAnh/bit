part of 'articles_cubit.dart';

abstract class ArticlesState extends Equatable {}

class ArticlesInitial extends ArticlesState {
  @override
  List<Object?> get props => [];
}

class ArticlesFetched extends ArticlesState {
  final List<Article> articles;

  ArticlesFetched(this.articles);

  @override
  List<Object?> get props => [articles];
}

class ArticlesError extends ArticlesState {
  final DataSourceError error;

  ArticlesError(this.error);

  @override
  List<Object?> get props => [error];
}
