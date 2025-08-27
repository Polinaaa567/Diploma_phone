import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/models/news/news.dart';
import 'package:volunteering_kemsu/core/models/pagination/pagination.dart';

class NewsState {
  final AsyncValue<Pagination> newsList;
  final AsyncValue<News> newsInfo;
  final int? newsID;
  final int page;
  final String? error;
  final bool isLoadingMore;
  final bool isExpanded;

  NewsState({
    this.page = 1,
    this.error = '',
    this.newsID,
    this.newsInfo = const AsyncValue.loading(),
    this.newsList = const AsyncValue.loading(),
    this.isLoadingMore = false,
    this.isExpanded = false,
  });

  NewsState copyWith({
    AsyncValue<Pagination>? newsList,
    AsyncValue<News>? newsInfo,
    int? newsID,
    int? page,
    String? error,
    bool? isLoadingMore,
    bool? isExpanded,
  }) {
    return NewsState(
      newsList: newsList ?? this.newsList,
      newsInfo: newsInfo ?? this.newsInfo,
      page: page ?? this.page,
      error: error ?? this.error,
      newsID: newsID ?? this.newsID,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
