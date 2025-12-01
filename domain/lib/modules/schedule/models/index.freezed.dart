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

 String get group; Uuid get groupId; Map<String, List<ScheduleItemEntity>>? get schedule;
/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleEntityCopyWith<ScheduleEntity> get copyWith => _$ScheduleEntityCopyWithImpl<ScheduleEntity>(this as ScheduleEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleEntity&&(identical(other.group, group) || other.group == group)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other.schedule, schedule));
}


@override
int get hashCode => Object.hash(runtimeType,group,groupId,const DeepCollectionEquality().hash(schedule));

@override
String toString() {
  return 'ScheduleEntity(group: $group, groupId: $groupId, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $ScheduleEntityCopyWith<$Res>  {
  factory $ScheduleEntityCopyWith(ScheduleEntity value, $Res Function(ScheduleEntity) _then) = _$ScheduleEntityCopyWithImpl;
@useResult
$Res call({
 String group, Uuid groupId, Map<String, List<ScheduleItemEntity>>? schedule
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
@pragma('vm:prefer-inline') @override $Res call({Object? group = null,Object? groupId = null,Object? schedule = freezed,}) {
  return _then(_self.copyWith(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as Uuid,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Map<String, List<ScheduleItemEntity>>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String group,  Uuid groupId,  Map<String, List<ScheduleItemEntity>>? schedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
return $default(_that.group,_that.groupId,_that.schedule);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String group,  Uuid groupId,  Map<String, List<ScheduleItemEntity>>? schedule)  $default,) {final _that = this;
switch (_that) {
case _ScheduleEntity():
return $default(_that.group,_that.groupId,_that.schedule);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String group,  Uuid groupId,  Map<String, List<ScheduleItemEntity>>? schedule)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleEntity() when $default != null:
return $default(_that.group,_that.groupId,_that.schedule);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleEntity implements ScheduleEntity {
  const _ScheduleEntity({required this.group, required this.groupId, final  Map<String, List<ScheduleItemEntity>>? schedule}): _schedule = schedule;
  

@override final  String group;
@override final  Uuid groupId;
 final  Map<String, List<ScheduleItemEntity>>? _schedule;
@override Map<String, List<ScheduleItemEntity>>? get schedule {
  final value = _schedule;
  if (value == null) return null;
  if (_schedule is EqualUnmodifiableMapView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ScheduleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleEntityCopyWith<_ScheduleEntity> get copyWith => __$ScheduleEntityCopyWithImpl<_ScheduleEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleEntity&&(identical(other.group, group) || other.group == group)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other._schedule, _schedule));
}


@override
int get hashCode => Object.hash(runtimeType,group,groupId,const DeepCollectionEquality().hash(_schedule));

@override
String toString() {
  return 'ScheduleEntity(group: $group, groupId: $groupId, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$ScheduleEntityCopyWith<$Res> implements $ScheduleEntityCopyWith<$Res> {
  factory _$ScheduleEntityCopyWith(_ScheduleEntity value, $Res Function(_ScheduleEntity) _then) = __$ScheduleEntityCopyWithImpl;
@override @useResult
$Res call({
 String group, Uuid groupId, Map<String, List<ScheduleItemEntity>>? schedule
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
@override @pragma('vm:prefer-inline') $Res call({Object? group = null,Object? groupId = null,Object? schedule = freezed,}) {
  return _then(_ScheduleEntity(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as Uuid,schedule: freezed == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as Map<String, List<ScheduleItemEntity>>?,
  ));
}


}


/// @nodoc
mixin _$ScheduleItemEntity {

 String get time; String get subject; String get teacher; String get room; String get period;
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
 String time, String subject, String teacher, String room, String period
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
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? subject = null,Object? teacher = null,Object? room = null,Object? period = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  String subject,  String teacher,  String room,  String period)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  String subject,  String teacher,  String room,  String period)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  String subject,  String teacher,  String room,  String period)?  $default,) {final _that = this;
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
  const _ScheduleItemEntity({required this.time, required this.subject, required this.teacher, required this.room, required this.period});
  factory _ScheduleItemEntity.fromJson(Map<String, dynamic> json) => _$ScheduleItemEntityFromJson(json);

@override final  String time;
@override final  String subject;
@override final  String teacher;
@override final  String room;
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
 String time, String subject, String teacher, String room, String period
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
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? subject = null,Object? teacher = null,Object? room = null,Object? period = null,}) {
  return _then(_ScheduleItemEntity(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,teacher: null == teacher ? _self.teacher : teacher // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
