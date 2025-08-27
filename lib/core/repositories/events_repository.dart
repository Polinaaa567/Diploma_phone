import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/models/event/event.dart';
import 'package:volunteering_kemsu/core/models/pagination/pagination.dart';

abstract class IEventsRepository {
  Future<Pagination> fetchAllEvents(int page);
  Future<Pagination> fetchPastEventsUser(int page, String? token);
  Future<Pagination> fetchFutureEventsUser(int page, String? token);
  Future<Pagination> fetchEventsBetweenDate(
      String? dateStart, String? dateEnd, int page);
  Future<Event> fetchEventInfo(String? token, int? eventID);
  Future<void> signUp(String? token, int? eventID);
  Future<void> deleteSignUp(String? token, int? eventID);
}

class EventsRepository extends IEventsRepository {
  @override
  Future<void> deleteSignUp(String? token, int? eventID) async {
    final response = await http.post(
      Uri.parse(
          "http://192.168.1,34:8080/volunteeringKEMSU/api/events/$eventID/users"),
      headers: {
        'Content-Type': 'application/json',
        'token': "$token",
      },
    );

    final json = jsonDecode(response.body);
    Logger().d(json);
  }

  @override
  Future<Pagination> fetchAllEvents(int page) async {
    final response = await http.get(
      Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/events?"
          "page=$page"),
      headers: {'Content-Type': 'application/json'},
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    return Pagination.fromJson(json);
  }

  @override
  Future<Event> fetchEventInfo(String? token, int? eventID) async {
    final http.Response response;

    if (token != null) {
      response = await http.get(
        Uri.parse(
            "http://192.168.1.34:8080/volunteeringKEMSU/api/events/$eventID"),
        headers: {
          'Content-Type': 'application/json',
          'token': token ?? "",
        },
      );
    } else {
      response = await http.get(
        Uri.parse(
            "http://192.168.1.34:8080/volunteeringKEMSU/api/events/$eventID"),
        headers: {
          'Content-Type': 'application/json',
        },
      );
    }

    final json = jsonDecode(response.body);
    Logger().d(json);

    return Event.fromJson(json);
  }

  @override
  Future<Pagination> fetchEventsBetweenDate(
    String? dateStart,
    String? dateEnd,
    int page,
  ) async {
    final response = await http.get(
      Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/events?"
          "dateStart=$dateStart&"
          "dateEnd=$dateEnd&"
          "page=$page"),
      headers: {'Content-Type': 'application/json'},
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    return Pagination.fromJson(json);
  }

  @override
  Future<Pagination> fetchFutureEventsUser(int page, String? token) async {
    final response = await http.get(
      Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/events/future?"
          "page=$page"),
      headers: {
        'Content-Type': 'application/json',
        'token': token ?? "",
      },
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    return Pagination.fromJson(json);
  }

  @override
  Future<Pagination> fetchPastEventsUser(int page, String? token) async {
    final response = await http.get(
      Uri.parse("http://192.168.1.34:8080/volunteeringKEMSU/api/events/past?"
          "page=$page"),
      headers: {
        'Content-Type': 'application/json',
        'token': token ?? "",
      },
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    return Pagination.fromJson(json);
  }

  @override
  Future<void> signUp(String? token, int? eventID) async {
    final response = await http.post(
      Uri.parse(
          "http://192.168.1.34:8080/volunteeringKEMSU/api/events/sign-up"),
      headers: {'Content-Type': 'application/json', 'token': token ?? ''},
      body: {
        'eventID': eventID,
      },
    );

    final json = jsonDecode(response.body);
    Logger().d(json);
  }
}
