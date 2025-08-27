import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/repositories/lessons_repository.dart';
import 'package:volunteering_kemsu/core/view_models/lesson/lessons_state.dart';
import 'package:volunteering_kemsu/core/view_models/lesson/lessons_notifier.dart';

final _lessonsRepositoryProvider = Provider<ILessonsRepository>((ref) {
  return LessonsRepository();
});

final lessonProvider =
    StateNotifierProvider<LessonsNotifier, LessonState>((ref) {
  return LessonsNotifier(ref, ref.watch(_lessonsRepositoryProvider));
});
