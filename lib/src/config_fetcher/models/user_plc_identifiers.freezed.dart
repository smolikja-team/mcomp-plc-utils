// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_plc_identifiers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPlcIdentifiers {

/// User ID who owns these identifiers.
 String get userId;/// List of PLC identifiers the user has access to.
 List<String> get identifiers;/// Timestamp when the identifiers were cached.
 DateTime get cachedAt;
/// Create a copy of UserPlcIdentifiers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPlcIdentifiersCopyWith<UserPlcIdentifiers> get copyWith => _$UserPlcIdentifiersCopyWithImpl<UserPlcIdentifiers>(this as UserPlcIdentifiers, _$identity);

  /// Serializes this UserPlcIdentifiers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPlcIdentifiers&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.identifiers, identifiers)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(identifiers),cachedAt);

@override
String toString() {
  return 'UserPlcIdentifiers(userId: $userId, identifiers: $identifiers, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class $UserPlcIdentifiersCopyWith<$Res>  {
  factory $UserPlcIdentifiersCopyWith(UserPlcIdentifiers value, $Res Function(UserPlcIdentifiers) _then) = _$UserPlcIdentifiersCopyWithImpl;
@useResult
$Res call({
 String userId, List<String> identifiers, DateTime cachedAt
});




}
/// @nodoc
class _$UserPlcIdentifiersCopyWithImpl<$Res>
    implements $UserPlcIdentifiersCopyWith<$Res> {
  _$UserPlcIdentifiersCopyWithImpl(this._self, this._then);

  final UserPlcIdentifiers _self;
  final $Res Function(UserPlcIdentifiers) _then;

/// Create a copy of UserPlcIdentifiers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? identifiers = null,Object? cachedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,identifiers: null == identifiers ? _self.identifiers : identifiers // ignore: cast_nullable_to_non_nullable
as List<String>,cachedAt: null == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPlcIdentifiers].
extension UserPlcIdentifiersPatterns on UserPlcIdentifiers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPlcIdentifiers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPlcIdentifiers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPlcIdentifiers value)  $default,){
final _that = this;
switch (_that) {
case _UserPlcIdentifiers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPlcIdentifiers value)?  $default,){
final _that = this;
switch (_that) {
case _UserPlcIdentifiers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  List<String> identifiers,  DateTime cachedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPlcIdentifiers() when $default != null:
return $default(_that.userId,_that.identifiers,_that.cachedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  List<String> identifiers,  DateTime cachedAt)  $default,) {final _that = this;
switch (_that) {
case _UserPlcIdentifiers():
return $default(_that.userId,_that.identifiers,_that.cachedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  List<String> identifiers,  DateTime cachedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserPlcIdentifiers() when $default != null:
return $default(_that.userId,_that.identifiers,_that.cachedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPlcIdentifiers implements UserPlcIdentifiers {
  const _UserPlcIdentifiers({required this.userId, required final  List<String> identifiers, required this.cachedAt}): _identifiers = identifiers;
  factory _UserPlcIdentifiers.fromJson(Map<String, dynamic> json) => _$UserPlcIdentifiersFromJson(json);

/// User ID who owns these identifiers.
@override final  String userId;
/// List of PLC identifiers the user has access to.
 final  List<String> _identifiers;
/// List of PLC identifiers the user has access to.
@override List<String> get identifiers {
  if (_identifiers is EqualUnmodifiableListView) return _identifiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_identifiers);
}

/// Timestamp when the identifiers were cached.
@override final  DateTime cachedAt;

/// Create a copy of UserPlcIdentifiers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPlcIdentifiersCopyWith<_UserPlcIdentifiers> get copyWith => __$UserPlcIdentifiersCopyWithImpl<_UserPlcIdentifiers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPlcIdentifiersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPlcIdentifiers&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._identifiers, _identifiers)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(_identifiers),cachedAt);

@override
String toString() {
  return 'UserPlcIdentifiers(userId: $userId, identifiers: $identifiers, cachedAt: $cachedAt)';
}


}

/// @nodoc
abstract mixin class _$UserPlcIdentifiersCopyWith<$Res> implements $UserPlcIdentifiersCopyWith<$Res> {
  factory _$UserPlcIdentifiersCopyWith(_UserPlcIdentifiers value, $Res Function(_UserPlcIdentifiers) _then) = __$UserPlcIdentifiersCopyWithImpl;
@override @useResult
$Res call({
 String userId, List<String> identifiers, DateTime cachedAt
});




}
/// @nodoc
class __$UserPlcIdentifiersCopyWithImpl<$Res>
    implements _$UserPlcIdentifiersCopyWith<$Res> {
  __$UserPlcIdentifiersCopyWithImpl(this._self, this._then);

  final _UserPlcIdentifiers _self;
  final $Res Function(_UserPlcIdentifiers) _then;

/// Create a copy of UserPlcIdentifiers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? identifiers = null,Object? cachedAt = null,}) {
  return _then(_UserPlcIdentifiers(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,identifiers: null == identifiers ? _self._identifiers : identifiers // ignore: cast_nullable_to_non_nullable
as List<String>,cachedAt: null == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
