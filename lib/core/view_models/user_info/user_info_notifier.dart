import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:volunteering_kemsu/core/models/profile/user.dart';
import 'package:volunteering_kemsu/core/repositories/auth_repository.dart';
import 'package:volunteering_kemsu/core/repositories/rating_repository.dart';
import 'package:volunteering_kemsu/core/view_models/user_info/user_info_state.dart';

class UserInfoNotifier extends StateNotifier<UserInfoState> {
  final IAuthRepository _repositoryA;
  final IRatingRepository _repositoryR;

  UserInfoNotifier(this._repositoryA, this._repositoryR) : super(UserInfoState()) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    state = UserInfoState(isLoading: true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      final savedLogin = prefs.getString('login');

      if (userJson != null) {
        final user = UserInfo.fromJson(jsonDecode(userJson));
        final validToken = await _repositoryA.validated(user.token);

        if (validToken.token != 'BAD' &&
            validToken.token != null &&
            validToken.token != '') {
          state = state.copyWith(
            user: user,
            login: savedLogin ?? '',
            token: user.token,
          );
        }
      } else {
        state = state.copyWith(login: savedLogin ?? '');
      }
    } catch (e) {
      state = state.copyWith(error: 'Ошибка загрузки данных пользователя');
    }
  }

  Future<void> register() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await _repositoryA.register(state.login, state.password);

      if (user.token != 'BAD') {
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('user', jsonEncode(user.toJson()));
        await prefs.setString('login', state.login ?? '');

        state = state.copyWith(
          user: user,
          userProfile: user,
          token: user.token,
          message: user.message,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          token: 'BAD',
          isLoading: false,
          message: user.message,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Ошибка: $e",
      );
    }
  }

  Future<bool> login() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      UserInfo user = await _repositoryA.login(state.login, state.password);

      Logger().d(user);

      if (user.token != 'BAD') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user.toJson()));
        await prefs.setString('login', state.login);

        state = state.copyWith(
          user: user,
          token: user.token,
          isLoading: false,
          message: user.message,
        );

        return true;
      } else {
        Logger().d('message ${user.message}');
        state = state.copyWith(
          token: 'BAD',
          isLoading: false,
          message: user.message,
        );
        return false;
      }
    } catch (e) {
      Logger().d('$e');
      state = state.copyWith(
        isLoading: false,
        error: "Ошибка: $e",
      );
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('login');

    state = state.copyWith();
  }

  void setLogin(String value) {
    final filteredValue = value.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    Logger().d(value);
    if (filteredValue != value) {
      state.loginController.text = filteredValue;
    }

    String? error;
    if (filteredValue.isEmpty && filteredValue == '') {
      error = "Введите логин";
    } else if (filteredValue.length < 6) {
      error = "Некорректный логин";
    } else if (filteredValue.length > 20) {
      error = 'Логин слишком длинный';
    } else {
      error = null;
    }

    if (filteredValue.length <= 20) {
      state = state.copyWith(
        login: filteredValue,
        errorMessageLogin: error,
      );
      Logger().d('state ${state.login}');
    }
  }

  void setPassword(String value) {
    final filteredValue = value.replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '');

    if (filteredValue != value) {
      state.passwordController.text = filteredValue;
    }

    String? error;

    if (filteredValue.isEmpty && filteredValue == '') {
      error = "Введите пароль";
    } else if (filteredValue.length < 8) {
      error = "Короткий пароль";
    } else {
      error = null;
    }

    state = state.copyWith(
      password: filteredValue,
      errorMessagePassword: error,
    );
  }

  void setPasswordRepair(String value) {
    state = state.copyWith(passwordRepair: value);
    _validatePasswordRepeat();
  }

  void _validatePasswordRepeat() {
    if (state.passwordRepair.isEmpty) {
      state = state.copyWith(errorMessagePasswordRepair: "Введите пароль");
    } else if (state.passwordRepair.length < 8) {
      state = state.copyWith(
          errorMessagePasswordRepair: "Длина пароля должна быть не меньше 8");
    } else if (state.passwordRepair != state.password) {
      state = state.copyWith(errorMessagePasswordRepair: "Пароли не совпадают");
    } else {
      state = state.copyWith(errorMessagePasswordRepair: null);
    }
  }

  void changePasswordVisible() {
    state = state.copyWith(passwordVisible: !state.passwordVisible);
  }

  void changePasswordRepairVisible() {
    state = state.copyWith(passwordRepairVisible: !state.passwordRepairVisible);
  }

  void isAuth() {
    state = state.copyWith(isAuth: !state.isAuth);
  }

  void setSize(String? value) {
    final UserInfo? user = state.userProfile;
    if (user != null) {
      final updatedUser = user.copyWith(clothingSize: value);
      state = state.copyWith(userProfile: updatedUser);
    }
  }

  void setBasisEducation(String? value) {
    final UserInfo? user = state.userProfile;
    if (user != null) {
      final updatedUser = user.copyWith(basisEducation: value);
      state = state.copyWith(userProfile: updatedUser);
    }
  }

  void setFormEducation(String? value) {
    final UserInfo? user = state.userProfile;
    if (user != null) {
      final updatedUser = user.copyWith(formEducation: value);
      state = state.copyWith(userProfile: updatedUser);
    }
  }

  void setFirstName(String value) {
    final UserInfo? user = state.userProfile;

    if (user != null) {
      final updatedUser = user.copyWith(name: value);
      state = state.copyWith(userProfile: updatedUser);
    }
  }

  void setLastName(String value) {
    final UserInfo? user = state.userProfile;
    if (user != null) {
      final updatedUser = user.copyWith(lastName: value);
      state = state.copyWith(userProfile: updatedUser);
    }
  }

  void setPatronymic(String value) {
    final UserInfo? user = state.userProfile;
    if (user != null) {
      final updatedUser = user.copyWith(patronymic: value);
      state = state.copyWith(userProfile: updatedUser);
    }
  }

  void toggleEdit() {
    state = state.copyWith(isEdit: !state.isEdit);
  }

  Future<void> receiveUserInfo() async {
    final UserInfo userInfo = await _repositoryA.receiveUserInfo(state.token);

    state = state.copyWith(userProfile: userInfo);
  }

  Future<void> changeUserInfo() async {
    final UserInfo? userNew = state.userProfile;
    final updatedUser = userNew?.copyWith(id: state.user?.id);

    state = state.copyWith(
      userProfile: updatedUser,
    );

    _repositoryA.changeUserInfo(state.token, state.userProfile);
  }

  Future<void> getRatingAllUsers() async {
    // final UserInfo? user = state.userProfile;

    final rating = await _repositoryR.getAllUsersInRating();
    state = state.copyWith(usersRating: rating);
  }

  Future<void> getUserAchievements() async {
    final UserInfo? user = state.userProfile;
    final UserInfo achievements =
        await _repositoryR.getUserAchievements(state.token);
    if (user != null) {
      final updatedUser = user.copyWith(
        certificates: achievements.certificates,
        maxPoint: achievements.maxPoint,
        points: achievements.points,
        percent: achievements.percent,
        level: achievements.level,
      );

      state = state.copyWith(userProfile: updatedUser);
    }
  }
}
