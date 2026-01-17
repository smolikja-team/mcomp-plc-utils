// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plc_real_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlcRealBO {

@JsonKey(name: 'val') double get value; String get dt;
/// Create a copy of PlcRealBO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlcRealBOCopyWith<PlcRealBO> get copyWith => _$PlcRealBOCopyWithImpl<PlcRealBO>(this as PlcRealBO, _$identity);

  /// Serializes this PlcRealBO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlcRealBO&&(identical(other.value, value) || other.value == value)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,dt);

@override
String toString() {
  return 'PlcRealBO(value: $value, dt: $dt)';
}


}

/// @nodoc
abstract mixin class $PlcRealBOCopyWith<$Res>  {
  factory $PlcRealBOCopyWith(PlcRealBO value, $Res Function(PlcRealBO) _then) = _$PlcRealBOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'val') double value, String dt
});




}
/// @nodoc
class _$PlcRealBOCopyWithImpl<$Res>
    implements $PlcRealBOCopyWith<$Res> {
  _$PlcRealBOCopyWithImpl(this._self, this._then);

  final PlcRealBO _self;
  final $Res Function(PlcRealBO) _then;

/// Create a copy of PlcRealBO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? dt = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlcRealBO].
extension PlcRealBOPatterns on PlcRealBO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlcRealBO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlcRealBO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlcRealBO value)  $default,){
final _that = this;
switch (_that) {
case _PlcRealBO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlcRealBO value)?  $default,){
final _that = this;
switch (_that) {
case _PlcRealBO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'val')  double value,  String dt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlcRealBO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'val')  double value,  String dt)  $default,) {final _that = this;
switch (_that) {
case _PlcRealBO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'val')  double value,  String dt)?  $default,) {final _that = this;
switch (_that) {
case _PlcRealBO() when $default != null:
return $default(_that.value,_that.dt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlcRealBO implements PlcRealBO {
  const _PlcRealBO({@JsonKey(name: 'val') required this.value, this.dt = 'REAL'});
  factory _PlcRealBO.fromJson(Map<String, dynamic> json) => _$PlcRealBOFromJson(json);

@override@JsonKey(name: 'val') final  double value;
@override@JsonKey() final  String dt;

/// Create a copy of PlcRealBO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlcRealBOCopyWith<_PlcRealBO> get copyWith => __$PlcRealBOCopyWithImpl<_PlcRealBO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlcRealBOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlcRealBO&&(identical(other.value, value) || other.value == value)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,dt);

@override
String toString() {
  return 'PlcRealBO(value: $value, dt: $dt)';
}


}

/// @nodoc
abstract mixin class _$PlcRealBOCopyWith<$Res> implements $PlcRealBOCopyWith<$Res> {
  factory _$PlcRealBOCopyWith(_PlcRealBO value, $Res Function(_PlcRealBO) _then) = __$PlcRealBOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'val') double value, String dt
});




}
/// @nodoc
class __$PlcRealBOCopyWithImpl<$Res>
    implements _$PlcRealBOCopyWith<$Res> {
  __$PlcRealBOCopyWithImpl(this._self, this._then);

  final _PlcRealBO _self;
  final $Res Function(_PlcRealBO) _then;

/// Create a copy of PlcRealBO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? dt = null,}) {
  return _then(_PlcRealBO(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
