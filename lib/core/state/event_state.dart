import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/entities/event/event.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

class EventState {
  final AsyncValue<Pagination> eventList;
  final AsyncValue<Event> eventInfo;
  final int? eventID;
  final int page;
  final String? error;
  final String? dateStart;
  final String? dateEnd;
  final bool isLoadingMore;

  EventState({
    this.eventID,
    this.eventInfo = const AsyncValue.loading(),
    this.eventList = const AsyncValue.loading(),
    this.page = 1,
    this.error,
    this.dateEnd = '',
    this.dateStart = '',
    this.isLoadingMore = false,
  });

  EventState copyWith({
    AsyncValue<Pagination>? eventList,
    AsyncValue<Event>? eventInfo,
    int? eventID,
    int? page,
    String? error,
    String? dateStart,
    String? dateEnd,
    bool? isLoadingMore,
  }) {
    return EventState(
      eventInfo: eventInfo ?? this.eventInfo,
      eventList: eventList ?? this.eventList,
      eventID: eventID ?? this.eventID,
      page: page ?? this.page,
      error: error ?? this.error,
      dateEnd: dateEnd ?? this.dateEnd,
      dateStart: dateStart ?? this.dateStart,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

