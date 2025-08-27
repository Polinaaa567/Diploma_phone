import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/core/repositories/news_repository.dart';

import 'package:volunteering_kemsu/core/view_models/news/news_notifier.dart';
import 'package:volunteering_kemsu/core/view_models/news/news_state.dart';

final _newsRepositoryProvider = Provider<INewsRepository>((ref) {
  return NewsRepository();
});

final newsProvider = StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return NewsNotifier(ref, ref.watch(_newsRepositoryProvider));
});
