import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/providers/education_providers.dart';
import 'package:volunteering_kemsu/widgets/lessons/page.dart';

class LessonScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonList = ref.watch(lessonProvider.select(
      (state) => state.lessonsList,
    ));

    final isLoadingMore = ref.watch(lessonProvider.select(
      (state) => state.isLoadingMore,
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(100, 182, 227, 238),
      body: lessonList.when(
        error: (err, stack) => Center(
          child: Text('Ошибка: $err'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (pagination) {
          final lessons = pagination.lessons ?? [];
          final total = pagination.total ?? 0;
          final hasMore = pagination.hasMore ?? false;

          return NotificationListener<ScrollNotification>(
            onNotification: (scroll) {
              if (scroll.metrics.pixels >=
                  scroll.metrics.maxScrollExtent * 0.8) {
                if (hasMore && !isLoadingMore) {
                  ref.read(lessonProvider.notifier).fetchAllLessons();
                }
              }
              return false;
            },
            child: RefreshIndicator(
              onRefresh: () => ref.read(lessonProvider.notifier).refresh(),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.video_camera_back,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Видео-уроки: $total",
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (lessons.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Text('Нет доступных уроков'),
                      )
                    else
                      LessonsAllWidget(lessons: lessons),
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
