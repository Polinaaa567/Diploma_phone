import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:volunteering_kemsu/core/models/FAQ/faq.dart';
import 'package:volunteering_kemsu/core/models/organization/organization.dart';
import 'package:volunteering_kemsu/core/repositories/organization_repository.dart';
import 'package:volunteering_kemsu/core/view_models/organization/organization_state.dart';

class OrganizationNotifier extends StateNotifier<OrganizationState> {
  final IOrganizationRepository repository;

  OrganizationNotifier(this.repository) : super(OrganizationState()) {
    fetchAllFaq();
  }

  Future<void> fetchAllFaq() async {
    final faq = await repository.fetchAllFaq();

    state = state.copyWith(faqList: AsyncValue.data(faq));
  }

  Future<void> fetchOrganizationInfo() async {
    final info = await repository.fetchOrganizationInfo();

    state = state.copyWith(info: AsyncValue.data(info));
  }
}
