// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganizationInfo _$OrganizationInfoFromJson(Map<String, dynamic> json) =>
    _OrganizationInfo(
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      contacts: json['contacts'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$OrganizationInfoToJson(_OrganizationInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'contacts': instance.contacts,
      'image': instance.image,
    };
