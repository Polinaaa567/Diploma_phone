import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volunteering_kemsu/core/models/event/event.dart';
import 'package:volunteering_kemsu/core/models/lesson/lesson.dart';
import 'package:volunteering_kemsu/core/models/news/news.dart';


part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
abstract class Pagination with _$Pagination {
  const factory Pagination({
    List<Event>? events,
    int? total,
    bool? hasMore ,
    List<Lesson>? lessons,
    List<News>? news,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
