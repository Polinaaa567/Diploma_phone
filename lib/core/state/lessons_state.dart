import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/entities/event/event.dart';
import 'package:volunteering_kemsu/entities/lesson/lesson.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

class LessonState {
  final AsyncValue<Pagination> lessonsList;
  final AsyncValue<Lesson> lessonInfo;
  final int? lessonID;
  final int page;
  final String? error;
  final bool isLoadingMore;

  LessonState({
    this.lessonID,
    this.lessonInfo = const AsyncValue.loading(),
    this.lessonsList = const AsyncValue.loading(),
    this.page = 1,
    this.error,
    this.isLoadingMore = false,
  });

  LessonState copyWith({
    AsyncValue<Pagination>? lessonsList,
    AsyncValue<Lesson>? lessonInfo,
    int? lessonID,
    int? page,
    String? error,
    bool? isLoadingMore,
  }) {
    return LessonState(
      lessonInfo: lessonInfo ?? this.lessonInfo,
      lessonsList: lessonsList ?? this.lessonsList,
      lessonID: lessonID ?? this.lessonID,
      page: page ?? this.page,
      error: error ?? this.error,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

