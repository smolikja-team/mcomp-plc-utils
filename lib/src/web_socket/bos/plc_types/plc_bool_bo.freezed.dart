// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plc_bool_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlcBoolBO {

@JsonKey(name: 'val') bool get value; String get dt;
/// Create a copy of PlcBoolBO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlcBoolBOCopyWith<PlcBoolBO> get copyWith => _$PlcBoolBOCopyWithImpl<PlcBoolBO>(this as PlcBoolBO, _$identity);

  /// Serializes this PlcBoolBO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlcBoolBO&&(identical(other.value, value) || other.value == value)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,dt);

@override
String toString() {
  return 'PlcBoolBO(value: $value, dt: $dt)';
}


}

/// @nodoc
abstract mixin class $PlcBoolBOCopyWith<$Res>  {
  factory $PlcBoolBOCopyWith(PlcBoolBO value, $Res Function(PlcBoolBO) _then) = _$PlcBoolBOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'val') bool value, String dt
});




}
/// @nodoc
class _$PlcBoolBOCopyWithImpl<$Res>
    implements $PlcBoolBOCopyWith<$Res> {
  _$PlcBoolBOCopyWithImpl(this._self, this._then);

  final PlcBoolBO _self;
  final $Res Function(PlcBoolBO) _then;

/// Create a copy of PlcBoolBO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? dt = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlcBoolBO].
extension PlcBoolBOPatterns on PlcBoolBO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlcBoolBO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlcBoolBO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlcBoolBO value)  $default,){
final _that = this;
switch (_that) {
case _PlcBoolBO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlcBoolBO value)?  $default,){
final _that = this;
switch (_that) {
case _PlcBoolBO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'val')  bool value,  String dt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlcBoolBO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'val')  bool value,  String dt)  $default,) {final _that = this;
switch (_that) {
case _PlcBoolBO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'val')  bool value,  String dt)?  $default,) {final _that = this;
switch (_that) {
case _PlcBoolBO() when $default != null:
return $default(_that.value,_that.dt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlcBoolBO implements PlcBoolBO {
  const _PlcBoolBO({@JsonKey(name: 'val') required this.value, this.dt = 'BOOL'});
  factory _PlcBoolBO.fromJson(Map<String, dynamic> json) => _$PlcBoolBOFromJson(json);

@override@JsonKey(name: 'val') final  bool value;
@override@JsonKey() final  String dt;

/// Create a copy of PlcBoolBO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlcBoolBOCopyWith<_PlcBoolBO> get copyWith => __$PlcBoolBOCopyWithImpl<_PlcBoolBO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlcBoolBOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlcBoolBO&&(identical(other.value, value) || other.value == value)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,dt);

@override
String toString() {
  return 'PlcBoolBO(value: $value, dt: $dt)';
}


}

/// @nodoc
abstract mixin class _$PlcBoolBOCopyWith<$Res> implements $PlcBoolBOCopyWith<$Res> {
  factory _$PlcBoolBOCopyWith(_PlcBoolBO value, $Res Function(_PlcBoolBO) _then) = __$PlcBoolBOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'val') bool value, String dt
});




}
/// @nodoc
class __$PlcBoolBOCopyWithImpl<$Res>
    implements _$PlcBoolBOCopyWith<$Res> {
  __$PlcBoolBOCopyWithImpl(this._self, this._then);

  final _PlcBoolBO _self;
  final $Res Function(_PlcBoolBO) _then;

/// Create a copy of PlcBoolBO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? dt = null,}) {
  return _then(_PlcBoolBO(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
