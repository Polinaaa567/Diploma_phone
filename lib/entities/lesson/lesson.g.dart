// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lesson _$LessonFromJson(Map<String, dynamic> json) => _Lesson(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      id: (json['id'] as num?)?.toInt(),
      headline: json['headline'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
      numberPoints: (json['numberPoints'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LessonToJson(_Lesson instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'headline': instance.headline,
      'link': instance.link,
      'description': instance.description,
      'numberPoints': instance.numberPoints,
    };
