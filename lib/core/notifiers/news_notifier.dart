import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/state/news_state.dart';
import 'package:volunteering_kemsu/entities/news/news.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final Ref ref;

  NewsNotifier(this.ref) : super(NewsState()) {
    fetchAllNews();
  }

  Future<void> fetchAllNews() async {
    final currentPagination = state.newsList.value;
    final Set<Object?> existingIds =
        currentPagination?.news?.map((e) => e.id).toSet() ?? {};

    state = state.copyWith(isLoadingMore: true);

    try {
      final response = await http.get(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/news?"
            "page=${state.page}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        Logger().d(json);

        final newPagination = Pagination.fromJson(json);

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
      } else {
        state = state.copyWith(
          error: 'Произошла ошибка',
          isLoadingMore: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        error: "Ошибка: $e",
        isLoadingMore: false,
      );
    }
  }

  Future<void> fetchNewsInfo() async {
    state = state.copyWith(newsInfo: const AsyncValue.loading());

    final response = await http.get(
      Uri.parse(
          "http://192.168.1.34:8080/volunteeringKEMSU/api/news?newsID=${state.newsID}"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    final newsInfo = News.fromJson(json);

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
}
