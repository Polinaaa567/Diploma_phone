import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/entities/profile/user.dart';


class AuthRepository {
  Future<UserInfo> register(String login, String password) async {
    final response = await http.post(
        Uri.parse(
            "http://192.168.1.34:8080/volunteeringKEMSU/api/auth/register"),
        headers: {'Content-Type': 'application/json'},
        body: {"login": login, "password": password});

    final json = jsonDecode(response.body);
    final UserInfo userInfo = UserInfo.fromJson(json);

    Logger().d(json);

    return userInfo;
  }

  Future<UserInfo> login(String login, String password) async {
    final response = await http.post(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/auth/login"),
        headers: {
          'Content-Type': 'application/json'
        },
        body: {
          "login": login,
          "password": password,
        });

    final json = jsonDecode(response.body);
    final UserInfo userInfo = UserInfo.fromJson(json);

    Logger().d(json);

    return userInfo;
  }
}
