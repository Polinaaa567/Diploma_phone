import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/models/news/news.dart';
import 'package:volunteering_kemsu/core/models/pagination/pagination.dart';

abstract class INewsRepository {
  Future<Pagination> fetchAllNews(int page);
  Future<News> fetchNewsInfo(int? newsID);
}

class NewsRepository extends INewsRepository {
  @override
  Future<Pagination> fetchAllNews(int page) async{
    final response = await http.get(
      Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/news?"
          "page=$page"),
      headers: {'Content-Type': 'application/json'},
    );
    final json = jsonDecode(response.body);

    return Pagination.fromJson(json);
  }

  @override
  Future<News> fetchNewsInfo(int? newsID) async {
    final response = await http.get(
      Uri.parse(
          "http://192.168.1.34:8080/volunteeringKEMSU/api/news?newsID=$newsID"),
      headers: {'Content-Type': 'application/json'},
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    return News.fromJson(json);
  }
}
