import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:volunteering_kemsu/core/models/pagination/pagination.dart';

abstract class ILessonsRepository {
  Future<Pagination> fetchAllLessons(int page, String? filter, String? token);
  Future<int?> fetchSizeWatched(String? token, int page);
  Future<void> sendPoints(int? lessonID, String? token);
}

class LessonsRepository extends ILessonsRepository {
  @override
  Future<Pagination> fetchAllLessons(int page, String? filter, String? token) async {
    final http.Response response;

    Logger().d('отправка token в уроках $token');

    if(token != null &&  token != 'BAD'){
      if(filter != null) {
        response = await http.get(
          Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/education?"
              "page=$page&filter=$filter"),
          headers: {'Content-Type': 'application/json', 'token': token},
        );
      } else {
        response = await http.get(
          Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/education?"
              "page=$page"),
          headers: {'Content-Type': 'application/json', 'token': token},
        );
      }
    } else {
      response = await http.get(
        Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/education?"
            "page=$page"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    }

    Logger().d('все уроки пользователя');
    debugPrint(response.body, wrapWidth: 1024);

    const maxLength = 1000;
    for (int i = 0; i < response.body.length; i += maxLength) {
      if (i + maxLength < response.body.length) {
        debugPrint(response.body.substring(i, i + maxLength));
      } else {
        debugPrint(response.body.substring(i));
      }
    }
    final json = jsonDecode(response.body);

    Logger().d(json);
    return Pagination.fromJson(json);
  }

  @override
  Future<int?> fetchSizeWatched(String? token, int page) async {
    final http.Response response = await http.get(
      Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/education?"
          "page=$page&filter=watched"),
      headers: {
        'Content-Type': 'application/json',
        'token': token ?? '',
      },
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    final newPagination = Pagination.fromJson(json);

    return newPagination.total;
  }

  @override
  Future<void> sendPoints(int? lessonID, String? token) async {
    final response = await http.post(
      Uri.parse(
          "http://192.168.1.34:8080/volunteeringKEMSU/api/education/$lessonID"),
      headers: {
        'Content-Type': 'application/json',
        'token': token ?? '',
      },
    );

    final json = jsonDecode(response.body);

    debugPrint(response.body, wrapWidth: 1024);

    Logger().d(json);
  }
}
