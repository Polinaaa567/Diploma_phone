// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
      name: json['name'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      image: json['image'] as String?,
      dateC: json['dateC'] as String?,
      address: json['address'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
      linkDobroRF: json['linkDobroRF'] as String?,
      message: json['message'] as String?,
      id: (json['id'] as num?)?.toInt(),
      maxCountParticipants: (json['maxCountParticipants'] as num?)?.toInt(),
      countParticipants: (json['countParticipants'] as num?)?.toInt(),
      age: (json['age'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toInt(),
      isRelevance: json['isRelevance'] as bool?,
      status: json['status'] as bool?,
      stampParticipate: json['stampParticipate'] as bool?,
      timeParticipate: (json['timeParticipate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'date': instance.date,
      'image': instance.image,
      'dateC': instance.dateC,
      'address': instance.address,
      'format': instance.format,
      'type': instance.type,
      'linkDobroRF': instance.linkDobroRF,
      'message': instance.message,
      'id': instance.id,
      'maxCountParticipants': instance.maxCountParticipants,
      'countParticipants': instance.countParticipants,
      'age': instance.age,
      'points': instance.points,
      'isRelevance': instance.isRelevance,
      'status': instance.status,
      'stampParticipate': instance.stampParticipate,
      'timeParticipate': instance.timeParticipate,
    };
