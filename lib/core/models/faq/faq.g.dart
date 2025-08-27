// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Faq _$FaqFromJson(Map<String, dynamic> json) => _Faq(
      faq: (json['faq'] as List<dynamic>?)
          ?.map((e) => FaqDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: json['contacts'] as String?,
    );

Map<String, dynamic> _$FaqToJson(_Faq instance) => <String, dynamic>{
      'faq': instance.faq,
      'contacts': instance.contacts,
    };
