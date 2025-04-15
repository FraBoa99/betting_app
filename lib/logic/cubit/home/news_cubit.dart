import 'package:betting_app/core/repository/news_repository.dart';
import 'package:betting_app/data/models/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> articleList;

  NewsLoaded({required this.articleList});

  NewsLoaded copyWith({
    List<Article>? articleList,
  }) {
    return NewsLoaded(
      articleList: articleList ?? this.articleList,
    );
  }
}

class NewsError extends NewsState {}

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;

  NewsCubit({required this.newsRepository}) : super(NewsInitial());

  void fetchNews(String sportName) async {
    emit(NewsLoading());
    try {
      final articles = await newsRepository.getArticles(sportName);
      if (state is NewsLoaded) {
        final currentState = state as NewsLoaded;
        emit(currentState.copyWith(articleList: articles));
      } else {
        emit(NewsLoaded(articleList: articles));
      }
    } catch (e) {
      emit(NewsError());
    }
  }
}
