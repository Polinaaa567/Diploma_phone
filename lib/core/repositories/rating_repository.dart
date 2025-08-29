import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:volunteering_kemsu/core/models/profile/user.dart';
import 'package:http/http.dart' as http;

abstract class IRatingRepository {
  Future<List<UserInfo>> getAllUsersInRating();
  Future<UserInfo> getUserAchievements(String? token);
}

class RatingRepository extends IRatingRepository {
  @override
  Future<List<UserInfo>> getAllUsersInRating() async {
    final response = await http.get(
      Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/rating"),
      headers: {'Content-Type': 'application/json'},
    );

    List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList.map((json) => UserInfo.fromJson(json)).toList();
  }

  @override
  Future<UserInfo> getUserAchievements(String? token) async {
    final response = await http.get(
      Uri.parse(
        "http://192.168.1.34:8080/volunteeringKEMSU/api/rating/achievements",
      ),
      headers: {
        'Content-Type': 'application/json',
        'token': token ?? '',
      },
    );

    final json = jsonDecode(response.body);

    Logger().d(json);
    return UserInfo.fromJson(json);
  }
}
