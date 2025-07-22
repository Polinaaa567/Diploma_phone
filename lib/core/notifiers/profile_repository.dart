import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/state/auth_state.dart';
import 'package:volunteering_kemsu/entities/profile/user.dart';

class ProfileNotifier extends StateNotifier<AuthState> {
  ProfileNotifier() : super(AuthState());

  Future<void> receiveUserInfo() async {
    final response = await http.get(
        Uri.parse(
          "http://192.168.1.34:8080/volunteeringKEMSU/api/profile/users",
        ),
        headers: {
          'Content-Type': 'application/json',
          'token': "${state.user?.token}",
        });

    final json = jsonDecode(response.body);
    final UserInfo userInfo = UserInfo.fromJson(json);

    Logger().d(json);

    state = state.copyWith(userProfile: userInfo);
  }

  Future<void> changeUserInfo() async {
    final response = await http.put(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/auth/login"),
        headers: {
          'Content-Type': 'application/json',
          'token': "${state.user?.token}",
        },
        // body: {
        //   'lastName': user.lastName,
        //   'name': user.name,
        //   'patronymic': user.patronymic,
        //   'clothingSize': user.clothingSize,
        //   'ageStamp': user.ageStamp,
        //   'formEducation': user.formEducation,
        //   'basisEducation': user.basisEducation
        // }
        );

    final json = jsonDecode(response.body);
    // final UserInfo userInfo = UserInfo.fromJson(json);

    Logger().d(json);

    // return userInfo;
  }
}
