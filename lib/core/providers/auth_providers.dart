import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/notifiers/auth_notifier.dart';
import 'package:volunteering_kemsu/core/state/auth_state.dart';
import 'package:volunteering_kemsu/entities/profile/user.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

final currentUserProvider = Provider<UserInfo?>((ref) {
  return ref.watch(authProvider).user;
});

final isAuthProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isLoading;
});

final loginProvider = Provider<String?> ((ref) {
  return ref.watch(authProvider).login;
});