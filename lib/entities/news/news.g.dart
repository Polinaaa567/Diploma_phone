// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_News _$NewsFromJson(Map<String, dynamic> json) => _News(
      headline: json['headline'] as String?,
      id: (json['id'] as num?)?.toInt(),
      dateCreation: json['dateCreation'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$NewsToJson(_News instance) => <String, dynamic>{
      'headline': instance.headline,
      'id': instance.id,
      'dateCreation': instance.dateCreation,
      'description': instance.description,
      'image': instance.image,
    };
