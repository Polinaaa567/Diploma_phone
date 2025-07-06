// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqDto _$FaqDtoFromJson(Map<String, dynamic> json) => _FaqDto(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$FaqDtoToJson(_FaqDto instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
