// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plc_addresses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlcAddresses {

 String? get localAddress; String get publicAddress;
/// Create a copy of PlcAddresses
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlcAddressesCopyWith<PlcAddresses> get copyWith => _$PlcAddressesCopyWithImpl<PlcAddresses>(this as PlcAddresses, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlcAddresses&&(identical(other.localAddress, localAddress) || other.localAddress == localAddress)&&(identical(other.publicAddress, publicAddress) || other.publicAddress == publicAddress));
}


@override
int get hashCode => Object.hash(runtimeType,localAddress,publicAddress);

@override
String toString() {
  return 'PlcAddresses(localAddress: $localAddress, publicAddress: $publicAddress)';
}


}

/// @nodoc
abstract mixin class $PlcAddressesCopyWith<$Res>  {
  factory $PlcAddressesCopyWith(PlcAddresses value, $Res Function(PlcAddresses) _then) = _$PlcAddressesCopyWithImpl;
@useResult
$Res call({
 String? localAddress, String publicAddress
});




}
/// @nodoc
class _$PlcAddressesCopyWithImpl<$Res>
    implements $PlcAddressesCopyWith<$Res> {
  _$PlcAddressesCopyWithImpl(this._self, this._then);

  final PlcAddresses _self;
  final $Res Function(PlcAddresses) _then;

/// Create a copy of PlcAddresses
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localAddress = freezed,Object? publicAddress = null,}) {
  return _then(_self.copyWith(
localAddress: freezed == localAddress ? _self.localAddress : localAddress // ignore: cast_nullable_to_non_nullable
as String?,publicAddress: null == publicAddress ? _self.publicAddress : publicAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlcAddresses].
extension PlcAddressesPatterns on PlcAddresses {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlcAddresses value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlcAddresses() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlcAddresses value)  $default,){
final _that = this;
switch (_that) {
case _PlcAddresses():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlcAddresses value)?  $default,){
final _that = this;
switch (_that) {
case _PlcAddresses() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? localAddress,  String publicAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlcAddresses() when $default != null:
return $default(_that.localAddress,_that.publicAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? localAddress,  String publicAddress)  $default,) {final _that = this;
switch (_that) {
case _PlcAddresses():
return $default(_that.localAddress,_that.publicAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? localAddress,  String publicAddress)?  $default,) {final _that = this;
switch (_that) {
case _PlcAddresses() when $default != null:
return $default(_that.localAddress,_that.publicAddress);case _:
  return null;

}
}

}

/// @nodoc


class _PlcAddresses implements PlcAddresses {
  const _PlcAddresses({this.localAddress, required this.publicAddress});
  

@override final  String? localAddress;
@override final  String publicAddress;

/// Create a copy of PlcAddresses
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlcAddressesCopyWith<_PlcAddresses> get copyWith => __$PlcAddressesCopyWithImpl<_PlcAddresses>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlcAddresses&&(identical(other.localAddress, localAddress) || other.localAddress == localAddress)&&(identical(other.publicAddress, publicAddress) || other.publicAddress == publicAddress));
}


@override
int get hashCode => Object.hash(runtimeType,localAddress,publicAddress);

@override
String toString() {
  return 'PlcAddresses(localAddress: $localAddress, publicAddress: $publicAddress)';
}


}

/// @nodoc
abstract mixin class _$PlcAddressesCopyWith<$Res> implements $PlcAddressesCopyWith<$Res> {
  factory _$PlcAddressesCopyWith(_PlcAddresses value, $Res Function(_PlcAddresses) _then) = __$PlcAddressesCopyWithImpl;
@override @useResult
$Res call({
 String? localAddress, String publicAddress
});




}
/// @nodoc
class __$PlcAddressesCopyWithImpl<$Res>
    implements _$PlcAddressesCopyWith<$Res> {
  __$PlcAddressesCopyWithImpl(this._self, this._then);

  final _PlcAddresses _self;
  final $Res Function(_PlcAddresses) _then;

/// Create a copy of PlcAddresses
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localAddress = freezed,Object? publicAddress = null,}) {
  return _then(_PlcAddresses(
localAddress: freezed == localAddress ? _self.localAddress : localAddress // ignore: cast_nullable_to_non_nullable
as String?,publicAddress: null == publicAddress ? _self.publicAddress : publicAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
