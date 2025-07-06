import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/entities/lesson/lesson.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';
import 'package:volunteering_kemsu/core/notifiers/education_repository.dart';

final lessonRepositoryProvider = Provider<LessonsRepository>((ref) {
  return LessonsRepository();
});

final lessonsListProvider = FutureProvider.autoDispose
    .family<Pagination, (int, String)>((ref, params) async {
  final (page, token) = params;

  final repository = ref.watch(lessonRepositoryProvider);
  return repository.fetchAllLessons(page, token);
});

final watchLessonsProvider = FutureProvider.autoDispose
    .family<Lesson, (int, String, int)>((ref, params) async {
  final (page, token, lessonID) = params;

  final repository = ref.watch(lessonRepositoryProvider);
  return repository.sendPoints(page, token, lessonID);
});
