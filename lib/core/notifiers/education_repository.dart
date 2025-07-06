import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/entities/lesson/lesson.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

class LessonsRepository {
  Future<Pagination> fetchAllLessons(
    int page,
    String token,
  ) async {
    final response = await http.get(
        Uri.parse("http://localhost:8080/volunteeringKEMSU/api/education?"
            "page=$page"),
        headers: {'Content-Type': 'application/json', 'token': token});
    final json = jsonDecode(response.body);
    Logger().d(json);

    final lessonsPagination = Pagination.fromJson(json);

    return lessonsPagination;
  }

  Future<Lesson> sendPoints(
    int page,
    String token,
    int lessonID,
  ) async {
    final response = await http.get(
        Uri.parse(
            "http://localhost:8080/volunteeringKEMSU/api/education/$lessonID"),
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final message = Lesson.fromJson(json);
    return message;
  }
}
