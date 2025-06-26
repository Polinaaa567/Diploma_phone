import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/entities/profile/user.dart';

class ProfileRepository {
  Future<UserInfo> receiveUserInfo(String token) async {
    final response = await http.get(
        Uri.parse(
            "http://192.168.1.34:8080/volunteeringKEMSU/api/profile/users"),
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        });

    final json = jsonDecode(response.body);
    final UserInfo userInfo = UserInfo.fromJson(json);

    Logger().d(json);

    return userInfo;
  }

  Future<UserInfo> changeUserInfo(UserInfo user, String token) async {
    final response = await http.put(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/auth/login"),
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        },
        body: {
          'lastName': user.lastName,
          'name': user.name,
          'patronymic': user.patronymic,
          'clothingSize': user.clothingSize,
          'ageStamp': user.ageStamp,
          'formEducation': user.formEducation,
          'basisEducation': user.basisEducation
        });

    final json = jsonDecode(response.body);
    final UserInfo userInfo = UserInfo.fromJson(json);

    Logger().d(json);

    return userInfo;
  }
}
