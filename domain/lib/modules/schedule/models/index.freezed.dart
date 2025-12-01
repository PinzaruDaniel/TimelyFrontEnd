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
mixin _$ScheduleEntity {

 String get group; String get groupId; List<ScheduleItemEntity> get monday; List<ScheduleItemEntity> get tuesday; List<ScheduleItemEntity> get wednesday; List<ScheduleItemEntity> get thursday; List<ScheduleItemEntity> get friday;
/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleEntityCopyWith<ScheduleEntity> get copyWith => _$ScheduleEntityCopyWithImpl<ScheduleEntity>(this as ScheduleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleEntity&&(identical(other.group, group) || other.group == group)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other.monday, monday)&&const DeepCollectionEquality().equals(other.tuesday, tuesday)&&const DeepCollectionEquality().equals(other.wednesday, wednesday)&&const DeepCollectionEquality().equals(other.thursday, thursday)&&const DeepCollectionEquality().equals(other.friday, friday));
}


@override
int get hashCode => Object.hash(runtimeType,group,groupId,const DeepCollectionEquality().hash(monday),const DeepCollectionEquality().hash(tuesday),const DeepCollectionEquality().hash(wednesday),const DeepCollectionEquality().hash(thursday),const DeepCollectionEquality().hash(friday));

@override
String toString() {
  return 'ScheduleEntity(group: $group, groupId: $groupId, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday)';
}


}

/// @nodoc
abstract mixin class $ScheduleEntityCopyWith<$Res>  {
  factory $ScheduleEntityCopyWith(ScheduleEntity value, $Res Function(ScheduleEntity) _then) = _$ScheduleEntityCopyWithImpl;
@useResult
$Res call({
 String group, String groupId, List<ScheduleItemEntity> monday, List<ScheduleItemEntity> tuesday, List<ScheduleItemEntity> wednesday, List<ScheduleItemEntity> thursday, List<ScheduleItemEntity> friday
});




}
/// @nodoc
class _$ScheduleEntityCopyWithImpl<$Res>
    implements $ScheduleEntityCopyWith<$Res> {
  _$ScheduleEntityCopyWithImpl(this._self, this._then);

  final ScheduleEntity _self;
  final $Res Function(ScheduleEntity) _then;

/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? group = null,Object? groupId = null,Object? monday = null,Object? tuesday = null,Object? wednesday = null,Object? thursday = null,Object? friday = null,}) {
  return _then(_self.copyWith(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,monday: null == monday ? _self.monday : monday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,tuesday: null == tuesday ? _self.tuesday : tuesday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,wednesday: null == wednesday ? _self.wednesday : wednesday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,thursday: null == thursday ? _self.thursday : thursday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,friday: null == friday ? _self.friday : friday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleEntity].
extension ScheduleEntityPatterns on ScheduleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleEntity value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String group,  String groupId,  List<ScheduleItemEntity> monday,  List<ScheduleItemEntity> tuesday,  List<ScheduleItemEntity> wednesday,  List<ScheduleItemEntity> thursday,  List<ScheduleItemEntity> friday)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
return $default(_that.group,_that.groupId,_that.monday,_that.tuesday,_that.wednesday,_that.thursday,_that.friday);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String group,  String groupId,  List<ScheduleItemEntity> monday,  List<ScheduleItemEntity> tuesday,  List<ScheduleItemEntity> wednesday,  List<ScheduleItemEntity> thursday,  List<ScheduleItemEntity> friday)  $default,) {final _that = this;
switch (_that) {
case _ScheduleEntity():
return $default(_that.group,_that.groupId,_that.monday,_that.tuesday,_that.wednesday,_that.thursday,_that.friday);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String group,  String groupId,  List<ScheduleItemEntity> monday,  List<ScheduleItemEntity> tuesday,  List<ScheduleItemEntity> wednesday,  List<ScheduleItemEntity> thursday,  List<ScheduleItemEntity> friday)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
return $default(_that.group,_that.groupId,_that.monday,_that.tuesday,_that.wednesday,_that.thursday,_that.friday);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleEntity implements ScheduleEntity {
  const _ScheduleEntity({required this.group, required this.groupId, required final  List<ScheduleItemEntity> monday, required final  List<ScheduleItemEntity> tuesday, required final  List<ScheduleItemEntity> wednesday, required final  List<ScheduleItemEntity> thursday, required final  List<ScheduleItemEntity> friday}): _monday = monday,_tuesday = tuesday,_wednesday = wednesday,_thursday = thursday,_friday = friday;
  

@override final  String group;
@override final  String groupId;
 final  List<ScheduleItemEntity> _monday;
@override List<ScheduleItemEntity> get monday {
  if (_monday is EqualUnmodifiableListView) return _monday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_monday);
}

 final  List<ScheduleItemEntity> _tuesday;
@override List<ScheduleItemEntity> get tuesday {
  if (_tuesday is EqualUnmodifiableListView) return _tuesday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tuesday);
}

 final  List<ScheduleItemEntity> _wednesday;
@override List<ScheduleItemEntity> get wednesday {
  if (_wednesday is EqualUnmodifiableListView) return _wednesday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wednesday);
}

 final  List<ScheduleItemEntity> _thursday;
@override List<ScheduleItemEntity> get thursday {
  if (_thursday is EqualUnmodifiableListView) return _thursday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_thursday);
}

 final  List<ScheduleItemEntity> _friday;
@override List<ScheduleItemEntity> get friday {
  if (_friday is EqualUnmodifiableListView) return _friday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_friday);
}


/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleEntityCopyWith<_ScheduleEntity> get copyWith => __$ScheduleEntityCopyWithImpl<_ScheduleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleEntity&&(identical(other.group, group) || other.group == group)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other._monday, _monday)&&const DeepCollectionEquality().equals(other._tuesday, _tuesday)&&const DeepCollectionEquality().equals(other._wednesday, _wednesday)&&const DeepCollectionEquality().equals(other._thursday, _thursday)&&const DeepCollectionEquality().equals(other._friday, _friday));
}


@override
int get hashCode => Object.hash(runtimeType,group,groupId,const DeepCollectionEquality().hash(_monday),const DeepCollectionEquality().hash(_tuesday),const DeepCollectionEquality().hash(_wednesday),const DeepCollectionEquality().hash(_thursday),const DeepCollectionEquality().hash(_friday));

@override
String toString() {
  return 'ScheduleEntity(group: $group, groupId: $groupId, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday)';
}


}

/// @nodoc
abstract mixin class _$ScheduleEntityCopyWith<$Res> implements $ScheduleEntityCopyWith<$Res> {
  factory _$ScheduleEntityCopyWith(_ScheduleEntity value, $Res Function(_ScheduleEntity) _then) = __$ScheduleEntityCopyWithImpl;
@override @useResult
$Res call({
 String group, String groupId, List<ScheduleItemEntity> monday, List<ScheduleItemEntity> tuesday, List<ScheduleItemEntity> wednesday, List<ScheduleItemEntity> thursday, List<ScheduleItemEntity> friday
});




}
/// @nodoc
class __$ScheduleEntityCopyWithImpl<$Res>
    implements _$ScheduleEntityCopyWith<$Res> {
  __$ScheduleEntityCopyWithImpl(this._self, this._then);

  final _ScheduleEntity _self;
  final $Res Function(_ScheduleEntity) _then;

/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? group = null,Object? groupId = null,Object? monday = null,Object? tuesday = null,Object? wednesday = null,Object? thursday = null,Object? friday = null,}) {
  return _then(_ScheduleEntity(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String,monday: null == monday ? _self._monday : monday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,tuesday: null == tuesday ? _self._tuesday : tuesday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,wednesday: null == wednesday ? _self._wednesday : wednesday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,thursday: null == thursday ? _self._thursday : thursday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,friday: null == friday ? _self._friday : friday // ignore: cast_nullable_to_non_nullable
as List<ScheduleItemEntity>,
  ));
}


}


/// @nodoc
mixin _$ScheduleItemEntity {

 String get time; String get subject; String? get teacher; String? get room; String get period;
/// Create a copy of ScheduleItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleItemEntityCopyWith<ScheduleItemEntity> get copyWith => _$ScheduleItemEntityCopyWithImpl<ScheduleItemEntity>(this as ScheduleItemEntity, _$identity);

  /// Serializes this ScheduleItemEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleItemEntity&&(identical(other.time, time) || other.time == time)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.room, room) || other.room == room)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,subject,teacher,room,period);

@override
String toString() {
  return 'ScheduleItemEntity(time: $time, subject: $subject, teacher: $teacher, room: $room, period: $period)';
}


}

/// @nodoc
abstract mixin class $ScheduleItemEntityCopyWith<$Res>  {
  factory $ScheduleItemEntityCopyWith(ScheduleItemEntity value, $Res Function(ScheduleItemEntity) _then) = _$ScheduleItemEntityCopyWithImpl;
@useResult
$Res call({
 String time, String subject, String? teacher, String? room, String period
});




}
/// @nodoc
class _$ScheduleItemEntityCopyWithImpl<$Res>
    implements $ScheduleItemEntityCopyWith<$Res> {
  _$ScheduleItemEntityCopyWithImpl(this._self, this._then);

  final ScheduleItemEntity _self;
  final $Res Function(ScheduleItemEntity) _then;

/// Create a copy of ScheduleItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? subject = null,Object? teacher = freezed,Object? room = freezed,Object? period = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,teacher: freezed == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String?,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleItemEntity].
extension ScheduleItemEntityPatterns on ScheduleItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  String subject,  String? teacher,  String? room,  String period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleItemEntity() when $default != null:
return $default(_that.time,_that.subject,_that.teacher,_that.room,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  String subject,  String? teacher,  String? room,  String period)  $default,) {final _that = this;
switch (_that) {
case _ScheduleItemEntity():
return $default(_that.time,_that.subject,_that.teacher,_that.room,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  String subject,  String? teacher,  String? room,  String period)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleItemEntity() when $default != null:
return $default(_that.time,_that.subject,_that.teacher,_that.room,_that.period);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleItemEntity implements ScheduleItemEntity {
  const _ScheduleItemEntity({required this.time, required this.subject, this.teacher, this.room, required this.period});
  factory _ScheduleItemEntity.fromJson(Map<String, dynamic> json) => _$ScheduleItemEntityFromJson(json);

@override final  String time;
@override final  String subject;
@override final  String? teacher;
@override final  String? room;
@override final  String period;

/// Create a copy of ScheduleItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleItemEntityCopyWith<_ScheduleItemEntity> get copyWith => __$ScheduleItemEntityCopyWithImpl<_ScheduleItemEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleItemEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleItemEntity&&(identical(other.time, time) || other.time == time)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.room, room) || other.room == room)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,subject,teacher,room,period);

@override
String toString() {
  return 'ScheduleItemEntity(time: $time, subject: $subject, teacher: $teacher, room: $room, period: $period)';
}


}

/// @nodoc
abstract mixin class _$ScheduleItemEntityCopyWith<$Res> implements $ScheduleItemEntityCopyWith<$Res> {
  factory _$ScheduleItemEntityCopyWith(_ScheduleItemEntity value, $Res Function(_ScheduleItemEntity) _then) = __$ScheduleItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String time, String subject, String? teacher, String? room, String period
});




}
/// @nodoc
class __$ScheduleItemEntityCopyWithImpl<$Res>
    implements _$ScheduleItemEntityCopyWith<$Res> {
  __$ScheduleItemEntityCopyWithImpl(this._self, this._then);

  final _ScheduleItemEntity _self;
  final $Res Function(_ScheduleItemEntity) _then;

/// Create a copy of ScheduleItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? subject = null,Object? teacher = freezed,Object? room = freezed,Object? period = null,}) {
  return _then(_ScheduleItemEntity(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,teacher: freezed == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String?,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
