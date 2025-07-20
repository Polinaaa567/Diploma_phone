import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/providers/auth_providers.dart';
import 'package:volunteering_kemsu/core/state/auth_state.dart';
import 'package:volunteering_kemsu/core/state/lessons_state.dart';
import 'package:volunteering_kemsu/entities/lesson/lesson.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

class LessonsNotifier extends StateNotifier<LessonState> {
  final Ref ref;

  LessonsNotifier(this.ref) : super(LessonState()) {
    fetchAllLessons();
  }

  Future<void> fetchAllLessons() async {
    state = state.copyWith(lessonsList: const AsyncValue.loading(), total: 0);

    final currentPagination = state.lessonsList.value;

    final authState = ref.read(authProvider);

    state = state.copyWith(isLoadingMore: true);

    final http.Response response;

    String? filter;

    if(state.isFiltered == true) {
        filter = "watched";
    } else if (state.isFiltered == false) {
      filter = 'unwatched';
    } else {
      filter = null;
    }

    if (authState.user?.token != null) {
      response = await http.get(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/education?"
            "page=${state.page}&filter=$filter"),
        headers: {
          'Content-Type': 'application/json',
          'token': authState.user?.token ?? '',
        },
      );
    } else {
      response = await http.get(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/education?"
            "page=${state.page}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Logger().d(json);

      final newPagination = Pagination.fromJson(json);

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
    } else {
      state = state.copyWith(
        error: 'Произошла ошибка',
        isLoadingMore: false,
      );
    }
  }

  Future<void>fetchSizeWatched() async{
    final AuthState authState = ref.read(authProvider);

    final http.Response response = await http.get(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/education?"
            "page=${state.page}&filter=watched"),
        headers: {
          'Content-Type': 'application/json',
          'token': authState.user?.token ?? '',
        },
      );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Logger().d(json);

      final newPagination = Pagination.fromJson(json);

      state = state.copyWith(
        watchedSize: newPagination.total,
      );
    } else {
      state = state.copyWith(
        error: 'Произошла ошибка',
      );
    }
  }

  // Future<void>fetchTotalInt() async{
  //
  //   final http.Response response = await http.get(
  //     Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/education?"
  //         "page=${state.page}"),
  //     headers: {
  //       'Content-Type': 'application/json'
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     Logger().d(json);
  //
  //     final newPagination = Pagination.fromJson(json);
  //
  //     state = state.copyWith(
  //       total: newPagination.total,
  //     );
  //   } else {
  //     state = state.copyWith(
  //       error: 'Произошла ошибка',
  //     );
  //   }
  // }

  Future<void> sendPoints() async {
    final token = ref.read(authProvider.select(
      (state) => state.user!.token,
    ));

    final response = await http.get(
      Uri.parse(
          "http://localhost:8080/volunteeringKEMSU/api/education/${state.lessonID}"),
      headers: {
        'Content-Type': 'application/json',
        'token': token ?? '',
      },
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    final message = Lesson.fromJson(json);
    // return message;
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
