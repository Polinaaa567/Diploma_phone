import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/entities/event/event.dart';
import 'package:volunteering_kemsu/entities/pagination/pagination.dart';

class EventRepository {
  Future<Pagination> fetchAllEvents(
    int page,
  ) async {
    final response = await http.get(
        Uri.parse("http://localhost:8080/volunteeringKEMSU/api/events?"
            "page=$page"),
        headers: {
          'Content-Type': 'application/json',
        });
    final json = jsonDecode(response.body);
    Logger().d(json);

    final eventsPagination = Pagination.fromJson(json);

    return eventsPagination;
  }

  Future<Pagination> fetchPastEventsUser(
    int page,
    String token,
  ) async {
    final response = await http.get(
        Uri.parse("http://localhost:8080/volunteeringKEMSU/api/events/past?"
            "page=$page"),
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final eventsPastPagination = Pagination.fromJson(json);
    return eventsPastPagination;
  }

  Future<Pagination> fetchFutureEventsUser(
    int page,
    String token,
  ) async {
    final response = await http.get(
        Uri.parse(
            "http://localhost:8080/volunteeringKEMSU/api/events/future?"
            "page=$page"),
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final eventsFuturePagination = Pagination.fromJson(json);
    return eventsFuturePagination;
  }

  Future<Pagination> fetchEventsBetweenDate(
    int page,
    String dateStart,
    String dateEnd,
  ) async {
    final response = await http.get(
        Uri.parse("http://localhost:8080/volunteeringKEMSU/api/events?"
            "dateStart=$dateStart&"
            "dateEnd=$dateEnd"),
        headers: {
          'Content-Type': 'application/json',
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final eventsBetweenDatePagination = Pagination.fromJson(json);
    return eventsBetweenDatePagination;
  }

  Future<Event> fetchEventInfo(
    int eventID,
    String token,
  ) async {
    final response = await http.get(
        Uri.parse(
            "http://localhost:8080/volunteeringKEMSU/api/events/$eventID"),
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final eventInfo = Event.fromJson(json);
    return eventInfo;
  }

  Future<Event> signUp(
    int eventID,
    int userID,
  ) async {
    final response = await http.post(
        Uri.parse(
            "http://localhost:8080/volunteeringKEMSU/api/events/sign-up"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: {
          'userID': userID,
          'eventID': eventID,
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final signUpInEvent = Event.fromJson(json);
    return signUpInEvent;
  }

  Future<Event> deleteSignUp(
    int eventID,
    int userID,
  ) async {
    final response = await http.post(
        Uri.parse(
            "http://localhost:8080/volunteeringKEMSU/api/events/$eventID/users/$userID"),
        headers: {
          'Content-Type': 'application/json',
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final signUpInEvent = Event.fromJson(json);
    return signUpInEvent;
  }
}
