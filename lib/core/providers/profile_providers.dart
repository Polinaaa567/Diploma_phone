import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/notifiers/profile_repository.dart';
import 'package:volunteering_kemsu/entities/profile/user.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

final userInfoProvider = FutureProvider.autoDispose.family<UserInfo, String>((ref, token) async {
  final repository = ref.watch(profileRepositoryProvider);
  return repository.receiveUserInfo(token);
});

final changeUserInfoProvider =
FutureProvider.autoDispose.family<UserInfo, (UserInfo, String)>((ref, params) async {
  final (user, token) = params;

  final repository = ref.watch(profileRepositoryProvider);
  return repository.changeUserInfo(user, token);
});
