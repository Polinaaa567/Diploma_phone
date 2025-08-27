// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Faq {
  List<FaqDto>? get faq;
  String? get contacts;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FaqCopyWith<Faq> get copyWith =>
      _$FaqCopyWithImpl<Faq>(this as Faq, _$identity);

  /// Serializes this Faq to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Faq &&
            const DeepCollectionEquality().equals(other.faq, faq) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(faq), contacts);

  @override
  String toString() {
    return 'Faq(faq: $faq, contacts: $contacts)';
  }
}

/// @nodoc
abstract mixin class $FaqCopyWith<$Res> {
  factory $FaqCopyWith(Faq value, $Res Function(Faq) _then) = _$FaqCopyWithImpl;
  @useResult
  $Res call({List<FaqDto>? faq, String? contacts});
}

/// @nodoc
class _$FaqCopyWithImpl<$Res> implements $FaqCopyWith<$Res> {
  _$FaqCopyWithImpl(this._self, this._then);

  final Faq _self;
  final $Res Function(Faq) _then;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faq = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_self.copyWith(
      faq: freezed == faq
          ? _self.faq
          : faq // ignore: cast_nullable_to_non_nullable
              as List<FaqDto>?,
      contacts: freezed == contacts
          ? _self.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Faq].
extension FaqPatterns on Faq {
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
    TResult Function(_Faq value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Faq() when $default != null:
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
    TResult Function(_Faq value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Faq():
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
    TResult? Function(_Faq value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Faq() when $default != null:
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
    TResult Function(List<FaqDto>? faq, String? contacts)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Faq() when $default != null:
        return $default(_that.faq, _that.contacts);
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
    TResult Function(List<FaqDto>? faq, String? contacts) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Faq():
        return $default(_that.faq, _that.contacts);
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
    TResult? Function(List<FaqDto>? faq, String? contacts)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Faq() when $default != null:
        return $default(_that.faq, _that.contacts);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Faq implements Faq {
  const _Faq({final List<FaqDto>? faq, this.contacts}) : _faq = faq;
  factory _Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);

  final List<FaqDto>? _faq;
  @override
  List<FaqDto>? get faq {
    final value = _faq;
    if (value == null) return null;
    if (_faq is EqualUnmodifiableListView) return _faq;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? contacts;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FaqCopyWith<_Faq> get copyWith =>
      __$FaqCopyWithImpl<_Faq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FaqToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Faq &&
            const DeepCollectionEquality().equals(other._faq, _faq) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_faq), contacts);

  @override
  String toString() {
    return 'Faq(faq: $faq, contacts: $contacts)';
  }
}

/// @nodoc
abstract mixin class _$FaqCopyWith<$Res> implements $FaqCopyWith<$Res> {
  factory _$FaqCopyWith(_Faq value, $Res Function(_Faq) _then) =
      __$FaqCopyWithImpl;
  @override
  @useResult
  $Res call({List<FaqDto>? faq, String? contacts});
}

/// @nodoc
class __$FaqCopyWithImpl<$Res> implements _$FaqCopyWith<$Res> {
  __$FaqCopyWithImpl(this._self, this._then);

  final _Faq _self;
  final $Res Function(_Faq) _then;

  /// Create a copy of Faq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? faq = freezed,
    Object? contacts = freezed,
  }) {
    return _then(_Faq(
      faq: freezed == faq
          ? _self._faq
          : faq // ignore: cast_nullable_to_non_nullable
              as List<FaqDto>?,
      contacts: freezed == contacts
          ? _self.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
