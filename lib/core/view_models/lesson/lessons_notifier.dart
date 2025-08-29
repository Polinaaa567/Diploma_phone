import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/core/repositories/lessons_repository.dart';
import 'package:volunteering_kemsu/core/view_models/lesson/lessons_state.dart';

class LessonsNotifier extends StateNotifier<LessonState> {
  final ILessonsRepository repository;

  final Ref ref;

  LessonsNotifier(this.ref, this.repository) : super(LessonState()) {
    fetchAllLessons();
  }

  Future<void> fetchAllLessons() async {
    state = state.copyWith(lessonsList: const AsyncValue.loading(), total: 0);

    final currentPagination = state.lessonsList.value;

    final authState = ref.read(userInfoProvider);

    state = state.copyWith(isLoadingMore: true);

    String? filter;

    if (state.isPassedLessons == true && state.isNotPassedLessons == false && state.isAllLessons == false) {
      filter = "watched";
    } else if (state.isPassedLessons == false && state.isNotPassedLessons == true && state.isAllLessons == false) {
      filter = 'unwatched';
    } else {
      filter = null;
    }

    final newPagination = await repository.fetchAllLessons(
      state.page,
      filter,
      authState.token,
    );

    final mergedPagination = currentPagination?.copyWith(
          lessons: [
            ...(currentPagination.lessons ?? []),
            ...(newPagination.lessons ?? []),
          ],
          total: newPagination.total,
          hasMore: newPagination.hasMore,
        ) ??
        newPagination;

    state = state.copyWith(
      lessonsList: AsyncValue.data(mergedPagination),
      isLoadingMore: false,
      page: state.page + 1,
      total: mergedPagination.total,
    );
  }

  Future<void> fetchSizeWatched() async {
    final token = ref.read(userInfoProvider.select(
          (state) => state.user!.token,
    ));

    final total = await repository.fetchSizeWatched(
      token,
      state.page,
    );

    state = state.copyWith(
      watchedSize: total,
    );
  }

  Future<void> sendPoints() async {
    final token = ref.read(userInfoProvider.select(
      (state) => state.user!.token,
    ));

    Logger().d(' lesson id ${state.lessonID}');
    await repository.sendPoints(state.lessonID, token);

    // final Lessons? user = state.userProfile;
    // if (user != null) {
    //   final updatedUser = user.copyWith(patronymic: value);
    //   state = state.copyWith(userProfile: updatedUser);
    // }

  }

  Future<void> refresh() async {
    state = state.copyWith(
      page: 1,
      lessonsList: AsyncValue.loading(),
      lessonID: null,
    );

    await fetchAllLessons();
  }

  void updateID(int? value) {
    Logger().d(value);
    state = state.copyWith(lessonID: value);
  }

  void isAllLessons() {
    state = state.copyWith(isAllLessons: true);
    state = state.copyWith(isPassedLessons: false);
    state = state.copyWith(isNotPassedLessons: false);
  }

  void isPassedLessons() {
    state = state.copyWith(isAllLessons: false);
    state = state.copyWith(isPassedLessons: true);
    state = state.copyWith(isNotPassedLessons: false);
  }

  void isNotPassedLessons() {
    state = state.copyWith(isAllLessons: false);
    state = state.copyWith(isPassedLessons: false);
    state = state.copyWith(isNotPassedLessons: true);
  }

  void statePage() {
    state = state.copyWith(page: 1);
  }
}
