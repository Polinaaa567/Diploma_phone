import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/entities/FAQ/faq.dart';
import 'package:volunteering_kemsu/entities/organization/organization.dart';

class OrganizationRepository {
  Future<Faq> fetchAllFaq() async {
    final response = await http.get(
        Uri.parse("http://localhost:8080/volunteeringKEMSU/api/faq"),
        headers: {'Content-Type': 'application/json'});

    final json = jsonDecode(response.body);
    Logger().d(json);

    final faq = Faq.fromJson(json);
    return faq;
  }

  Future<OrganizationInfo> fetchOrganizationInfo() async {
    final response = await http.get(
        Uri.parse(
            "http://localhost:8080/volunteeringKEMSU/api/organization"),
        headers: {
          'Content-Type': 'application/json',
        });

    final json = jsonDecode(response.body);
    Logger().d(json);

    final info = OrganizationInfo.fromJson(json);
    return info;
  }
}
