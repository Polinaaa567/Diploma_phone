import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization.freezed.dart';
part 'organization.g.dart';

@freezed
class OrganizationInfo with _$OrganizationInfo {
  const factory OrganizationInfo({
    String? name,
    String? description,
    String? address,
    String? contacts,
    String? image,
  }) = _OrganizationInfo;

  factory OrganizationInfo.fromJson(Map<String, dynamic> json) =>
      _$OrganizationInfoFromJson(json);
}
