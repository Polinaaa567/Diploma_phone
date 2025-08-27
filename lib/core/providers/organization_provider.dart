import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/repositories/organization_repository.dart';
import 'package:volunteering_kemsu/core/view_models/organization/organization_notifier.dart';
import 'package:volunteering_kemsu/core/view_models/organization/organization_state.dart';

final _organizationRepoProvider = Provider<IOrganizationRepository>((ref) {
  return OrganizationRepository();
});

final organizationProvider = StateNotifierProvider<OrganizationNotifier, OrganizationState>((ref) {
  return OrganizationNotifier(ref.watch(_organizationRepoProvider));
});
