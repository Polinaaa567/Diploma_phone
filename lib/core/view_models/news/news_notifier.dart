import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/models/news/news.dart';
import 'package:volunteering_kemsu/core/models/pagination/pagination.dart';
import 'package:volunteering_kemsu/core/repositories/news_repository.dart';
import 'package:volunteering_kemsu/core/view_models/news/news_state.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final INewsRepository repository;

  final Ref ref;

  NewsNotifier(this.ref, this.repository) : super(NewsState()) {
    fetchAllNews();
  }

  Future<void> fetchAllNews() async {
    final currentPagination = state.newsList.value;
    final Set<Object?> existingIds =
        currentPagination?.news?.map((e) => e.id).toSet() ?? {};

    state = state.copyWith(isLoadingMore: true);

    try {
      final newPagination = await repository.fetchAllNews(state.page);

      final newNews = newPagination.news?.where((news) {
            return !existingIds.contains(news.id);
          }).toList() ??
          [];

      final List<News> mergedNews = [
        ...(currentPagination?.news ?? []),
        ...newNews
      ];

      final mergedPagination = Pagination(
        news: mergedNews,
        total: newPagination.total,
        hasMore: newPagination.hasMore,
      );

      state = state.copyWith(
        newsList: AsyncValue.data(mergedPagination),
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: "Ошибка: $e",
        isLoadingMore: false,
      );
    }
  }

  Future<void> fetchNewsInfo() async {
    state = state.copyWith(newsInfo: const AsyncValue.loading());

    final newsInfo = await repository.fetchNewsInfo(state.newsID);

    state = state.copyWith(newsInfo: AsyncValue.data(newsInfo));
  }

  Future<void> refresh() async {
    state = state.copyWith(
      page: 1,
      newsList: AsyncValue.loading(),
      newsInfo: AsyncValue.loading(),
      newsID: null,
    );
    await fetchAllNews();
  }

  void updateID(int? value) {
    Logger().d(value);
    state = state.copyWith(newsID: value);
  }

  void updatePage() {
    state = state.copyWith(page: state.page + 1);
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }
}
