import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/notifiers/organization_repository.dart';
import 'package:volunteering_kemsu/entities/FAQ/faq.dart';
import 'package:volunteering_kemsu/entities/organization/organization.dart';

final organizationRepositoryProvider = Provider<OrganizationRepository>((ref) {
  return OrganizationRepository();
});

final faqListProvider = FutureProvider.autoDispose<Faq>((ref) async {
  final repository = ref.watch(organizationRepositoryProvider);
  return repository.fetchAllFaq();
});

final organizationInfoProvider =
    FutureProvider.autoDispose<OrganizationInfo>((ref) async {
  final repository = ref.watch(organizationRepositoryProvider);
  return repository.fetchOrganizationInfo();
});
