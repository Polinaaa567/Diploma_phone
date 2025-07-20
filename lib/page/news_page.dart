import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/core/providers/news_providers.dart';
import 'package:volunteering_kemsu/widgets/news/news_card.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsList = ref.watch(newsProvider.select(
      (state) => state.newsList,
    ));

    final isLoadingMore = ref.watch(newsProvider.select(
      (state) => state.isLoadingMore,
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(84, 222, 248, 251),
      body: newsList.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: Text('Ошибка: $err'),
        ),
        data: (data) {
          final news = data.news ?? [];
          final total = data.total ?? 0;
          final hasMore = data.hasMore ?? false;

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent * 0.8) {
                if (hasMore && !isLoadingMore) {
                  ref.read(newsProvider.notifier)
                    ..updatePage()
                    ..fetchAllNews();
                }
              }
              return false;
            },
            child: RefreshIndicator(
              onRefresh: () => ref.read(newsProvider.notifier).refresh(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              Colors.blue,
                              Colors.lightBlueAccent
                            ],
                            tileMode: TileMode.mirror,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Новости: $total",
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    news.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.all(32.0),
                            child: Text("Нет новостей"),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 17,
                            ),
                            itemCount: news.length,
                            itemBuilder: (context, index) => NewsCard(
                              news: news[index],
                            ),
                          ),
                    if (isLoadingMore)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
