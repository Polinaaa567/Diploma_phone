import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/repositories/news_repository.dart';
import 'package:volunteering_kemsu/entities/news/news.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepository();
});

final newsListProvider =
    FutureProvider.autoDispose.family<Pagination, int>((ref, page) async {
  final repository = ref.watch(newsRepositoryProvider);
  return repository.fetchAllNews(page);
});

final newsInfoProvider =
    FutureProvider.autoDispose.family<News, int>((ref, newsID) async {
  final repository = ref.watch(newsRepositoryProvider);
  return repository.fetchNewsInfo(newsID);
});
