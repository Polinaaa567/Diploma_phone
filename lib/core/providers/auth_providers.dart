import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/repositories/auth_repository.dart';
import 'package:volunteering_kemsu/entities/profile/user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final loginProvider = FutureProvider.autoDispose
    .family<UserInfo, (String, String)>((ref, params) async {
  final (login, password) = params;

  final repository = ref.watch(authRepositoryProvider);
  return repository.login(login, password);
});

final registerProvider = FutureProvider.autoDispose
    .family<UserInfo, (String, String)>((ref, params) async {
  final (login, password) = params;

  final repository = ref.watch(authRepositoryProvider);
  return repository.register(login, password);
});
