// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plc_dt_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlcDtBO {
  @JsonKey(name: 'val')
  double get value;
  String get dt;

  /// Create a copy of PlcDtBO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlcDtBOCopyWith<PlcDtBO> get copyWith =>
      _$PlcDtBOCopyWithImpl<PlcDtBO>(this as PlcDtBO, _$identity);

  /// Serializes this PlcDtBO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlcDtBO &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.dt, dt) || other.dt == dt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, dt);

  @override
  String toString() {
    return 'PlcDtBO(value: $value, dt: $dt)';
  }
}

/// @nodoc
abstract mixin class $PlcDtBOCopyWith<$Res> {
  factory $PlcDtBOCopyWith(PlcDtBO value, $Res Function(PlcDtBO) _then) =
      _$PlcDtBOCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'val') double value, String dt});
}

/// @nodoc
class _$PlcDtBOCopyWithImpl<$Res> implements $PlcDtBOCopyWith<$Res> {
  _$PlcDtBOCopyWithImpl(this._self, this._then);

  final PlcDtBO _self;
  final $Res Function(PlcDtBO) _then;

  /// Create a copy of PlcDtBO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? dt = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      dt: null == dt
          ? _self.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlcDtBO].
extension PlcDtBOPatterns on PlcDtBO {
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
    TResult Function(_PlcDtBO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlcDtBO() when $default != null:
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
    TResult Function(_PlcDtBO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlcDtBO():
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
    TResult? Function(_PlcDtBO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlcDtBO() when $default != null:
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
    TResult Function(@JsonKey(name: 'val') double value, String dt)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlcDtBO() when $default != null:
        return $default(_that.value, _that.dt);
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
    TResult Function(@JsonKey(name: 'val') double value, String dt) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlcDtBO():
        return $default(_that.value, _that.dt);
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
    TResult? Function(@JsonKey(name: 'val') double value, String dt)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlcDtBO() when $default != null:
        return $default(_that.value, _that.dt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PlcDtBO implements PlcDtBO {
  const _PlcDtBO({@JsonKey(name: 'val') required this.value, this.dt = 'DT'});
  factory _PlcDtBO.fromJson(Map<String, dynamic> json) =>
      _$PlcDtBOFromJson(json);

  @override
  @JsonKey(name: 'val')
  final double value;
  @override
  @JsonKey()
  final String dt;

  /// Create a copy of PlcDtBO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlcDtBOCopyWith<_PlcDtBO> get copyWith =>
      __$PlcDtBOCopyWithImpl<_PlcDtBO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlcDtBOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlcDtBO &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.dt, dt) || other.dt == dt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, dt);

  @override
  String toString() {
    return 'PlcDtBO(value: $value, dt: $dt)';
  }
}

/// @nodoc
abstract mixin class _$PlcDtBOCopyWith<$Res> implements $PlcDtBOCopyWith<$Res> {
  factory _$PlcDtBOCopyWith(_PlcDtBO value, $Res Function(_PlcDtBO) _then) =
      __$PlcDtBOCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'val') double value, String dt});
}

/// @nodoc
class __$PlcDtBOCopyWithImpl<$Res> implements _$PlcDtBOCopyWith<$Res> {
  __$PlcDtBOCopyWithImpl(this._self, this._then);

  final _PlcDtBO _self;
  final $Res Function(_PlcDtBO) _then;

  /// Create a copy of PlcDtBO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? dt = null,
  }) {
    return _then(_PlcDtBO(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      dt: null == dt
          ? _self.dt
          : dt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
