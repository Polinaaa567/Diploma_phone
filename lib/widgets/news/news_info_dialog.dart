import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/core/providers/news_providers.dart';

class NewsInfoDialog extends ConsumerWidget {
  const NewsInfoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsInfo = ref.watch(newsProvider.select(
      (state) => state.newsInfo,
    ));

    return newsInfo.when(
      error: (err, stack) => Center(
        child: Text('Ошибка: $err'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (news) {
        return Dialog(

        );
      },
    );
  }
}
