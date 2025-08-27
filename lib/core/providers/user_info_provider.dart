import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/repositories/auth_repository.dart';
import 'package:volunteering_kemsu/core/repositories/rating_repository.dart';
import 'package:volunteering_kemsu/core/view_models/user_info/user_info_notifier.dart';
import 'package:volunteering_kemsu/core/view_models/user_info/user_info_state.dart';

final _authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository();
});

final _ratingRepositoryProvider = Provider<IRatingRepository>((ref) {
  return RatingRepository();
});

final userInfoProvider = StateNotifierProvider<UserInfoNotifier, UserInfoState>((ref) {
  return UserInfoNotifier(
    ref.watch(_authRepositoryProvider),
    ref.watch(_ratingRepositoryProvider),
  );
});
