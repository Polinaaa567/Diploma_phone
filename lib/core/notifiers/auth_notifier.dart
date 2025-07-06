import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:volunteering_kemsu/core/state/auth_state.dart';
import 'package:volunteering_kemsu/entities/profile/user.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState()) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    state = AuthState(isLoading: true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      final savedLogin = prefs.getString('login');

      if (userJson != null) {
        final user = UserInfo.fromJson(jsonDecode(userJson));
        state = AuthState(user: user, login: savedLogin);
      } else {
        state = AuthState(login: savedLogin);
      }
    } catch (e) {
      state = AuthState(error: 'Ошибка загрузки данных пользователя');
    }
  }

  Future<void> register() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await http.post(
        Uri.parse("http://localhost:8080/volunteeringKEMSU/api/auth/register"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: {
          "login": state.login,
          "password": state.password,
        },
      );

      if (response.statusCode == 200) {
        final UserInfo user = UserInfo.fromJson(jsonDecode(response.body));

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user.toJson()));
        await prefs.setString('login', state.login ?? '');

        state = state.copyWith(
          user: user,
          isLoading: false,
        );
      } else {
        state =  state.copyWith(
          isLoading: false,
          error: "Неверные учётные данные",
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Ошибка: $e",
      );
    }
  }

  Future<void> login() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await http.post(
        Uri.parse("http://localhost:8080/volunteeringKEMSU/api/auth/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: {
          "login": state.login,
          "password": state.password,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final UserInfo user = UserInfo.fromJson(json);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(user.toJson()));
        await prefs.setString('login', state.login ?? '');

        state = state.copyWith(
          user: user,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: "Неверные учётные данные",
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Ошибка: $e",
      );
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('login');
    state = state.copyWith();
  }

  void updateLogin(String value) {
    state = state.copyWith(login: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }
}
