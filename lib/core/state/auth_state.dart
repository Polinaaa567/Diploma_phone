import 'package:volunteering_kemsu/entities/profile/user.dart';

class AuthState {
  final UserInfo? user;
  final bool isLoading;
  final String? error;

  final String? login;
  final String? password;

  final UserInfo? userProfile;

  AuthState({
    this.user,
    this.error,
    this.isLoading = false,
    this.password = '',
    this.login = '',
    this.userProfile,
  });

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    UserInfo? user,
    bool? isLoading,
    String? error,
    String? login,
    String? password,
    UserInfo? userProfile,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      login: login ?? this.login,
      password: password ?? this.password,
      userProfile: userProfile ?? this.userProfile,
    );
  }
}
