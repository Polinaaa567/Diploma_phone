import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/state/event_state.dart';
import 'package:volunteering_kemsu/core/notifiers/event_notifier.dart';

final eventProvider =  StateNotifierProvider<EventNotifier, EventState>((ref) {
  return EventNotifier(ref);
});

