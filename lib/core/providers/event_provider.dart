import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/repositories/events_repository.dart';
import 'package:volunteering_kemsu/core/view_models/event/event_state.dart';
import 'package:volunteering_kemsu/core/view_models/event/event_notifier.dart';

final _eventsRepositoryProvider = Provider<IEventsRepository>((ref) {
  return EventsRepository();
});

final eventProvider = StateNotifierProvider<EventNotifier, EventState>((ref) {
  return EventNotifier(ref, ref.watch(_eventsRepositoryProvider));
});

