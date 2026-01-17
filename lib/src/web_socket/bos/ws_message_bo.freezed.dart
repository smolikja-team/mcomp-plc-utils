// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_message_bo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WsMessageBO {

@JsonKey(name: 'list') List<WsMessageItemBO>? get items;@JsonKey(name: 'diff') List<WsMessageItemBO>? get differences;@JsonKey(name: 'get') List<WsMessageItemBO>? get requestedItems;
/// Create a copy of WsMessageBO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsMessageBOCopyWith<WsMessageBO> get copyWith => _$WsMessageBOCopyWithImpl<WsMessageBO>(this as WsMessageBO, _$identity);

  /// Serializes this WsMessageBO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsMessageBO&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.differences, differences)&&const DeepCollectionEquality().equals(other.requestedItems, requestedItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(differences),const DeepCollectionEquality().hash(requestedItems));

@override
String toString() {
  return 'WsMessageBO(items: $items, differences: $differences, requestedItems: $requestedItems)';
}


}

/// @nodoc
abstract mixin class $WsMessageBOCopyWith<$Res>  {
  factory $WsMessageBOCopyWith(WsMessageBO value, $Res Function(WsMessageBO) _then) = _$WsMessageBOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'list') List<WsMessageItemBO>? items,@JsonKey(name: 'diff') List<WsMessageItemBO>? differences,@JsonKey(name: 'get') List<WsMessageItemBO>? requestedItems
});




}
/// @nodoc
class _$WsMessageBOCopyWithImpl<$Res>
    implements $WsMessageBOCopyWith<$Res> {
  _$WsMessageBOCopyWithImpl(this._self, this._then);

  final WsMessageBO _self;
  final $Res Function(WsMessageBO) _then;

/// Create a copy of WsMessageBO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = freezed,Object? differences = freezed,Object? requestedItems = freezed,}) {
  return _then(_self.copyWith(
items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<WsMessageItemBO>?,differences: freezed == differences ? _self.differences : differences // ignore: cast_nullable_to_non_nullable
as List<WsMessageItemBO>?,requestedItems: freezed == requestedItems ? _self.requestedItems : requestedItems // ignore: cast_nullable_to_non_nullable
as List<WsMessageItemBO>?,
  ));
}

}


/// Adds pattern-matching-related methods to [WsMessageBO].
extension WsMessageBOPatterns on WsMessageBO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WsMessageBO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WsMessageBO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WsMessageBO value)  $default,){
final _that = this;
switch (_that) {
case _WsMessageBO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WsMessageBO value)?  $default,){
final _that = this;
switch (_that) {
case _WsMessageBO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'list')  List<WsMessageItemBO>? items, @JsonKey(name: 'diff')  List<WsMessageItemBO>? differences, @JsonKey(name: 'get')  List<WsMessageItemBO>? requestedItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WsMessageBO() when $default != null:
return $default(_that.items,_that.differences,_that.requestedItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'list')  List<WsMessageItemBO>? items, @JsonKey(name: 'diff')  List<WsMessageItemBO>? differences, @JsonKey(name: 'get')  List<WsMessageItemBO>? requestedItems)  $default,) {final _that = this;
switch (_that) {
case _WsMessageBO():
return $default(_that.items,_that.differences,_that.requestedItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'list')  List<WsMessageItemBO>? items, @JsonKey(name: 'diff')  List<WsMessageItemBO>? differences, @JsonKey(name: 'get')  List<WsMessageItemBO>? requestedItems)?  $default,) {final _that = this;
switch (_that) {
case _WsMessageBO() when $default != null:
return $default(_that.items,_that.differences,_that.requestedItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WsMessageBO implements WsMessageBO {
  const _WsMessageBO({@JsonKey(name: 'list') final  List<WsMessageItemBO>? items, @JsonKey(name: 'diff') final  List<WsMessageItemBO>? differences, @JsonKey(name: 'get') final  List<WsMessageItemBO>? requestedItems}): _items = items,_differences = differences,_requestedItems = requestedItems;
  factory _WsMessageBO.fromJson(Map<String, dynamic> json) => _$WsMessageBOFromJson(json);

 final  List<WsMessageItemBO>? _items;
@override@JsonKey(name: 'list') List<WsMessageItemBO>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<WsMessageItemBO>? _differences;
@override@JsonKey(name: 'diff') List<WsMessageItemBO>? get differences {
  final value = _differences;
  if (value == null) return null;
  if (_differences is EqualUnmodifiableListView) return _differences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<WsMessageItemBO>? _requestedItems;
@override@JsonKey(name: 'get') List<WsMessageItemBO>? get requestedItems {
  final value = _requestedItems;
  if (value == null) return null;
  if (_requestedItems is EqualUnmodifiableListView) return _requestedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WsMessageBO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsMessageBOCopyWith<_WsMessageBO> get copyWith => __$WsMessageBOCopyWithImpl<_WsMessageBO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WsMessageBOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsMessageBO&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._differences, _differences)&&const DeepCollectionEquality().equals(other._requestedItems, _requestedItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_differences),const DeepCollectionEquality().hash(_requestedItems));

@override
String toString() {
  return 'WsMessageBO(items: $items, differences: $differences, requestedItems: $requestedItems)';
}


}

/// @nodoc
abstract mixin class _$WsMessageBOCopyWith<$Res> implements $WsMessageBOCopyWith<$Res> {
  factory _$WsMessageBOCopyWith(_WsMessageBO value, $Res Function(_WsMessageBO) _then) = __$WsMessageBOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'list') List<WsMessageItemBO>? items,@JsonKey(name: 'diff') List<WsMessageItemBO>? differences,@JsonKey(name: 'get') List<WsMessageItemBO>? requestedItems
});




}
/// @nodoc
class __$WsMessageBOCopyWithImpl<$Res>
    implements _$WsMessageBOCopyWith<$Res> {
  __$WsMessageBOCopyWithImpl(this._self, this._then);

  final _WsMessageBO _self;
  final $Res Function(_WsMessageBO) _then;

/// Create a copy of WsMessageBO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,Object? differences = freezed,Object? requestedItems = freezed,}) {
  return _then(_WsMessageBO(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<WsMessageItemBO>?,differences: freezed == differences ? _self._differences : differences // ignore: cast_nullable_to_non_nullable
as List<WsMessageItemBO>?,requestedItems: freezed == requestedItems ? _self._requestedItems : requestedItems // ignore: cast_nullable_to_non_nullable
as List<WsMessageItemBO>?,
  ));
}


}

// dart format on
