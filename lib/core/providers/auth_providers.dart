import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/notifiers/auth_notifier.dart';
import 'package:volunteering_kemsu/core/state/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
