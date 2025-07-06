import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/entities/news/news.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

class NewsRepository {
  Future<Pagination> fetchAllNews(
    int page,
  ) async {
    final response = await http.get(
        Uri.parse("http://localhost:8080/volunteeringKEMSU/api/news?"
            "page=$page"),
        headers: {
          'Content-Type': 'application/json',
        });
    final json = jsonDecode(response.body);
    Logger().d(json);

    final newsPagination = Pagination.fromJson(json);

    return newsPagination;
  }

  Future<News> fetchNewsInfo(
    int newsID,
  ) async {
    final response = await http.get(
        Uri.parse(
            "http://localhost:8080/volunteeringKEMSU/api/news?newsID=$newsID"),
        headers: {
          'Content-Type': 'application/json',
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final newsInfo = News.fromJson(json);
    return newsInfo;
  }
}
