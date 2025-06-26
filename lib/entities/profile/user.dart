import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    String? lastName,
    String? name,
    String? patronymic,
    String? clothingSize,
    String? ageStamp,
    String? formEducation,
    String? basisEducation,
    String? message,
    bool? status,
    String? nameRole,
    int? id,
    String? token,
    int? points,
    int? maxPoint,
    int? level,
    double? percent,
    List<String>? certificates,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}
