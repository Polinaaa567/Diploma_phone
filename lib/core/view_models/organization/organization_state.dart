import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volunteering_kemsu/core/models/FAQ/faq.dart';
import 'package:volunteering_kemsu/core/models/organization/organization.dart';

class OrganizationState {
  final AsyncValue<Faq> faqList;
  final AsyncValue<OrganizationInfo> info;

  OrganizationState({
    this.faqList = const AsyncValue.loading(),
    this.info = const AsyncValue.loading(),
  });

  OrganizationState copyWith({
    AsyncValue<Faq>? faqList,
    AsyncValue<OrganizationInfo>? info,
  }) {
    return OrganizationState(
      faqList: faqList ?? this.faqList,
      info: info ?? this.info,
    );
  }
}
