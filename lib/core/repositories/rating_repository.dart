import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import 'package:volunteering_kemsu/config/ip.dart';
import 'package:volunteering_kemsu/core/models/profile/user.dart';


abstract class IRatingRepository {
  Future<List<UserInfo>> getAllUsersInRating();
  Future<UserInfo> getUserAchievements(String? token);
}

class RatingRepository extends IRatingRepository {
  @override
  Future<List<UserInfo>> getAllUsersInRating() async {
    final response = await http.get(
      Uri.parse("http://$myIP/volunteeringKEMSU/api/rating"),
      headers: {'Content-Type': 'application/json'},
    );

    List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList.map((json) => UserInfo.fromJson(json)).toList();
  }

  @override
  Future<UserInfo> getUserAchievements(String? token) async {
    final response = await http.get(
      Uri.parse(
        "http://$myIP/volunteeringKEMSU/api/rating/achievements",
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
