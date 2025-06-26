// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      lastName: json['lastName'] as String?,
      name: json['name'] as String?,
      patronymic: json['patronymic'] as String?,
      clothingSize: json['clothingSize'] as String?,
      ageStamp: json['ageStamp'] as String?,
      formEducation: json['formEducation'] as String?,
      basisEducation: json['basisEducation'] as String?,
      message: json['message'] as String?,
      status: json['status'] as bool?,
      nameRole: json['nameRole'] as String?,
      id: (json['id'] as num?)?.toInt(),
      token: json['token'] as String?,
      points: (json['points'] as num?)?.toInt(),
      maxPoint: (json['maxPoint'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      percent: (json['percent'] as num?)?.toDouble(),
      certificates: (json['certificates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'lastName': instance.lastName,
      'name': instance.name,
      'patronymic': instance.patronymic,
      'clothingSize': instance.clothingSize,
      'ageStamp': instance.ageStamp,
      'formEducation': instance.formEducation,
      'basisEducation': instance.basisEducation,
      'message': instance.message,
      'status': instance.status,
      'nameRole': instance.nameRole,
      'id': instance.id,
      'token': instance.token,
      'points': instance.points,
      'maxPoint': instance.maxPoint,
      'level': instance.level,
      'percent': instance.percent,
      'certificates': instance.certificates,
    };
