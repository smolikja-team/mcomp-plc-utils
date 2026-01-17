// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_get_message_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WsGetMessageBO {

 String get intent; List<String> get payload;
/// Create a copy of WsGetMessageBO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsGetMessageBOCopyWith<WsGetMessageBO> get copyWith => _$WsGetMessageBOCopyWithImpl<WsGetMessageBO>(this as WsGetMessageBO, _$identity);

  /// Serializes this WsGetMessageBO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsGetMessageBO&&(identical(other.intent, intent) || other.intent == intent)&&const DeepCollectionEquality().equals(other.payload, payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,intent,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'WsGetMessageBO(intent: $intent, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $WsGetMessageBOCopyWith<$Res>  {
  factory $WsGetMessageBOCopyWith(WsGetMessageBO value, $Res Function(WsGetMessageBO) _then) = _$WsGetMessageBOCopyWithImpl;
@useResult
$Res call({
 String intent, List<String> payload
});




}
/// @nodoc
class _$WsGetMessageBOCopyWithImpl<$Res>
    implements $WsGetMessageBOCopyWith<$Res> {
  _$WsGetMessageBOCopyWithImpl(this._self, this._then);

  final WsGetMessageBO _self;
  final $Res Function(WsGetMessageBO) _then;

/// Create a copy of WsGetMessageBO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intent = null,Object? payload = null,}) {
  return _then(_self.copyWith(
intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [WsGetMessageBO].
extension WsGetMessageBOPatterns on WsGetMessageBO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WsGetMessageBO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WsGetMessageBO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WsGetMessageBO value)  $default,){
final _that = this;
switch (_that) {
case _WsGetMessageBO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WsGetMessageBO value)?  $default,){
final _that = this;
switch (_that) {
case _WsGetMessageBO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String intent,  List<String> payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WsGetMessageBO() when $default != null:
return $default(_that.intent,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String intent,  List<String> payload)  $default,) {final _that = this;
switch (_that) {
case _WsGetMessageBO():
return $default(_that.intent,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String intent,  List<String> payload)?  $default,) {final _that = this;
switch (_that) {
case _WsGetMessageBO() when $default != null:
return $default(_that.intent,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WsGetMessageBO implements WsGetMessageBO {
  const _WsGetMessageBO({this.intent = 'get', required final  List<String> payload}): _payload = payload;
  factory _WsGetMessageBO.fromJson(Map<String, dynamic> json) => _$WsGetMessageBOFromJson(json);

@override@JsonKey() final  String intent;
 final  List<String> _payload;
@override List<String> get payload {
  if (_payload is EqualUnmodifiableListView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payload);
}


/// Create a copy of WsGetMessageBO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsGetMessageBOCopyWith<_WsGetMessageBO> get copyWith => __$WsGetMessageBOCopyWithImpl<_WsGetMessageBO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WsGetMessageBOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsGetMessageBO&&(identical(other.intent, intent) || other.intent == intent)&&const DeepCollectionEquality().equals(other._payload, _payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,intent,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'WsGetMessageBO(intent: $intent, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$WsGetMessageBOCopyWith<$Res> implements $WsGetMessageBOCopyWith<$Res> {
  factory _$WsGetMessageBOCopyWith(_WsGetMessageBO value, $Res Function(_WsGetMessageBO) _then) = __$WsGetMessageBOCopyWithImpl;
@override @useResult
$Res call({
 String intent, List<String> payload
});




}
/// @nodoc
class __$WsGetMessageBOCopyWithImpl<$Res>
    implements _$WsGetMessageBOCopyWith<$Res> {
  __$WsGetMessageBOCopyWithImpl(this._self, this._then);

  final _WsGetMessageBO _self;
  final $Res Function(_WsGetMessageBO) _then;

/// Create a copy of WsGetMessageBO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intent = null,Object? payload = null,}) {
  return _then(_WsGetMessageBO(
intent: null == intent ? _self.intent : intent // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
