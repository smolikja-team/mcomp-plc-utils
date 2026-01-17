// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_plc_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CachedPlcConfig {

/// PLC identifier matching the Firebase Storage file name.
 String get plcId;/// The actual configuration data.
 Map<String, dynamic> get config;/// Cache metadata for validation.
 CacheMetadata get metadata;
/// Create a copy of CachedPlcConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachedPlcConfigCopyWith<CachedPlcConfig> get copyWith => _$CachedPlcConfigCopyWithImpl<CachedPlcConfig>(this as CachedPlcConfig, _$identity);

  /// Serializes this CachedPlcConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachedPlcConfig&&(identical(other.plcId, plcId) || other.plcId == plcId)&&const DeepCollectionEquality().equals(other.config, config)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plcId,const DeepCollectionEquality().hash(config),metadata);

@override
String toString() {
  return 'CachedPlcConfig(plcId: $plcId, config: $config, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $CachedPlcConfigCopyWith<$Res>  {
  factory $CachedPlcConfigCopyWith(CachedPlcConfig value, $Res Function(CachedPlcConfig) _then) = _$CachedPlcConfigCopyWithImpl;
@useResult
$Res call({
 String plcId, Map<String, dynamic> config, CacheMetadata metadata
});


$CacheMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$CachedPlcConfigCopyWithImpl<$Res>
    implements $CachedPlcConfigCopyWith<$Res> {
  _$CachedPlcConfigCopyWithImpl(this._self, this._then);

  final CachedPlcConfig _self;
  final $Res Function(CachedPlcConfig) _then;

/// Create a copy of CachedPlcConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plcId = null,Object? config = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
plcId: null == plcId ? _self.plcId : plcId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CacheMetadata,
  ));
}
/// Create a copy of CachedPlcConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheMetadataCopyWith<$Res> get metadata {
  
  return $CacheMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [CachedPlcConfig].
extension CachedPlcConfigPatterns on CachedPlcConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachedPlcConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachedPlcConfig() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachedPlcConfig value)  $default,){
final _that = this;
switch (_that) {
case _CachedPlcConfig():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachedPlcConfig value)?  $default,){
final _that = this;
switch (_that) {
case _CachedPlcConfig() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String plcId,  Map<String, dynamic> config,  CacheMetadata metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachedPlcConfig() when $default != null:
return $default(_that.plcId,_that.config,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String plcId,  Map<String, dynamic> config,  CacheMetadata metadata)  $default,) {final _that = this;
switch (_that) {
case _CachedPlcConfig():
return $default(_that.plcId,_that.config,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String plcId,  Map<String, dynamic> config,  CacheMetadata metadata)?  $default,) {final _that = this;
switch (_that) {
case _CachedPlcConfig() when $default != null:
return $default(_that.plcId,_that.config,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CachedPlcConfig implements CachedPlcConfig {
  const _CachedPlcConfig({required this.plcId, required final  Map<String, dynamic> config, required this.metadata}): _config = config;
  factory _CachedPlcConfig.fromJson(Map<String, dynamic> json) => _$CachedPlcConfigFromJson(json);

/// PLC identifier matching the Firebase Storage file name.
@override final  String plcId;
/// The actual configuration data.
 final  Map<String, dynamic> _config;
/// The actual configuration data.
@override Map<String, dynamic> get config {
  if (_config is EqualUnmodifiableMapView) return _config;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_config);
}

/// Cache metadata for validation.
@override final  CacheMetadata metadata;

/// Create a copy of CachedPlcConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachedPlcConfigCopyWith<_CachedPlcConfig> get copyWith => __$CachedPlcConfigCopyWithImpl<_CachedPlcConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CachedPlcConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachedPlcConfig&&(identical(other.plcId, plcId) || other.plcId == plcId)&&const DeepCollectionEquality().equals(other._config, _config)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,plcId,const DeepCollectionEquality().hash(_config),metadata);

@override
String toString() {
  return 'CachedPlcConfig(plcId: $plcId, config: $config, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$CachedPlcConfigCopyWith<$Res> implements $CachedPlcConfigCopyWith<$Res> {
  factory _$CachedPlcConfigCopyWith(_CachedPlcConfig value, $Res Function(_CachedPlcConfig) _then) = __$CachedPlcConfigCopyWithImpl;
@override @useResult
$Res call({
 String plcId, Map<String, dynamic> config, CacheMetadata metadata
});


@override $CacheMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$CachedPlcConfigCopyWithImpl<$Res>
    implements _$CachedPlcConfigCopyWith<$Res> {
  __$CachedPlcConfigCopyWithImpl(this._self, this._then);

  final _CachedPlcConfig _self;
  final $Res Function(_CachedPlcConfig) _then;

/// Create a copy of CachedPlcConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plcId = null,Object? config = null,Object? metadata = null,}) {
  return _then(_CachedPlcConfig(
plcId: null == plcId ? _self.plcId : plcId // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CacheMetadata,
  ));
}

/// Create a copy of CachedPlcConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CacheMetadataCopyWith<$Res> get metadata {
  
  return $CacheMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
