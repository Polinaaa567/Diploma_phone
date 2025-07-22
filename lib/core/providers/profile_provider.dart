import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/notifiers/profile_repository.dart';
import 'package:volunteering_kemsu/core/state/auth_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, AuthState>((ref) {
  return ProfileNotifier();
});