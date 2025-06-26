// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqImpl _$$FaqImplFromJson(Map<String, dynamic> json) => _$FaqImpl(
      faq: (json['faq'] as List<dynamic>?)
          ?.map((e) => FaqDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: json['contacts'] as String?,
    );

Map<String, dynamic> _$$FaqImplToJson(_$FaqImpl instance) => <String, dynamic>{
      'faq': instance.faq,
      'contacts': instance.contacts,
    };
