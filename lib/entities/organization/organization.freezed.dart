// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationInfo {
  String? get name;
  String? get description;
  String? get address;
  String? get contacts;
  String? get image;

  /// Create a copy of OrganizationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationInfoCopyWith<OrganizationInfo> get copyWith =>
      _$OrganizationInfoCopyWithImpl<OrganizationInfo>(
          this as OrganizationInfo, _$identity);

  /// Serializes this OrganizationInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, address, contacts, image);

  @override
  String toString() {
    return 'OrganizationInfo(name: $name, description: $description, address: $address, contacts: $contacts, image: $image)';
  }
}

/// @nodoc
abstract mixin class $OrganizationInfoCopyWith<$Res> {
  factory $OrganizationInfoCopyWith(
          OrganizationInfo value, $Res Function(OrganizationInfo) _then) =
      _$OrganizationInfoCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      String? description,
      String? address,
      String? contacts,
      String? image});
}

/// @nodoc
class _$OrganizationInfoCopyWithImpl<$Res>
    implements $OrganizationInfoCopyWith<$Res> {
  _$OrganizationInfoCopyWithImpl(this._self, this._then);

  final OrganizationInfo _self;
  final $Res Function(OrganizationInfo) _then;

  /// Create a copy of OrganizationInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? contacts = freezed,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _self.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OrganizationInfo].
extension OrganizationInfoPatterns on OrganizationInfo {
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
    TResult Function(_OrganizationInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationInfo() when $default != null:
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
    TResult Function(_OrganizationInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationInfo():
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
    TResult? Function(_OrganizationInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationInfo() when $default != null:
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
    TResult Function(String? name, String? description, String? address,
            String? contacts, String? image)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationInfo() when $default != null:
        return $default(_that.name, _that.description, _that.address,
            _that.contacts, _that.image);
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
    TResult Function(String? name, String? description, String? address,
            String? contacts, String? image)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationInfo():
        return $default(_that.name, _that.description, _that.address,
            _that.contacts, _that.image);
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
    TResult? Function(String? name, String? description, String? address,
            String? contacts, String? image)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationInfo() when $default != null:
        return $default(_that.name, _that.description, _that.address,
            _that.contacts, _that.image);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrganizationInfo implements OrganizationInfo {
  const _OrganizationInfo(
      {this.name, this.description, this.address, this.contacts, this.image});
  factory _OrganizationInfo.fromJson(Map<String, dynamic> json) =>
      _$OrganizationInfoFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? address;
  @override
  final String? contacts;
  @override
  final String? image;

  /// Create a copy of OrganizationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationInfoCopyWith<_OrganizationInfo> get copyWith =>
      __$OrganizationInfoCopyWithImpl<_OrganizationInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrganizationInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, address, contacts, image);

  @override
  String toString() {
    return 'OrganizationInfo(name: $name, description: $description, address: $address, contacts: $contacts, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationInfoCopyWith<$Res>
    implements $OrganizationInfoCopyWith<$Res> {
  factory _$OrganizationInfoCopyWith(
          _OrganizationInfo value, $Res Function(_OrganizationInfo) _then) =
      __$OrganizationInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      String? address,
      String? contacts,
      String? image});
}

/// @nodoc
class __$OrganizationInfoCopyWithImpl<$Res>
    implements _$OrganizationInfoCopyWith<$Res> {
  __$OrganizationInfoCopyWithImpl(this._self, this._then);

  final _OrganizationInfo _self;
  final $Res Function(_OrganizationInfo) _then;

  /// Create a copy of OrganizationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? contacts = freezed,
    Object? image = freezed,
  }) {
    return _then(_OrganizationInfo(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _self.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
