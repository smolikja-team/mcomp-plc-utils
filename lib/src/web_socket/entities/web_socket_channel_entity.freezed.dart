// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_socket_channel_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WebSocketChannelEntity {
  String get plcId;
  String get address;
  WebSocketChannel get channel;

  /// Create a copy of WebSocketChannelEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WebSocketChannelEntityCopyWith<WebSocketChannelEntity> get copyWith =>
      _$WebSocketChannelEntityCopyWithImpl<WebSocketChannelEntity>(
          this as WebSocketChannelEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WebSocketChannelEntity &&
            (identical(other.plcId, plcId) || other.plcId == plcId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plcId, address, channel);

  @override
  String toString() {
    return 'WebSocketChannelEntity(plcId: $plcId, address: $address, channel: $channel)';
  }
}

/// @nodoc
abstract mixin class $WebSocketChannelEntityCopyWith<$Res> {
  factory $WebSocketChannelEntityCopyWith(WebSocketChannelEntity value,
          $Res Function(WebSocketChannelEntity) _then) =
      _$WebSocketChannelEntityCopyWithImpl;
  @useResult
  $Res call({String plcId, String address, WebSocketChannel channel});
}

/// @nodoc
class _$WebSocketChannelEntityCopyWithImpl<$Res>
    implements $WebSocketChannelEntityCopyWith<$Res> {
  _$WebSocketChannelEntityCopyWithImpl(this._self, this._then);

  final WebSocketChannelEntity _self;
  final $Res Function(WebSocketChannelEntity) _then;

  /// Create a copy of WebSocketChannelEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plcId = null,
    Object? address = null,
    Object? channel = null,
  }) {
    return _then(_self.copyWith(
      plcId: null == plcId
          ? _self.plcId
          : plcId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as WebSocketChannel,
    ));
  }
}

/// Adds pattern-matching-related methods to [WebSocketChannelEntity].
extension WebSocketChannelEntityPatterns on WebSocketChannelEntity {
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
    TResult Function(_WebSocketChannelEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WebSocketChannelEntity() when $default != null:
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
    TResult Function(_WebSocketChannelEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WebSocketChannelEntity():
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
    TResult? Function(_WebSocketChannelEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WebSocketChannelEntity() when $default != null:
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
    TResult Function(String plcId, String address, WebSocketChannel channel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WebSocketChannelEntity() when $default != null:
        return $default(_that.plcId, _that.address, _that.channel);
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
    TResult Function(String plcId, String address, WebSocketChannel channel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WebSocketChannelEntity():
        return $default(_that.plcId, _that.address, _that.channel);
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
    TResult? Function(String plcId, String address, WebSocketChannel channel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WebSocketChannelEntity() when $default != null:
        return $default(_that.plcId, _that.address, _that.channel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _WebSocketChannelEntity implements WebSocketChannelEntity {
  const _WebSocketChannelEntity(
      {required this.plcId, required this.address, required this.channel});

  @override
  final String plcId;
  @override
  final String address;
  @override
  final WebSocketChannel channel;

  /// Create a copy of WebSocketChannelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WebSocketChannelEntityCopyWith<_WebSocketChannelEntity> get copyWith =>
      __$WebSocketChannelEntityCopyWithImpl<_WebSocketChannelEntity>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WebSocketChannelEntity &&
            (identical(other.plcId, plcId) || other.plcId == plcId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.channel, channel) || other.channel == channel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plcId, address, channel);

  @override
  String toString() {
    return 'WebSocketChannelEntity(plcId: $plcId, address: $address, channel: $channel)';
  }
}

/// @nodoc
abstract mixin class _$WebSocketChannelEntityCopyWith<$Res>
    implements $WebSocketChannelEntityCopyWith<$Res> {
  factory _$WebSocketChannelEntityCopyWith(_WebSocketChannelEntity value,
          $Res Function(_WebSocketChannelEntity) _then) =
      __$WebSocketChannelEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String plcId, String address, WebSocketChannel channel});
}

/// @nodoc
class __$WebSocketChannelEntityCopyWithImpl<$Res>
    implements _$WebSocketChannelEntityCopyWith<$Res> {
  __$WebSocketChannelEntityCopyWithImpl(this._self, this._then);

  final _WebSocketChannelEntity _self;
  final $Res Function(_WebSocketChannelEntity) _then;

  /// Create a copy of WebSocketChannelEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? plcId = null,
    Object? address = null,
    Object? channel = null,
  }) {
    return _then(_WebSocketChannelEntity(
      plcId: null == plcId
          ? _self.plcId
          : plcId // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as WebSocketChannel,
    ));
  }
}

// dart format on
