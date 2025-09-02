import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/models/lesson/lesson.dart';
import 'package:volunteering_kemsu/core/models/pagination/pagination.dart';

class LessonState {
  final AsyncValue<Pagination> lessonsList;
  final AsyncValue<Lesson> lessonInfo;
  final int? lessonID;
  final int page;
  final bool isLoadingMore;
  final int? total;
  final int? watchedSize;
  final bool isAllLessons;
  final bool isPassedLessons;
  final bool isNotPassedLessons;


  LessonState({
    this.lessonID,
    this.lessonInfo = const AsyncValue.loading(),
    this.lessonsList = const AsyncValue.loading(),
    this.page = 1,
    this.isLoadingMore = false,
    this.total,
    this.watchedSize,
    this.isAllLessons = true,
    this.isNotPassedLessons = false,
    this.isPassedLessons = false,
  });

  LessonState copyWith({
    AsyncValue<Pagination>? lessonsList,
    AsyncValue<Lesson>? lessonInfo,
    int? lessonID,
    int? page,
    bool? isLoadingMore,
    int? total,
    int? watchedSize,
    bool? isAllLessons,
    bool? isPassedLessons,
    bool? isNotPassedLessons,
  }) {
    return LessonState(
      lessonInfo: lessonInfo ?? this.lessonInfo,
      lessonsList: lessonsList ?? this.lessonsList,
      lessonID: lessonID ?? this.lessonID,
      page: page ?? this.page,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      total: total ?? this.total,
      watchedSize: watchedSize ?? this.watchedSize,
      isAllLessons: isAllLessons ?? this.isAllLessons,
      isPassedLessons: isPassedLessons ?? this.isPassedLessons,
      isNotPassedLessons: isNotPassedLessons ?? this.isNotPassedLessons,
    );
  }
}

