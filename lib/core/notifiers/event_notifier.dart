import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/providers/auth_providers.dart';
import 'package:volunteering_kemsu/core/state/event_state.dart';
import 'package:volunteering_kemsu/entities/event/event.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

class EventNotifier extends StateNotifier<EventState> {
  final Ref ref;

  EventNotifier(this.ref) : super(EventState()) {
    fetchAllEvents();
  }

  Future<void> fetchAllEvents() async {
    final currentPagination = state.eventList.value;

    state = state.copyWith(isLoadingMore: true);

    try {
      final response = await http.get(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/events?"
            "page=${state.page}"),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        Logger().d(json);

        final newPagination = Pagination.fromJson(json);

        final mergedPagination = currentPagination?.copyWith(
          events: [
            ...(currentPagination.events ?? []),
            ...(newPagination.events ?? []),
          ],
          total: newPagination.total,
          hasMore: newPagination.hasMore,
        ) ?? newPagination;

        Logger().d(mergedPagination);

        state = state.copyWith(
          eventList: AsyncValue.data(mergedPagination),
          page: state.page + 1,
          isLoadingMore: false,
        );
      } else {
        state = state.copyWith(
          error: 'Произошла ошибка',
          isLoadingMore: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        error: "Ошибка: $e",
        isLoadingMore: false,
      );
    }
  }

  Future<void> fetchPastEventsUser() async {
    state = state.copyWith(error: null);
    final authState = ref.read(authProvider);

    try {
      final response = await http.get(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/events/past?"
            "page=${state.page}"),
        headers: {
          'Content-Type': 'application/json',
          'token': authState.user?.token ?? "",
        },
      );

      final json = jsonDecode(response.body);
      Logger().d(json);

      final eventsPastPagination = Pagination.fromJson(json);
      state = state.copyWith(eventList: AsyncValue.data(eventsPastPagination));
    } catch (e) {
      state = state.copyWith(
        error: "Ошибка: $e",
      );
    }
  }

  Future<void> fetchFutureEventsUser() async {
    state = state.copyWith(error: null);
    final authState = ref.read(authProvider);

    try {
      final response = await http.get(
          Uri.parse(
              "http://192.168.1.34:8080/volunteeringKEMSU/api/events/future?"
              "page=${state.page}"),
          headers: {
            'Content-Type': 'application/json',
            'token': authState.user?.token ?? "",
          });

      final json = jsonDecode(response.body);
      Logger().d(json);

      final eventsFuturePagination = Pagination.fromJson(json);
      state =
          state.copyWith(eventList: AsyncValue.data(eventsFuturePagination));
    } catch (e) {
      state = state.copyWith(error: "Ошибка: $e");
    }
  }

  Future<void> fetchEventsBetweenDate() async {
    state = state.copyWith(error: null);

    try {
      final response = await http.get(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/events?"
            "dateStart=${state.dateStart}&"
            "dateEnd=${state.dateEnd}&"
            "page=${state.page}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final json = jsonDecode(response.body);
      Logger().d(json);

      final eventsBetweenDatePagination = Pagination.fromJson(json);

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
    final http.Response response;
    final authState = ref.read(authProvider);

    if (authState.user?.token != null) {
      response = await http.get(
        Uri.parse(
            "http://192.168.1.34:8080/volunteeringKEMSU/api/events/${state.eventID}"),
        headers: {
          'Content-Type': 'application/json',
          'token': authState.user?.token ?? "",
        },
      );
    } else {
      response = await http.get(
        Uri.parse(
            "http://192.168.1.34:8080/volunteeringKEMSU/api/events/${state.eventID}"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    }

    final json = jsonDecode(response.body);
    Logger().d(json);

    final eventInfo = Event.fromJson(json);
    state = state.copyWith(eventInfo: AsyncValue.data(eventInfo));
  }

  Future<void> signUp() async {
    final authState = ref.read(authProvider);

    final response = await http.post(
      Uri.parse(
          "http://192.168.1.34:8080/volunteeringKEMSU/api/events/sign-up"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'userID': authState.user?.id,
        'eventID': state.eventID,
      },
    );

    final json = jsonDecode(response.body);
    Logger().d(json);
  }

  Future<void> deleteSignUp(int userID) async {
    final authState = ref.read(authProvider);

    final response = await http.post(
        Uri.parse(
            "http://localhost:8080/volunteeringKEMSU/api/events/${state.eventID}/users/${authState.user?.id}"),
        headers: {
          'Content-Type': 'application/json',
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    // final signUpInEvent = Event.fromJson(json);
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
