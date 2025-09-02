import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/models/profile/user.dart';
import 'package:volunteering_kemsu/config/ip.dart';

abstract class IAuthRepository {
  Future<UserInfo> register(String? login, String? password);
  Future<UserInfo> login(String? login, String? password);
  Future<UserInfo> validated(String? token);
  Future<UserInfo> receiveUserInfo(String? token);
  Future<void> changeUserInfo(String? token, UserInfo? user);
}

class AuthRepository extends IAuthRepository {
  @override
  Future<UserInfo> validated(String? token) async {
    final response = await http.get(
      Uri.parse("http://$myIP/volunteeringKEMSU/api/auth/valid"),
      headers: {
        'Content-Type': 'application/json',
        'token': "$token",
      },
    );

    Logger().d('значение при валидации токена ${response.body}');

    return UserInfo.fromJson(jsonDecode(response.body));
  }

  @override
  Future<UserInfo> register(String? login, String? password) async {
    final response = await http.post(
      Uri.parse("http://$myIP/volunteeringKEMSU/api/auth/register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "login": login,
        "password": password,
      }),
    );

    return UserInfo.fromJson(jsonDecode(response.body));
  }

  @override
  Future<UserInfo> login(String? login, String? password) async {
    Logger().d('login $login');
    Logger().d('passwd $password');

    final response = await http.post(
      Uri.parse("http://$myIP/volunteeringKEMSU/api/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "login": login,
        "password": password,
      }),
    );

    return UserInfo.fromJson(jsonDecode(response.body));
  }

  @override
  Future<void> changeUserInfo(String? token, UserInfo? user) async {
    Logger().d(user);

    final json = await http.put(
      Uri.parse("http://$myIP/volunteeringKEMSU/api/profile/users"),
      headers: {
        'Content-Type': 'application/json',
        'token': "$token",
      },
      body: jsonEncode({
        'lastName': user?.lastName,
        'name': user?.name,
        'patronymic': user?.patronymic,
        'clothingSize': user?.clothingSize,
        'ageStamp': user?.ageStamp,
        'formEducation': user?.formEducation,
        'basisEducation': user?.basisEducation
      }),
    );

    Logger().d('json при изменении данных о пользователе ${jsonDecode(json.body)}');
  }

  @override
  Future<UserInfo> receiveUserInfo(String? token) async {
    final response = await http.get(
      Uri.parse(
        "http://$myIP/volunteeringKEMSU/api/profile/users",
      ),
      headers: {
        'Content-Type': 'application/json',
        'token': "$token",
      },
    );

    final json = jsonDecode(response.body);

    Logger().d('получение данных: $json');

    return UserInfo.fromJson(json);
  }
}
