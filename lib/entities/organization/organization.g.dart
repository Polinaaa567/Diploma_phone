// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationInfoImpl _$$OrganizationInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizationInfoImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      contacts: json['contacts'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$OrganizationInfoImplToJson(
        _$OrganizationInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'contacts': instance.contacts,
      'image': instance.image,
    };
