// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrganizationInfo _$OrganizationInfoFromJson(Map<String, dynamic> json) {
  return _OrganizationInfo.fromJson(json);
}

/// @nodoc
mixin _$OrganizationInfo {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get contacts => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this OrganizationInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrganizationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizationInfoCopyWith<OrganizationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationInfoCopyWith<$Res> {
  factory $OrganizationInfoCopyWith(
          OrganizationInfo value, $Res Function(OrganizationInfo) then) =
      _$OrganizationInfoCopyWithImpl<$Res, OrganizationInfo>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      String? address,
      String? contacts,
      String? image});
}

/// @nodoc
class _$OrganizationInfoCopyWithImpl<$Res, $Val extends OrganizationInfo>
    implements $OrganizationInfoCopyWith<$Res> {
  _$OrganizationInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizationInfoImplCopyWith<$Res>
    implements $OrganizationInfoCopyWith<$Res> {
  factory _$$OrganizationInfoImplCopyWith(_$OrganizationInfoImpl value,
          $Res Function(_$OrganizationInfoImpl) then) =
      __$$OrganizationInfoImplCopyWithImpl<$Res>;
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
class __$$OrganizationInfoImplCopyWithImpl<$Res>
    extends _$OrganizationInfoCopyWithImpl<$Res, _$OrganizationInfoImpl>
    implements _$$OrganizationInfoImplCopyWith<$Res> {
  __$$OrganizationInfoImplCopyWithImpl(_$OrganizationInfoImpl _value,
      $Res Function(_$OrganizationInfoImpl) _then)
      : super(_value, _then);

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
    return _then(_$OrganizationInfoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contacts: freezed == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizationInfoImpl implements _OrganizationInfo {
  const _$OrganizationInfoImpl(
      {this.name, this.description, this.address, this.contacts, this.image});

  factory _$OrganizationInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationInfoImplFromJson(json);

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

  @override
  String toString() {
    return 'OrganizationInfo(name: $name, description: $description, address: $address, contacts: $contacts, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizationInfoImpl &&
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

  /// Create a copy of OrganizationInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationInfoImplCopyWith<_$OrganizationInfoImpl> get copyWith =>
      __$$OrganizationInfoImplCopyWithImpl<_$OrganizationInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationInfoImplToJson(
      this,
    );
  }
}

abstract class _OrganizationInfo implements OrganizationInfo {
  const factory _OrganizationInfo(
      {final String? name,
      final String? description,
      final String? address,
      final String? contacts,
      final String? image}) = _$OrganizationInfoImpl;

  factory _OrganizationInfo.fromJson(Map<String, dynamic> json) =
      _$OrganizationInfoImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get address;
  @override
  String? get contacts;
  @override
  String? get image;

  /// Create a copy of OrganizationInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizationInfoImplCopyWith<_$OrganizationInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
