import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/core/state/lessons_state.dart';

import 'package:volunteering_kemsu/core/notifiers/education_notifier.dart';

final lessonProvider = StateNotifierProvider<LessonsNotifier, LessonState>((ref) {
  return LessonsNotifier(ref);
});
