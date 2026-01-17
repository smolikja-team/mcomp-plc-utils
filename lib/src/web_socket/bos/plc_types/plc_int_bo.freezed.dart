// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plc_int_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlcIntBO {

@JsonKey(name: 'val') int get value; String get dt;
/// Create a copy of PlcIntBO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlcIntBOCopyWith<PlcIntBO> get copyWith => _$PlcIntBOCopyWithImpl<PlcIntBO>(this as PlcIntBO, _$identity);

  /// Serializes this PlcIntBO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlcIntBO&&(identical(other.value, value) || other.value == value)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,dt);

@override
String toString() {
  return 'PlcIntBO(value: $value, dt: $dt)';
}


}

/// @nodoc
abstract mixin class $PlcIntBOCopyWith<$Res>  {
  factory $PlcIntBOCopyWith(PlcIntBO value, $Res Function(PlcIntBO) _then) = _$PlcIntBOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'val') int value, String dt
});




}
/// @nodoc
class _$PlcIntBOCopyWithImpl<$Res>
    implements $PlcIntBOCopyWith<$Res> {
  _$PlcIntBOCopyWithImpl(this._self, this._then);

  final PlcIntBO _self;
  final $Res Function(PlcIntBO) _then;

/// Create a copy of PlcIntBO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? dt = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlcIntBO].
extension PlcIntBOPatterns on PlcIntBO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlcIntBO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlcIntBO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlcIntBO value)  $default,){
final _that = this;
switch (_that) {
case _PlcIntBO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlcIntBO value)?  $default,){
final _that = this;
switch (_that) {
case _PlcIntBO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'val')  int value,  String dt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlcIntBO() when $default != null:
return $default(_that.value,_that.dt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'val')  int value,  String dt)  $default,) {final _that = this;
switch (_that) {
case _PlcIntBO():
return $default(_that.value,_that.dt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'val')  int value,  String dt)?  $default,) {final _that = this;
switch (_that) {
case _PlcIntBO() when $default != null:
return $default(_that.value,_that.dt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlcIntBO implements PlcIntBO {
  const _PlcIntBO({@JsonKey(name: 'val') required this.value, this.dt = 'USINT'});
  factory _PlcIntBO.fromJson(Map<String, dynamic> json) => _$PlcIntBOFromJson(json);

@override@JsonKey(name: 'val') final  int value;
@override@JsonKey() final  String dt;

/// Create a copy of PlcIntBO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlcIntBOCopyWith<_PlcIntBO> get copyWith => __$PlcIntBOCopyWithImpl<_PlcIntBO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlcIntBOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlcIntBO&&(identical(other.value, value) || other.value == value)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,dt);

@override
String toString() {
  return 'PlcIntBO(value: $value, dt: $dt)';
}


}

/// @nodoc
abstract mixin class _$PlcIntBOCopyWith<$Res> implements $PlcIntBOCopyWith<$Res> {
  factory _$PlcIntBOCopyWith(_PlcIntBO value, $Res Function(_PlcIntBO) _then) = __$PlcIntBOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'val') int value, String dt
});




}
/// @nodoc
class __$PlcIntBOCopyWithImpl<$Res>
    implements _$PlcIntBOCopyWith<$Res> {
  __$PlcIntBOCopyWithImpl(this._self, this._then);

  final _PlcIntBO _self;
  final $Res Function(_PlcIntBO) _then;

/// Create a copy of PlcIntBO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? dt = null,}) {
  return _then(_PlcIntBO(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
