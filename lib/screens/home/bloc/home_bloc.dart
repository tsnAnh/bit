import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../../../models/domain/article.dart';
import '../../../models/domain/publication.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.mediumRepository)
      : super(const HomeState(articles: [], publications: [])) {
    on<LoadHome>(_onLoadHome);
  }

  final MediumRepository mediumRepository;

  void _onLoadHome(LoadHome event, Emitter<HomeState> emitter) async {
    await mediumRepository.getPublications().then(
          (value) => value.fold(
            ifLeft: (error) {},
            ifRight: (publications) => emitter.call(
              state.copyWith(
                publications: publications
                  ..sort(
                    (a, b) => a.name.compareTo(b.name),
                  ),
              ),
            ),
          ),
        );
    await mediumRepository
        .getArticlesByPublication(
            state.publications.map((e) => e.url).toList())
        .then(
          (value) => value.fold(
            ifLeft: (error) {},
            ifRight: (articles) => emitter.call(
              state.copyWith(
                articles: articles,
              ),
            ),
          ),
        );
  }
}
