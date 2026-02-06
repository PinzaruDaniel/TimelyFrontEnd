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
mixin _$HomeworkApiDto {

@JsonKey(name: 'id') String get homeworkId; String get subject; String get description; DateTime get dueDate; String? get imageUrl;
/// Create a copy of HomeworkApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeworkApiDtoCopyWith<HomeworkApiDto> get copyWith => _$HomeworkApiDtoCopyWithImpl<HomeworkApiDto>(this as HomeworkApiDto, _$identity);

  /// Serializes this HomeworkApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeworkApiDto&&(identical(other.homeworkId, homeworkId) || other.homeworkId == homeworkId)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,homeworkId,subject,description,dueDate,imageUrl);

@override
String toString() {
  return 'HomeworkApiDto(homeworkId: $homeworkId, subject: $subject, description: $description, dueDate: $dueDate, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $HomeworkApiDtoCopyWith<$Res>  {
  factory $HomeworkApiDtoCopyWith(HomeworkApiDto value, $Res Function(HomeworkApiDto) _then) = _$HomeworkApiDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String homeworkId, String subject, String description, DateTime dueDate, String? imageUrl
});




}
/// @nodoc
class _$HomeworkApiDtoCopyWithImpl<$Res>
    implements $HomeworkApiDtoCopyWith<$Res> {
  _$HomeworkApiDtoCopyWithImpl(this._self, this._then);

  final HomeworkApiDto _self;
  final $Res Function(HomeworkApiDto) _then;

/// Create a copy of HomeworkApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homeworkId = null,Object? subject = null,Object? description = null,Object? dueDate = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
homeworkId: null == homeworkId ? _self.homeworkId : homeworkId // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeworkApiDto].
extension HomeworkApiDtoPatterns on HomeworkApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeworkApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeworkApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeworkApiDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeworkApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeworkApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeworkApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String homeworkId,  String subject,  String description,  DateTime dueDate,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeworkApiDto() when $default != null:
return $default(_that.homeworkId,_that.subject,_that.description,_that.dueDate,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String homeworkId,  String subject,  String description,  DateTime dueDate,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _HomeworkApiDto():
return $default(_that.homeworkId,_that.subject,_that.description,_that.dueDate,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String homeworkId,  String subject,  String description,  DateTime dueDate,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _HomeworkApiDto() when $default != null:
return $default(_that.homeworkId,_that.subject,_that.description,_that.dueDate,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeworkApiDto implements HomeworkApiDto {
  const _HomeworkApiDto({@JsonKey(name: 'id') required this.homeworkId, required this.subject, required this.description, required this.dueDate, this.imageUrl});
  factory _HomeworkApiDto.fromJson(Map<String, dynamic> json) => _$HomeworkApiDtoFromJson(json);

@override@JsonKey(name: 'id') final  String homeworkId;
@override final  String subject;
@override final  String description;
@override final  DateTime dueDate;
@override final  String? imageUrl;

/// Create a copy of HomeworkApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeworkApiDtoCopyWith<_HomeworkApiDto> get copyWith => __$HomeworkApiDtoCopyWithImpl<_HomeworkApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeworkApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeworkApiDto&&(identical(other.homeworkId, homeworkId) || other.homeworkId == homeworkId)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,homeworkId,subject,description,dueDate,imageUrl);

@override
String toString() {
  return 'HomeworkApiDto(homeworkId: $homeworkId, subject: $subject, description: $description, dueDate: $dueDate, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$HomeworkApiDtoCopyWith<$Res> implements $HomeworkApiDtoCopyWith<$Res> {
  factory _$HomeworkApiDtoCopyWith(_HomeworkApiDto value, $Res Function(_HomeworkApiDto) _then) = __$HomeworkApiDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String homeworkId, String subject, String description, DateTime dueDate, String? imageUrl
});




}
/// @nodoc
class __$HomeworkApiDtoCopyWithImpl<$Res>
    implements _$HomeworkApiDtoCopyWith<$Res> {
  __$HomeworkApiDtoCopyWithImpl(this._self, this._then);

  final _HomeworkApiDto _self;
  final $Res Function(_HomeworkApiDto) _then;

/// Create a copy of HomeworkApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeworkId = null,Object? subject = null,Object? description = null,Object? dueDate = null,Object? imageUrl = freezed,}) {
  return _then(_HomeworkApiDto(
homeworkId: null == homeworkId ? _self.homeworkId : homeworkId // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
