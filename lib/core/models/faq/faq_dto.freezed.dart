// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqDto {
  int? get id;
  String? get question;
  String? get answer;

  /// Create a copy of FaqDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FaqDtoCopyWith<FaqDto> get copyWith =>
      _$FaqDtoCopyWithImpl<FaqDto>(this as FaqDto, _$identity);

  /// Serializes this FaqDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FaqDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, answer);

  @override
  String toString() {
    return 'FaqDto(id: $id, question: $question, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class $FaqDtoCopyWith<$Res> {
  factory $FaqDtoCopyWith(FaqDto value, $Res Function(FaqDto) _then) =
      _$FaqDtoCopyWithImpl;
  @useResult
  $Res call({int? id, String? question, String? answer});
}

/// @nodoc
class _$FaqDtoCopyWithImpl<$Res> implements $FaqDtoCopyWith<$Res> {
  _$FaqDtoCopyWithImpl(this._self, this._then);

  final FaqDto _self;
  final $Res Function(FaqDto) _then;

  /// Create a copy of FaqDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FaqDto].
extension FaqDtoPatterns on FaqDto {
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
    TResult Function(_FaqDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FaqDto() when $default != null:
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
    TResult Function(_FaqDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FaqDto():
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
    TResult? Function(_FaqDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FaqDto() when $default != null:
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
    TResult Function(int? id, String? question, String? answer)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FaqDto() when $default != null:
        return $default(_that.id, _that.question, _that.answer);
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
    TResult Function(int? id, String? question, String? answer) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FaqDto():
        return $default(_that.id, _that.question, _that.answer);
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
    TResult? Function(int? id, String? question, String? answer)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FaqDto() when $default != null:
        return $default(_that.id, _that.question, _that.answer);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FaqDto implements FaqDto {
  const _FaqDto({this.id, this.question, this.answer});
  factory _FaqDto.fromJson(Map<String, dynamic> json) => _$FaqDtoFromJson(json);

  @override
  final int? id;
  @override
  final String? question;
  @override
  final String? answer;

  /// Create a copy of FaqDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FaqDtoCopyWith<_FaqDto> get copyWith =>
      __$FaqDtoCopyWithImpl<_FaqDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FaqDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FaqDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, answer);

  @override
  String toString() {
    return 'FaqDto(id: $id, question: $question, answer: $answer)';
  }
}

/// @nodoc
abstract mixin class _$FaqDtoCopyWith<$Res> implements $FaqDtoCopyWith<$Res> {
  factory _$FaqDtoCopyWith(_FaqDto value, $Res Function(_FaqDto) _then) =
      __$FaqDtoCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? question, String? answer});
}

/// @nodoc
class __$FaqDtoCopyWithImpl<$Res> implements _$FaqDtoCopyWith<$Res> {
  __$FaqDtoCopyWithImpl(this._self, this._then);

  final _FaqDto _self;
  final $Res Function(_FaqDto) _then;

  /// Create a copy of FaqDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_FaqDto(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
