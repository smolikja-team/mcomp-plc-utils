// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_set_message_payload_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WsSetMessagePayloadBO {
  String get id;
  @JsonKey(name: 'props')
  Map<String, dynamic> get update;

  /// Create a copy of WsSetMessagePayloadBO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WsSetMessagePayloadBOCopyWith<WsSetMessagePayloadBO> get copyWith =>
      _$WsSetMessagePayloadBOCopyWithImpl<WsSetMessagePayloadBO>(
          this as WsSetMessagePayloadBO, _$identity);

  /// Serializes this WsSetMessagePayloadBO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WsSetMessagePayloadBO &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.update, update));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(update));

  @override
  String toString() {
    return 'WsSetMessagePayloadBO(id: $id, update: $update)';
  }
}

/// @nodoc
abstract mixin class $WsSetMessagePayloadBOCopyWith<$Res> {
  factory $WsSetMessagePayloadBOCopyWith(WsSetMessagePayloadBO value,
          $Res Function(WsSetMessagePayloadBO) _then) =
      _$WsSetMessagePayloadBOCopyWithImpl;
  @useResult
  $Res call({String id, @JsonKey(name: 'props') Map<String, dynamic> update});
}

/// @nodoc
class _$WsSetMessagePayloadBOCopyWithImpl<$Res>
    implements $WsSetMessagePayloadBOCopyWith<$Res> {
  _$WsSetMessagePayloadBOCopyWithImpl(this._self, this._then);

  final WsSetMessagePayloadBO _self;
  final $Res Function(WsSetMessagePayloadBO) _then;

  /// Create a copy of WsSetMessagePayloadBO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? update = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      update: null == update
          ? _self.update
          : update // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [WsSetMessagePayloadBO].
extension WsSetMessagePayloadBOPatterns on WsSetMessagePayloadBO {
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
    TResult Function(_WsSetMessagePayloadBO value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WsSetMessagePayloadBO() when $default != null:
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
    TResult Function(_WsSetMessagePayloadBO value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WsSetMessagePayloadBO():
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
    TResult? Function(_WsSetMessagePayloadBO value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WsSetMessagePayloadBO() when $default != null:
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
            String id, @JsonKey(name: 'props') Map<String, dynamic> update)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WsSetMessagePayloadBO() when $default != null:
        return $default(_that.id, _that.update);
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
            String id, @JsonKey(name: 'props') Map<String, dynamic> update)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WsSetMessagePayloadBO():
        return $default(_that.id, _that.update);
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
            String id, @JsonKey(name: 'props') Map<String, dynamic> update)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WsSetMessagePayloadBO() when $default != null:
        return $default(_that.id, _that.update);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _WsSetMessagePayloadBO implements WsSetMessagePayloadBO {
  const _WsSetMessagePayloadBO(
      {required this.id,
      @JsonKey(name: 'props') required final Map<String, dynamic> update})
      : _update = update;
  factory _WsSetMessagePayloadBO.fromJson(Map<String, dynamic> json) =>
      _$WsSetMessagePayloadBOFromJson(json);

  @override
  final String id;
  final Map<String, dynamic> _update;
  @override
  @JsonKey(name: 'props')
  Map<String, dynamic> get update {
    if (_update is EqualUnmodifiableMapView) return _update;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_update);
  }

  /// Create a copy of WsSetMessagePayloadBO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WsSetMessagePayloadBOCopyWith<_WsSetMessagePayloadBO> get copyWith =>
      __$WsSetMessagePayloadBOCopyWithImpl<_WsSetMessagePayloadBO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WsSetMessagePayloadBOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WsSetMessagePayloadBO &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._update, _update));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_update));

  @override
  String toString() {
    return 'WsSetMessagePayloadBO(id: $id, update: $update)';
  }
}

/// @nodoc
abstract mixin class _$WsSetMessagePayloadBOCopyWith<$Res>
    implements $WsSetMessagePayloadBOCopyWith<$Res> {
  factory _$WsSetMessagePayloadBOCopyWith(_WsSetMessagePayloadBO value,
          $Res Function(_WsSetMessagePayloadBO) _then) =
      __$WsSetMessagePayloadBOCopyWithImpl;
  @override
  @useResult
  $Res call({String id, @JsonKey(name: 'props') Map<String, dynamic> update});
}

/// @nodoc
class __$WsSetMessagePayloadBOCopyWithImpl<$Res>
    implements _$WsSetMessagePayloadBOCopyWith<$Res> {
  __$WsSetMessagePayloadBOCopyWithImpl(this._self, this._then);

  final _WsSetMessagePayloadBO _self;
  final $Res Function(_WsSetMessagePayloadBO) _then;

  /// Create a copy of WsSetMessagePayloadBO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? update = null,
  }) {
    return _then(_WsSetMessagePayloadBO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      update: null == update
          ? _self._update
          : update // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

// dart format on
