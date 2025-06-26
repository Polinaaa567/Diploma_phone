import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_dto.freezed.dart';
part 'faq_dto.g.dart';

@freezed
class FaqDto with _$FaqDto {
  const factory FaqDto({
    int? id,
    String? question,
    String? answer,
  }) = _FaqDto;

  factory FaqDto.fromJson(Map<String, dynamic> json) => _$FaqDtoFromJson(json);
}
