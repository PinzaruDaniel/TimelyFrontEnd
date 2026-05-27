// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileApiDto {

 String get id; String get fullName; String get email; String get groupId; String get groupName;
/// Create a copy of UserProfileApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileApiDtoCopyWith<UserProfileApiDto> get copyWith => _$UserProfileApiDtoCopyWithImpl<UserProfileApiDto>(this as UserProfileApiDto, _$identity);

  /// Serializes this UserProfileApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,groupId,groupName);

@override
String toString() {
  return 'UserProfileApiDto(id: $id, fullName: $fullName, email: $email, groupId: $groupId, groupName: $groupName)';
}


}

/// @nodoc
abstract mixin class $UserProfileApiDtoCopyWith<$Res>  {
  factory $UserProfileApiDtoCopyWith(UserProfileApiDto value, $Res Function(UserProfileApiDto) _then) = _$UserProfileApiDtoCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String email, String groupId, String groupName
});




}
/// @nodoc
class _$UserProfileApiDtoCopyWithImpl<$Res>
    implements $UserProfileApiDtoCopyWith<$Res> {
  _$UserProfileApiDtoCopyWithImpl(this._self, this._then);

  final UserProfileApiDto _self;
  final $Res Function(UserProfileApiDto) _then;

/// Create a copy of UserProfileApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? groupId = null,Object? groupName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileApiDto].
extension UserProfileApiDtoPatterns on UserProfileApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileApiDto value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String email,  String groupId,  String groupName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileApiDto() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.groupId,_that.groupName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String email,  String groupId,  String groupName)  $default,) {final _that = this;
switch (_that) {
case _UserProfileApiDto():
return $default(_that.id,_that.fullName,_that.email,_that.groupId,_that.groupName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String email,  String groupId,  String groupName)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileApiDto() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.groupId,_that.groupName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileApiDto implements UserProfileApiDto {
   _UserProfileApiDto({required this.id, required this.fullName, required this.email, required this.groupId, required this.groupName});
  factory _UserProfileApiDto.fromJson(Map<String, dynamic> json) => _$UserProfileApiDtoFromJson(json);

@override final  String id;
@override final  String fullName;
@override final  String email;
@override final  String groupId;
@override final  String groupName;

/// Create a copy of UserProfileApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileApiDtoCopyWith<_UserProfileApiDto> get copyWith => __$UserProfileApiDtoCopyWithImpl<_UserProfileApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileApiDto&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.groupName, groupName) || other.groupName == groupName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,groupId,groupName);

@override
String toString() {
  return 'UserProfileApiDto(id: $id, fullName: $fullName, email: $email, groupId: $groupId, groupName: $groupName)';
}


}

/// @nodoc
abstract mixin class _$UserProfileApiDtoCopyWith<$Res> implements $UserProfileApiDtoCopyWith<$Res> {
  factory _$UserProfileApiDtoCopyWith(_UserProfileApiDto value, $Res Function(_UserProfileApiDto) _then) = __$UserProfileApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String email, String groupId, String groupName
});




}
/// @nodoc
class __$UserProfileApiDtoCopyWithImpl<$Res>
    implements _$UserProfileApiDtoCopyWith<$Res> {
  __$UserProfileApiDtoCopyWithImpl(this._self, this._then);

  final _UserProfileApiDto _self;
  final $Res Function(_UserProfileApiDto) _then;

/// Create a copy of UserProfileApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? email = null,Object? groupId = null,Object? groupName = null,}) {
  return _then(_UserProfileApiDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
