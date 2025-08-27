import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/core/repositories/events_repository.dart';
import 'package:volunteering_kemsu/core/view_models/event/event_state.dart';

class EventNotifier extends StateNotifier<EventState> {
  final IEventsRepository repository;

  final Ref ref;

  EventNotifier(this.ref, this.repository) : super(EventState()) {
    fetchAllEvents();
  }

  Future<void> fetchAllEvents() async {
    final currentPagination = state.eventList.value;
    state = state.copyWith(isLoadingMore: true);

    try {
      final newPagination = await repository.fetchAllEvents(state.page);

      final mergedPagination = currentPagination?.copyWith(
            events: [
              ...(currentPagination.events ?? []),
              ...(newPagination.events ?? []),
            ],
            total: newPagination.total,
            hasMore: newPagination.hasMore,
          ) ??
          newPagination;

      Logger().d(mergedPagination);

      state = state.copyWith(
        eventList: AsyncValue.data(mergedPagination),
        page: state.page + 1,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: "Ошибка: $e",
        isLoadingMore: false,
      );
    }
  }

  Future<void> fetchPastEventsUser() async {
    state = state.copyWith(error: null);
    final authState = ref.read(userInfoProvider);

    try {
      final eventsPastPagination = await repository.fetchPastEventsUser(
        state.page,
        authState.user?.token,
      );

      state = state.copyWith(eventList: AsyncValue.data(eventsPastPagination));
    } catch (e) {
      state = state.copyWith(
        error: "Ошибка: $e",
      );
    }
  }

  Future<void> fetchFutureEventsUser() async {
    state = state.copyWith(error: null);
    final authState = ref.read(userInfoProvider);

    try {
      final eventsFuturePagination = await repository.fetchFutureEventsUser(
        state.page,
        authState.user?.token,
      );
      state = state.copyWith(
        eventList: AsyncValue.data(eventsFuturePagination),
      );
    } catch (e) {
      state = state.copyWith(error: "Ошибка: $e");
    }
  }

  Future<void> fetchEventsBetweenDate() async {
    state = state.copyWith(error: null);

    try {
      final eventsBetweenDatePagination =
          await repository.fetchEventsBetweenDate(
        state.dateStart,
        state.dateEnd,
        state.page,
      );

      state = state.copyWith(
        eventList: AsyncValue.data(eventsBetweenDatePagination),
      );
    } catch (e) {
      state = state.copyWith(
        error: "Ошибка: $e",
      );
    }
  }

  Future<void> fetchEventInfo() async {
    state = state.copyWith(eventInfo: const AsyncValue.loading());

    Logger().d("rdf ${state.eventID}");
    final authState = ref.read(userInfoProvider);

    final eventInfo =
        await repository.fetchEventInfo(authState.user?.token, state.eventID);
    state = state.copyWith(eventInfo: AsyncValue.data(eventInfo));
  }

  Future<void> signUp() async {
    final authState = ref.read(userInfoProvider);

    await repository.signUp(authState.token, state.eventID);
  }

  Future<void> deleteSignUp(int userID) async {
    final authState = ref.read(userInfoProvider);

    await repository.deleteSignUp(authState.token, state.eventID);
  }

  Future<void> refresh() async {
    state = state.copyWith(
      page: 1,
      eventList: AsyncValue.loading(),
      eventInfo: AsyncValue.loading(),
      eventID: null,
      dateStart: '',
      dateEnd: '',
    );

    await fetchAllEvents();
  }

  void updateID(int? value) {
    Logger().d(value);
    state = state.copyWith(eventID: value);
  }

  void updateDateStart(String? start) {
    state = state.copyWith(dateStart: start);
  }

  void updateDateEnd(String? end) {
    state = state.copyWith(dateEnd: end);
  }
}
