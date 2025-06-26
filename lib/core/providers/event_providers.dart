import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/entities/event/event.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';
import 'package:volunteering_kemsu/core/repositories/event_repository.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepository();
});

final eventListProvider =
    FutureProvider.autoDispose.family<Pagination, int>((ref, page) async {
  final repository = ref.watch(eventRepositoryProvider);
  return repository.fetchAllEvents(page);
});

final eventListPastProvider = FutureProvider.autoDispose
    .family<Pagination, (int, String)>((ref, params) async {
  final (page, token) = params;
  final repository = ref.watch(eventRepositoryProvider);
  return repository.fetchPastEventsUser(page, token);
});

final eventListFutureProvider = FutureProvider.autoDispose
    .family<Pagination, (int, String)>((ref, params) async {
  final (page, token) = params;
  final repository = ref.watch(eventRepositoryProvider);
  return repository.fetchFutureEventsUser(page, token);
});

final eventListBetweenDateProvider = FutureProvider.autoDispose
    .family<Pagination, (int, String, String)>((ref, params) async {
  final (page, dateStert, dateEnd) = params;
  final repository = ref.watch(eventRepositoryProvider);
  return repository.fetchEventsBetweenDate(page, dateStert, dateEnd);
});

final eventInfoProvider = FutureProvider.autoDispose
    .family<Event, (int, String)>((ref, params) async {
  final (eventID, token) = params;
  final repository = ref.watch(eventRepositoryProvider);
  return repository.fetchEventInfo(eventID, token);
});

final signUpProvider =
    FutureProvider.autoDispose.family<Event, (int, int)>((ref, params) async {
  final (eventID, userID) = params;
  final repository = ref.watch(eventRepositoryProvider);
  return repository.signUp(eventID, userID);
});

final deleteSignUpProvider =
FutureProvider.autoDispose.family<Event, (int, int)>((ref, params) async {
  final (eventID, userID) = params;
  final repository = ref.watch(eventRepositoryProvider);
  return repository.deleteSignUp(eventID, userID);
});
