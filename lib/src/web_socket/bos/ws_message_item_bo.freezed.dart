// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_message_item_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WsMessageItemBO {

 String get id;@JsonKey(name: 'props') Map<String, dynamic> get value;
/// Create a copy of WsMessageItemBO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsMessageItemBOCopyWith<WsMessageItemBO> get copyWith => _$WsMessageItemBOCopyWithImpl<WsMessageItemBO>(this as WsMessageItemBO, _$identity);

  /// Serializes this WsMessageItemBO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsMessageItemBO&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.value, value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'WsMessageItemBO(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class $WsMessageItemBOCopyWith<$Res>  {
  factory $WsMessageItemBOCopyWith(WsMessageItemBO value, $Res Function(WsMessageItemBO) _then) = _$WsMessageItemBOCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'props') Map<String, dynamic> value
});




}
/// @nodoc
class _$WsMessageItemBOCopyWithImpl<$Res>
    implements $WsMessageItemBOCopyWith<$Res> {
  _$WsMessageItemBOCopyWithImpl(this._self, this._then);

  final WsMessageItemBO _self;
  final $Res Function(WsMessageItemBO) _then;

/// Create a copy of WsMessageItemBO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? value = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [WsMessageItemBO].
extension WsMessageItemBOPatterns on WsMessageItemBO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WsMessageItemBO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WsMessageItemBO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WsMessageItemBO value)  $default,){
final _that = this;
switch (_that) {
case _WsMessageItemBO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WsMessageItemBO value)?  $default,){
final _that = this;
switch (_that) {
case _WsMessageItemBO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'props')  Map<String, dynamic> value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WsMessageItemBO() when $default != null:
return $default(_that.id,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'props')  Map<String, dynamic> value)  $default,) {final _that = this;
switch (_that) {
case _WsMessageItemBO():
return $default(_that.id,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'props')  Map<String, dynamic> value)?  $default,) {final _that = this;
switch (_that) {
case _WsMessageItemBO() when $default != null:
return $default(_that.id,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WsMessageItemBO implements WsMessageItemBO {
  const _WsMessageItemBO({required this.id, @JsonKey(name: 'props') required final  Map<String, dynamic> value}): _value = value;
  factory _WsMessageItemBO.fromJson(Map<String, dynamic> json) => _$WsMessageItemBOFromJson(json);

@override final  String id;
 final  Map<String, dynamic> _value;
@override@JsonKey(name: 'props') Map<String, dynamic> get value {
  if (_value is EqualUnmodifiableMapView) return _value;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_value);
}


/// Create a copy of WsMessageItemBO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsMessageItemBOCopyWith<_WsMessageItemBO> get copyWith => __$WsMessageItemBOCopyWithImpl<_WsMessageItemBO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WsMessageItemBOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsMessageItemBO&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._value, _value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_value));

@override
String toString() {
  return 'WsMessageItemBO(id: $id, value: $value)';
}


}

/// @nodoc
abstract mixin class _$WsMessageItemBOCopyWith<$Res> implements $WsMessageItemBOCopyWith<$Res> {
  factory _$WsMessageItemBOCopyWith(_WsMessageItemBO value, $Res Function(_WsMessageItemBO) _then) = __$WsMessageItemBOCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'props') Map<String, dynamic> value
});




}
/// @nodoc
class __$WsMessageItemBOCopyWithImpl<$Res>
    implements _$WsMessageItemBOCopyWith<$Res> {
  __$WsMessageItemBOCopyWithImpl(this._self, this._then);

  final _WsMessageItemBO _self;
  final $Res Function(_WsMessageItemBO) _then;

/// Create a copy of WsMessageItemBO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? value = null,}) {
  return _then(_WsMessageItemBO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self._value : value // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
