// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plc_string_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlcStringBO {

@JsonKey(name: 'val') double get value; String get dt;
/// Create a copy of PlcStringBO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlcStringBOCopyWith<PlcStringBO> get copyWith => _$PlcStringBOCopyWithImpl<PlcStringBO>(this as PlcStringBO, _$identity);

  /// Serializes this PlcStringBO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlcStringBO&&(identical(other.value, value) || other.value == value)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,dt);

@override
String toString() {
  return 'PlcStringBO(value: $value, dt: $dt)';
}


}

/// @nodoc
abstract mixin class $PlcStringBOCopyWith<$Res>  {
  factory $PlcStringBOCopyWith(PlcStringBO value, $Res Function(PlcStringBO) _then) = _$PlcStringBOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'val') double value, String dt
});




}
/// @nodoc
class _$PlcStringBOCopyWithImpl<$Res>
    implements $PlcStringBOCopyWith<$Res> {
  _$PlcStringBOCopyWithImpl(this._self, this._then);

  final PlcStringBO _self;
  final $Res Function(PlcStringBO) _then;

/// Create a copy of PlcStringBO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? dt = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlcStringBO].
extension PlcStringBOPatterns on PlcStringBO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlcStringBO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlcStringBO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlcStringBO value)  $default,){
final _that = this;
switch (_that) {
case _PlcStringBO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlcStringBO value)?  $default,){
final _that = this;
switch (_that) {
case _PlcStringBO() when $default != null:
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
case _PlcStringBO() when $default != null:
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
case _PlcStringBO():
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
case _PlcStringBO() when $default != null:
return $default(_that.value,_that.dt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlcStringBO implements PlcStringBO {
  const _PlcStringBO({@JsonKey(name: 'val') required this.value, this.dt = 'STRING'});
  factory _PlcStringBO.fromJson(Map<String, dynamic> json) => _$PlcStringBOFromJson(json);

@override@JsonKey(name: 'val') final  double value;
@override@JsonKey() final  String dt;

/// Create a copy of PlcStringBO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlcStringBOCopyWith<_PlcStringBO> get copyWith => __$PlcStringBOCopyWithImpl<_PlcStringBO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlcStringBOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlcStringBO&&(identical(other.value, value) || other.value == value)&&(identical(other.dt, dt) || other.dt == dt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,dt);

@override
String toString() {
  return 'PlcStringBO(value: $value, dt: $dt)';
}


}

/// @nodoc
abstract mixin class _$PlcStringBOCopyWith<$Res> implements $PlcStringBOCopyWith<$Res> {
  factory _$PlcStringBOCopyWith(_PlcStringBO value, $Res Function(_PlcStringBO) _then) = __$PlcStringBOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'val') double value, String dt
});




}
/// @nodoc
class __$PlcStringBOCopyWithImpl<$Res>
    implements _$PlcStringBOCopyWith<$Res> {
  __$PlcStringBOCopyWithImpl(this._self, this._then);

  final _PlcStringBO _self;
  final $Res Function(_PlcStringBO) _then;

/// Create a copy of PlcStringBO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? dt = null,}) {
  return _then(_PlcStringBO(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
