import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volunteering_kemsu/core/models/FAQ/faq_dto.dart';

part 'faq.freezed.dart';
part 'faq.g.dart';

@freezed
abstract class Faq with _$Faq {
  const factory Faq({
    List<FaqDto>? faq,
    String? contacts,
  }) = _Faq;

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
}
