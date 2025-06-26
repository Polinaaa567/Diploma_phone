import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:volunteering_kemsu/entities/lesson/lesson.dart';
import 'package:volunteering_kemsu/entities/news/news.dart';
import 'package:volunteering_kemsu/entities/event/event.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    List<Event>? events,
    int? total,
    bool? hasMore ,
    List<Lesson>? lessons,
    List<News>? news,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
