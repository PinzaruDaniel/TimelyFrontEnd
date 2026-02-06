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
mixin _$HomeworkEntity {

 String get homeworkId; String get subject; String get description; DateTime get dueDate; String? get imageUrl;
/// Create a copy of HomeworkEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeworkEntityCopyWith<HomeworkEntity> get copyWith => _$HomeworkEntityCopyWithImpl<HomeworkEntity>(this as HomeworkEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeworkEntity&&(identical(other.homeworkId, homeworkId) || other.homeworkId == homeworkId)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,homeworkId,subject,description,dueDate,imageUrl);

@override
String toString() {
  return 'HomeworkEntity(homeworkId: $homeworkId, subject: $subject, description: $description, dueDate: $dueDate, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $HomeworkEntityCopyWith<$Res>  {
  factory $HomeworkEntityCopyWith(HomeworkEntity value, $Res Function(HomeworkEntity) _then) = _$HomeworkEntityCopyWithImpl;
@useResult
$Res call({
 String homeworkId, String subject, String description, DateTime dueDate, String? imageUrl
});




}
/// @nodoc
class _$HomeworkEntityCopyWithImpl<$Res>
    implements $HomeworkEntityCopyWith<$Res> {
  _$HomeworkEntityCopyWithImpl(this._self, this._then);

  final HomeworkEntity _self;
  final $Res Function(HomeworkEntity) _then;

/// Create a copy of HomeworkEntity
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


/// Adds pattern-matching-related methods to [HomeworkEntity].
extension HomeworkEntityPatterns on HomeworkEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeworkEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeworkEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeworkEntity value)  $default,){
final _that = this;
switch (_that) {
case _HomeworkEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeworkEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HomeworkEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String homeworkId,  String subject,  String description,  DateTime dueDate,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeworkEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String homeworkId,  String subject,  String description,  DateTime dueDate,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _HomeworkEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String homeworkId,  String subject,  String description,  DateTime dueDate,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _HomeworkEntity() when $default != null:
return $default(_that.homeworkId,_that.subject,_that.description,_that.dueDate,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _HomeworkEntity implements HomeworkEntity {
  const _HomeworkEntity({required this.homeworkId, required this.subject, required this.description, required this.dueDate, this.imageUrl});
  

@override final  String homeworkId;
@override final  String subject;
@override final  String description;
@override final  DateTime dueDate;
@override final  String? imageUrl;

/// Create a copy of HomeworkEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeworkEntityCopyWith<_HomeworkEntity> get copyWith => __$HomeworkEntityCopyWithImpl<_HomeworkEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeworkEntity&&(identical(other.homeworkId, homeworkId) || other.homeworkId == homeworkId)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,homeworkId,subject,description,dueDate,imageUrl);

@override
String toString() {
  return 'HomeworkEntity(homeworkId: $homeworkId, subject: $subject, description: $description, dueDate: $dueDate, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$HomeworkEntityCopyWith<$Res> implements $HomeworkEntityCopyWith<$Res> {
  factory _$HomeworkEntityCopyWith(_HomeworkEntity value, $Res Function(_HomeworkEntity) _then) = __$HomeworkEntityCopyWithImpl;
@override @useResult
$Res call({
 String homeworkId, String subject, String description, DateTime dueDate, String? imageUrl
});




}
/// @nodoc
class __$HomeworkEntityCopyWithImpl<$Res>
    implements _$HomeworkEntityCopyWith<$Res> {
  __$HomeworkEntityCopyWithImpl(this._self, this._then);

  final _HomeworkEntity _self;
  final $Res Function(_HomeworkEntity) _then;

/// Create a copy of HomeworkEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeworkId = null,Object? subject = null,Object? description = null,Object? dueDate = null,Object? imageUrl = freezed,}) {
  return _then(_HomeworkEntity(
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
