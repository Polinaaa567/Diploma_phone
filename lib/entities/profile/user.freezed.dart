// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInfo {
  String? get lastName;
  String? get name;
  String? get patronymic;
  String? get clothingSize;
  String? get ageStamp;
  String? get formEducation;
  String? get basisEducation;
  String? get message;
  bool? get status;
  String? get nameRole;
  int? get id;
  String? get token;
  int? get points;
  int? get maxPoint;
  int? get level;
  double? get percent;
  List<String>? get certificates;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<UserInfo> get copyWith =>
      _$UserInfoCopyWithImpl<UserInfo>(this as UserInfo, _$identity);

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInfo &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.clothingSize, clothingSize) ||
                other.clothingSize == clothingSize) &&
            (identical(other.ageStamp, ageStamp) ||
                other.ageStamp == ageStamp) &&
            (identical(other.formEducation, formEducation) ||
                other.formEducation == formEducation) &&
            (identical(other.basisEducation, basisEducation) ||
                other.basisEducation == basisEducation) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.nameRole, nameRole) ||
                other.nameRole == nameRole) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.maxPoint, maxPoint) ||
                other.maxPoint == maxPoint) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            const DeepCollectionEquality()
                .equals(other.certificates, certificates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastName,
      name,
      patronymic,
      clothingSize,
      ageStamp,
      formEducation,
      basisEducation,
      message,
      status,
      nameRole,
      id,
      token,
      points,
      maxPoint,
      level,
      percent,
      const DeepCollectionEquality().hash(certificates));

  @override
  String toString() {
    return 'UserInfo(lastName: $lastName, name: $name, patronymic: $patronymic, clothingSize: $clothingSize, ageStamp: $ageStamp, formEducation: $formEducation, basisEducation: $basisEducation, message: $message, status: $status, nameRole: $nameRole, id: $id, token: $token, points: $points, maxPoint: $maxPoint, level: $level, percent: $percent, certificates: $certificates)';
  }
}

/// @nodoc
abstract mixin class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) _then) =
      _$UserInfoCopyWithImpl;
  @useResult
  $Res call(
      {String? lastName,
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
      List<String>? certificates});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res> implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._self, this._then);

  final UserInfo _self;
  final $Res Function(UserInfo) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastName = freezed,
    Object? name = freezed,
    Object? patronymic = freezed,
    Object? clothingSize = freezed,
    Object? ageStamp = freezed,
    Object? formEducation = freezed,
    Object? basisEducation = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? nameRole = freezed,
    Object? id = freezed,
    Object? token = freezed,
    Object? points = freezed,
    Object? maxPoint = freezed,
    Object? level = freezed,
    Object? percent = freezed,
    Object? certificates = freezed,
  }) {
    return _then(_self.copyWith(
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      patronymic: freezed == patronymic
          ? _self.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      clothingSize: freezed == clothingSize
          ? _self.clothingSize
          : clothingSize // ignore: cast_nullable_to_non_nullable
              as String?,
      ageStamp: freezed == ageStamp
          ? _self.ageStamp
          : ageStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      formEducation: freezed == formEducation
          ? _self.formEducation
          : formEducation // ignore: cast_nullable_to_non_nullable
              as String?,
      basisEducation: freezed == basisEducation
          ? _self.basisEducation
          : basisEducation // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      nameRole: freezed == nameRole
          ? _self.nameRole
          : nameRole // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPoint: freezed == maxPoint
          ? _self.maxPoint
          : maxPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      percent: freezed == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double?,
      certificates: freezed == certificates
          ? _self.certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserInfo].
extension UserInfoPatterns on UserInfo {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfo() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfo():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfo() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
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
            List<String>? certificates)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfo() when $default != null:
        return $default(
            _that.lastName,
            _that.name,
            _that.patronymic,
            _that.clothingSize,
            _that.ageStamp,
            _that.formEducation,
            _that.basisEducation,
            _that.message,
            _that.status,
            _that.nameRole,
            _that.id,
            _that.token,
            _that.points,
            _that.maxPoint,
            _that.level,
            _that.percent,
            _that.certificates);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
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
            List<String>? certificates)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfo():
        return $default(
            _that.lastName,
            _that.name,
            _that.patronymic,
            _that.clothingSize,
            _that.ageStamp,
            _that.formEducation,
            _that.basisEducation,
            _that.message,
            _that.status,
            _that.nameRole,
            _that.id,
            _that.token,
            _that.points,
            _that.maxPoint,
            _that.level,
            _that.percent,
            _that.certificates);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
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
            List<String>? certificates)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfo() when $default != null:
        return $default(
            _that.lastName,
            _that.name,
            _that.patronymic,
            _that.clothingSize,
            _that.ageStamp,
            _that.formEducation,
            _that.basisEducation,
            _that.message,
            _that.status,
            _that.nameRole,
            _that.id,
            _that.token,
            _that.points,
            _that.maxPoint,
            _that.level,
            _that.percent,
            _that.certificates);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserInfo implements UserInfo {
  const _UserInfo(
      {this.lastName,
      this.name,
      this.patronymic,
      this.clothingSize,
      this.ageStamp,
      this.formEducation,
      this.basisEducation,
      this.message,
      this.status,
      this.nameRole,
      this.id,
      this.token,
      this.points,
      this.maxPoint,
      this.level,
      this.percent,
      final List<String>? certificates})
      : _certificates = certificates;
  factory _UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  @override
  final String? lastName;
  @override
  final String? name;
  @override
  final String? patronymic;
  @override
  final String? clothingSize;
  @override
  final String? ageStamp;
  @override
  final String? formEducation;
  @override
  final String? basisEducation;
  @override
  final String? message;
  @override
  final bool? status;
  @override
  final String? nameRole;
  @override
  final int? id;
  @override
  final String? token;
  @override
  final int? points;
  @override
  final int? maxPoint;
  @override
  final int? level;
  @override
  final double? percent;
  final List<String>? _certificates;
  @override
  List<String>? get certificates {
    final value = _certificates;
    if (value == null) return null;
    if (_certificates is EqualUnmodifiableListView) return _certificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfo &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.clothingSize, clothingSize) ||
                other.clothingSize == clothingSize) &&
            (identical(other.ageStamp, ageStamp) ||
                other.ageStamp == ageStamp) &&
            (identical(other.formEducation, formEducation) ||
                other.formEducation == formEducation) &&
            (identical(other.basisEducation, basisEducation) ||
                other.basisEducation == basisEducation) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.nameRole, nameRole) ||
                other.nameRole == nameRole) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.maxPoint, maxPoint) ||
                other.maxPoint == maxPoint) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            const DeepCollectionEquality()
                .equals(other._certificates, _certificates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lastName,
      name,
      patronymic,
      clothingSize,
      ageStamp,
      formEducation,
      basisEducation,
      message,
      status,
      nameRole,
      id,
      token,
      points,
      maxPoint,
      level,
      percent,
      const DeepCollectionEquality().hash(_certificates));

  @override
  String toString() {
    return 'UserInfo(lastName: $lastName, name: $name, patronymic: $patronymic, clothingSize: $clothingSize, ageStamp: $ageStamp, formEducation: $formEducation, basisEducation: $basisEducation, message: $message, status: $status, nameRole: $nameRole, id: $id, token: $token, points: $points, maxPoint: $maxPoint, level: $level, percent: $percent, certificates: $certificates)';
  }
}

/// @nodoc
abstract mixin class _$UserInfoCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) _then) =
      __$UserInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? lastName,
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
      List<String>? certificates});
}

/// @nodoc
class __$UserInfoCopyWithImpl<$Res> implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(this._self, this._then);

  final _UserInfo _self;
  final $Res Function(_UserInfo) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lastName = freezed,
    Object? name = freezed,
    Object? patronymic = freezed,
    Object? clothingSize = freezed,
    Object? ageStamp = freezed,
    Object? formEducation = freezed,
    Object? basisEducation = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? nameRole = freezed,
    Object? id = freezed,
    Object? token = freezed,
    Object? points = freezed,
    Object? maxPoint = freezed,
    Object? level = freezed,
    Object? percent = freezed,
    Object? certificates = freezed,
  }) {
    return _then(_UserInfo(
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      patronymic: freezed == patronymic
          ? _self.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      clothingSize: freezed == clothingSize
          ? _self.clothingSize
          : clothingSize // ignore: cast_nullable_to_non_nullable
              as String?,
      ageStamp: freezed == ageStamp
          ? _self.ageStamp
          : ageStamp // ignore: cast_nullable_to_non_nullable
              as String?,
      formEducation: freezed == formEducation
          ? _self.formEducation
          : formEducation // ignore: cast_nullable_to_non_nullable
              as String?,
      basisEducation: freezed == basisEducation
          ? _self.basisEducation
          : basisEducation // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      nameRole: freezed == nameRole
          ? _self.nameRole
          : nameRole // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      maxPoint: freezed == maxPoint
          ? _self.maxPoint
          : maxPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      percent: freezed == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double?,
      certificates: freezed == certificates
          ? _self._certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
