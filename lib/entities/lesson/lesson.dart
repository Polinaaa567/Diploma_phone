import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
class Lesson with _$Lesson {
  const factory Lesson({
    bool? status,
    String? message,
    int? id,
    String? headline,
    String? link,
    String? description,
    int? numberPoints,

  }) = _Lesson;
  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

}
