// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pagination {
  List<Event>? get events;
  int? get total;
  bool? get hasMore;
  List<Lesson>? get lessons;
  List<News>? get news;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Pagination> get copyWith =>
      _$PaginationCopyWithImpl<Pagination>(this as Pagination, _$identity);

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Pagination &&
            const DeepCollectionEquality().equals(other.events, events) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other.lessons, lessons) &&
            const DeepCollectionEquality().equals(other.news, news));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(events),
      total,
      hasMore,
      const DeepCollectionEquality().hash(lessons),
      const DeepCollectionEquality().hash(news));

  @override
  String toString() {
    return 'Pagination(events: $events, total: $total, hasMore: $hasMore, lessons: $lessons, news: $news)';
  }
}

/// @nodoc
abstract mixin class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) _then) =
      _$PaginationCopyWithImpl;
  @useResult
  $Res call(
      {List<Event>? events,
      int? total,
      bool? hasMore,
      List<Lesson>? lessons,
      List<News>? news});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res> implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._self, this._then);

  final Pagination _self;
  final $Res Function(Pagination) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? total = freezed,
    Object? hasMore = freezed,
    Object? lessons = freezed,
    Object? news = freezed,
  }) {
    return _then(_self.copyWith(
      events: freezed == events
          ? _self.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      hasMore: freezed == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      lessons: freezed == lessons
          ? _self.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      news: freezed == news
          ? _self.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Pagination].
extension PaginationPatterns on Pagination {
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
    TResult Function(_Pagination value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Pagination() when $default != null:
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
    TResult Function(_Pagination value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Pagination():
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
    TResult? Function(_Pagination value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Pagination() when $default != null:
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
    TResult Function(List<Event>? events, int? total, bool? hasMore,
            List<Lesson>? lessons, List<News>? news)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Pagination() when $default != null:
        return $default(_that.events, _that.total, _that.hasMore, _that.lessons,
            _that.news);
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
    TResult Function(List<Event>? events, int? total, bool? hasMore,
            List<Lesson>? lessons, List<News>? news)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Pagination():
        return $default(_that.events, _that.total, _that.hasMore, _that.lessons,
            _that.news);
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
    TResult? Function(List<Event>? events, int? total, bool? hasMore,
            List<Lesson>? lessons, List<News>? news)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Pagination() when $default != null:
        return $default(_that.events, _that.total, _that.hasMore, _that.lessons,
            _that.news);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Pagination implements Pagination {
  const _Pagination(
      {final List<Event>? events,
      this.total,
      this.hasMore,
      final List<Lesson>? lessons,
      final List<News>? news})
      : _events = events,
        _lessons = lessons,
        _news = news;
  factory _Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  final List<Event>? _events;
  @override
  List<Event>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;
  @override
  final bool? hasMore;
  final List<Lesson>? _lessons;
  @override
  List<Lesson>? get lessons {
    final value = _lessons;
    if (value == null) return null;
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<News>? _news;
  @override
  List<News>? get news {
    final value = _news;
    if (value == null) return null;
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationCopyWith<_Pagination> get copyWith =>
      __$PaginationCopyWithImpl<_Pagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Pagination &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      total,
      hasMore,
      const DeepCollectionEquality().hash(_lessons),
      const DeepCollectionEquality().hash(_news));

  @override
  String toString() {
    return 'Pagination(events: $events, total: $total, hasMore: $hasMore, lessons: $lessons, news: $news)';
  }
}

/// @nodoc
abstract mixin class _$PaginationCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$PaginationCopyWith(
          _Pagination value, $Res Function(_Pagination) _then) =
      __$PaginationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Event>? events,
      int? total,
      bool? hasMore,
      List<Lesson>? lessons,
      List<News>? news});
}

/// @nodoc
class __$PaginationCopyWithImpl<$Res> implements _$PaginationCopyWith<$Res> {
  __$PaginationCopyWithImpl(this._self, this._then);

  final _Pagination _self;
  final $Res Function(_Pagination) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? events = freezed,
    Object? total = freezed,
    Object? hasMore = freezed,
    Object? lessons = freezed,
    Object? news = freezed,
  }) {
    return _then(_Pagination(
      events: freezed == events
          ? _self._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      hasMore: freezed == hasMore
          ? _self.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      lessons: freezed == lessons
          ? _self._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<Lesson>?,
      news: freezed == news
          ? _self._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>?,
    ));
  }
}

// dart format on
