import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/models/FAQ/faq.dart';
import 'package:volunteering_kemsu/core/models/organization/organization.dart';
import 'package:volunteering_kemsu/config/ip.dart';

abstract class IOrganizationRepository {
  Future<Faq> fetchAllFaq();
  Future<OrganizationInfo> fetchOrganizationInfo();
}

class OrganizationRepository extends IOrganizationRepository {
  @override
  Future<Faq> fetchAllFaq() async {
    final response = await http.get(
      Uri.parse("http://$myIP/volunteeringKEMSU/api/faq"),
      headers: {'Content-Type': 'application/json'},
    );
    final json = jsonDecode(response.body);
    Logger().d(json);

    return Faq.fromJson(json);
  }

  @override
  Future<OrganizationInfo> fetchOrganizationInfo() async {
    final response = await http.get(
      Uri.parse("http://$myIP/volunteeringKEMSU/api/organization"),
      headers: {'Content-Type': 'application/json'},
    );

    final json = jsonDecode(response.body);
    Logger().d(json);

    return OrganizationInfo.fromJson(json);
  }
}
