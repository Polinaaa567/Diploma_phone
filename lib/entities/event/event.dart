import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.g.dart';
part 'event.freezed.dart';

@freezed
class Event with _$Event {
  const factory Event(
      {String? name,
      String? description,
      String? date,
      String? image,
      String? dateC,
      String? address,
      String? format,
      String? type,
      String? linkDobroRF,
      String? message,
      int? id,
      int? maxCountParticipants,
      int? countParticipants,
      int? age,
      int? points,
      bool? isRelevance,
      bool? status,
      bool? stampParticipate,
      double? timeParticipate}) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
