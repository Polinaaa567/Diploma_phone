// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Event {
  String? get name;
  String? get description;
  String? get date;
  String? get image;
  String? get dateC;
  String? get address;
  String? get format;
  String? get type;
  String? get linkDobroRF;
  String? get message;
  int? get id;
  int? get maxCountParticipants;
  int? get countParticipants;
  int? get age;
  int? get points;
  bool? get isRelevance;
  bool? get status;
  bool? get stampParticipate;
  double? get timeParticipate;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventCopyWith<Event> get copyWith =>
      _$EventCopyWithImpl<Event>(this as Event, _$identity);

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Event &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.dateC, dateC) || other.dateC == dateC) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.linkDobroRF, linkDobroRF) ||
                other.linkDobroRF == linkDobroRF) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maxCountParticipants, maxCountParticipants) ||
                other.maxCountParticipants == maxCountParticipants) &&
            (identical(other.countParticipants, countParticipants) ||
                other.countParticipants == countParticipants) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.isRelevance, isRelevance) ||
                other.isRelevance == isRelevance) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stampParticipate, stampParticipate) ||
                other.stampParticipate == stampParticipate) &&
            (identical(other.timeParticipate, timeParticipate) ||
                other.timeParticipate == timeParticipate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        description,
        date,
        image,
        dateC,
        address,
        format,
        type,
        linkDobroRF,
        message,
        id,
        maxCountParticipants,
        countParticipants,
        age,
        points,
        isRelevance,
        status,
        stampParticipate,
        timeParticipate
      ]);

  @override
  String toString() {
    return 'Event(name: $name, description: $description, date: $date, image: $image, dateC: $dateC, address: $address, format: $format, type: $type, linkDobroRF: $linkDobroRF, message: $message, id: $id, maxCountParticipants: $maxCountParticipants, countParticipants: $countParticipants, age: $age, points: $points, isRelevance: $isRelevance, status: $status, stampParticipate: $stampParticipate, timeParticipate: $timeParticipate)';
  }
}

/// @nodoc
abstract mixin class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) =
      _$EventCopyWithImpl;
  @useResult
  $Res call(
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
      double? timeParticipate});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? image = freezed,
    Object? dateC = freezed,
    Object? address = freezed,
    Object? format = freezed,
    Object? type = freezed,
    Object? linkDobroRF = freezed,
    Object? message = freezed,
    Object? id = freezed,
    Object? maxCountParticipants = freezed,
    Object? countParticipants = freezed,
    Object? age = freezed,
    Object? points = freezed,
    Object? isRelevance = freezed,
    Object? status = freezed,
    Object? stampParticipate = freezed,
    Object? timeParticipate = freezed,
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
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      dateC: freezed == dateC
          ? _self.dateC
          : dateC // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      linkDobroRF: freezed == linkDobroRF
          ? _self.linkDobroRF
          : linkDobroRF // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      maxCountParticipants: freezed == maxCountParticipants
          ? _self.maxCountParticipants
          : maxCountParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      countParticipants: freezed == countParticipants
          ? _self.countParticipants
          : countParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      isRelevance: freezed == isRelevance
          ? _self.isRelevance
          : isRelevance // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      stampParticipate: freezed == stampParticipate
          ? _self.stampParticipate
          : stampParticipate // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeParticipate: freezed == timeParticipate
          ? _self.timeParticipate
          : timeParticipate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
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
    TResult Function(_Event value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Event() when $default != null:
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
    TResult Function(_Event value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Event():
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
    TResult? Function(_Event value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Event() when $default != null:
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
            String? name,
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
            double? timeParticipate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Event() when $default != null:
        return $default(
            _that.name,
            _that.description,
            _that.date,
            _that.image,
            _that.dateC,
            _that.address,
            _that.format,
            _that.type,
            _that.linkDobroRF,
            _that.message,
            _that.id,
            _that.maxCountParticipants,
            _that.countParticipants,
            _that.age,
            _that.points,
            _that.isRelevance,
            _that.status,
            _that.stampParticipate,
            _that.timeParticipate);
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
            String? name,
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
            double? timeParticipate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Event():
        return $default(
            _that.name,
            _that.description,
            _that.date,
            _that.image,
            _that.dateC,
            _that.address,
            _that.format,
            _that.type,
            _that.linkDobroRF,
            _that.message,
            _that.id,
            _that.maxCountParticipants,
            _that.countParticipants,
            _that.age,
            _that.points,
            _that.isRelevance,
            _that.status,
            _that.stampParticipate,
            _that.timeParticipate);
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
            String? name,
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
            double? timeParticipate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Event() when $default != null:
        return $default(
            _that.name,
            _that.description,
            _that.date,
            _that.image,
            _that.dateC,
            _that.address,
            _that.format,
            _that.type,
            _that.linkDobroRF,
            _that.message,
            _that.id,
            _that.maxCountParticipants,
            _that.countParticipants,
            _that.age,
            _that.points,
            _that.isRelevance,
            _that.status,
            _that.stampParticipate,
            _that.timeParticipate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Event implements Event {
  const _Event(
      {this.name,
      this.description,
      this.date,
      this.image,
      this.dateC,
      this.address,
      this.format,
      this.type,
      this.linkDobroRF,
      this.message,
      this.id,
      this.maxCountParticipants,
      this.countParticipants,
      this.age,
      this.points,
      this.isRelevance,
      this.status,
      this.stampParticipate,
      this.timeParticipate});
  factory _Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? date;
  @override
  final String? image;
  @override
  final String? dateC;
  @override
  final String? address;
  @override
  final String? format;
  @override
  final String? type;
  @override
  final String? linkDobroRF;
  @override
  final String? message;
  @override
  final int? id;
  @override
  final int? maxCountParticipants;
  @override
  final int? countParticipants;
  @override
  final int? age;
  @override
  final int? points;
  @override
  final bool? isRelevance;
  @override
  final bool? status;
  @override
  final bool? stampParticipate;
  @override
  final double? timeParticipate;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Event &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.dateC, dateC) || other.dateC == dateC) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.linkDobroRF, linkDobroRF) ||
                other.linkDobroRF == linkDobroRF) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maxCountParticipants, maxCountParticipants) ||
                other.maxCountParticipants == maxCountParticipants) &&
            (identical(other.countParticipants, countParticipants) ||
                other.countParticipants == countParticipants) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.isRelevance, isRelevance) ||
                other.isRelevance == isRelevance) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stampParticipate, stampParticipate) ||
                other.stampParticipate == stampParticipate) &&
            (identical(other.timeParticipate, timeParticipate) ||
                other.timeParticipate == timeParticipate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        description,
        date,
        image,
        dateC,
        address,
        format,
        type,
        linkDobroRF,
        message,
        id,
        maxCountParticipants,
        countParticipants,
        age,
        points,
        isRelevance,
        status,
        stampParticipate,
        timeParticipate
      ]);

  @override
  String toString() {
    return 'Event(name: $name, description: $description, date: $date, image: $image, dateC: $dateC, address: $address, format: $format, type: $type, linkDobroRF: $linkDobroRF, message: $message, id: $id, maxCountParticipants: $maxCountParticipants, countParticipants: $countParticipants, age: $age, points: $points, isRelevance: $isRelevance, status: $status, stampParticipate: $stampParticipate, timeParticipate: $timeParticipate)';
  }
}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) =
      __$EventCopyWithImpl;
  @override
  @useResult
  $Res call(
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
      double? timeParticipate});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? image = freezed,
    Object? dateC = freezed,
    Object? address = freezed,
    Object? format = freezed,
    Object? type = freezed,
    Object? linkDobroRF = freezed,
    Object? message = freezed,
    Object? id = freezed,
    Object? maxCountParticipants = freezed,
    Object? countParticipants = freezed,
    Object? age = freezed,
    Object? points = freezed,
    Object? isRelevance = freezed,
    Object? status = freezed,
    Object? stampParticipate = freezed,
    Object? timeParticipate = freezed,
  }) {
    return _then(_Event(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      dateC: freezed == dateC
          ? _self.dateC
          : dateC // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      format: freezed == format
          ? _self.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      linkDobroRF: freezed == linkDobroRF
          ? _self.linkDobroRF
          : linkDobroRF // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      maxCountParticipants: freezed == maxCountParticipants
          ? _self.maxCountParticipants
          : maxCountParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      countParticipants: freezed == countParticipants
          ? _self.countParticipants
          : countParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      isRelevance: freezed == isRelevance
          ? _self.isRelevance
          : isRelevance // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      stampParticipate: freezed == stampParticipate
          ? _self.stampParticipate
          : stampParticipate // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeParticipate: freezed == timeParticipate
          ? _self.timeParticipate
          : timeParticipate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
