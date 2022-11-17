import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/error.dart';
import '../../../domain/domain.dart';
import '../../../models/domain/article.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit(this.mediumRepository) : super(ArticlesInitial());

  final MediumRepository mediumRepository;

  void fetchArticles(String publication) {
    mediumRepository
        .getArticlesByPublication([publication], shuffled: false).then((value) {
      value.fold(
        ifLeft: (error) => emit(ArticlesError(error)),
        ifRight: (articles) => emit(ArticlesFetched(articles)),
      );
    });
  }
}
