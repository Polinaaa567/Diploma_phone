// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      headline: json['headline'] as String?,
      id: (json['id'] as num?)?.toInt(),
      dateCreation: json['dateCreation'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'headline': instance.headline,
      'id': instance.id,
      'dateCreation': instance.dateCreation,
      'description': instance.description,
      'image': instance.image,
    };
