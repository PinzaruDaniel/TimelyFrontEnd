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
mixin _$ScheduleApiDto {

 String get group; Uuid get groupId; Map<String, List<ScheduleItemDto>>? get schedule;
/// Create a copy of ScheduleApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleApiDtoCopyWith<ScheduleApiDto> get copyWith => _$ScheduleApiDtoCopyWithImpl<ScheduleApiDto>(this as ScheduleApiDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleApiDto&&(identical(other.group, group) || other.group == group)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other.schedule, schedule));
}


@override
int get hashCode => Object.hash(runtimeType,group,groupId,const DeepCollectionEquality().hash(schedule));

@override
String toString() {
  return 'ScheduleApiDto(group: $group, groupId: $groupId, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class $ScheduleApiDtoCopyWith<$Res>  {
  factory $ScheduleApiDtoCopyWith(ScheduleApiDto value, $Res Function(ScheduleApiDto) _then) = _$ScheduleApiDtoCopyWithImpl;
@useResult
$Res call({
 String group, Uuid groupId, Map<String, List<ScheduleItemDto>>? schedule
});




}
/// @nodoc
class _$ScheduleApiDtoCopyWithImpl<$Res>
    implements $ScheduleApiDtoCopyWith<$Res> {
  _$ScheduleApiDtoCopyWithImpl(this._self, this._then);

  final ScheduleApiDto _self;
  final $Res Function(ScheduleApiDto) _then;

/// Create a copy of ScheduleApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? group = null,Object? groupId = null,Object? schedule = freezed,}) {
  return _then(_self.copyWith(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as Uuid,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Map<String, List<ScheduleItemDto>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleApiDto].
extension ScheduleApiDtoPatterns on ScheduleApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleApiDto value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String group,  Uuid groupId,  Map<String, List<ScheduleItemDto>>? schedule)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleApiDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String group,  Uuid groupId,  Map<String, List<ScheduleItemDto>>? schedule)  $default,) {final _that = this;
switch (_that) {
case _ScheduleApiDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String group,  Uuid groupId,  Map<String, List<ScheduleItemDto>>? schedule)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleApiDto() when $default != null:
return $default(_that.group,_that.groupId,_that.schedule);case _:
  return null;

}
}

}

/// @nodoc


class _ScheduleApiDto implements ScheduleApiDto {
  const _ScheduleApiDto({required this.group, required this.groupId, final  Map<String, List<ScheduleItemDto>>? schedule}): _schedule = schedule;
  

@override final  String group;
@override final  Uuid groupId;
 final  Map<String, List<ScheduleItemDto>>? _schedule;
@override Map<String, List<ScheduleItemDto>>? get schedule {
  final value = _schedule;
  if (value == null) return null;
  if (_schedule is EqualUnmodifiableMapView) return _schedule;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ScheduleApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleApiDtoCopyWith<_ScheduleApiDto> get copyWith => __$ScheduleApiDtoCopyWithImpl<_ScheduleApiDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleApiDto&&(identical(other.group, group) || other.group == group)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other._schedule, _schedule));
}


@override
int get hashCode => Object.hash(runtimeType,group,groupId,const DeepCollectionEquality().hash(_schedule));

@override
String toString() {
  return 'ScheduleApiDto(group: $group, groupId: $groupId, schedule: $schedule)';
}


}

/// @nodoc
abstract mixin class _$ScheduleApiDtoCopyWith<$Res> implements $ScheduleApiDtoCopyWith<$Res> {
  factory _$ScheduleApiDtoCopyWith(_ScheduleApiDto value, $Res Function(_ScheduleApiDto) _then) = __$ScheduleApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String group, Uuid groupId, Map<String, List<ScheduleItemDto>>? schedule
});




}
/// @nodoc
class __$ScheduleApiDtoCopyWithImpl<$Res>
    implements _$ScheduleApiDtoCopyWith<$Res> {
  __$ScheduleApiDtoCopyWithImpl(this._self, this._then);

  final _ScheduleApiDto _self;
  final $Res Function(_ScheduleApiDto) _then;

/// Create a copy of ScheduleApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? group = null,Object? groupId = null,Object? schedule = freezed,}) {
  return _then(_ScheduleApiDto(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as Uuid,schedule: freezed == schedule ? _self._schedule : schedule // ignore: cast_nullable_to_non_nullable
as Map<String, List<ScheduleItemDto>>?,
  ));
}


}


/// @nodoc
mixin _$ScheduleItemDto {

 String get time; String get subject; String get teacher; String get room; String get period;
/// Create a copy of ScheduleItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleItemDtoCopyWith<ScheduleItemDto> get copyWith => _$ScheduleItemDtoCopyWithImpl<ScheduleItemDto>(this as ScheduleItemDto, _$identity);

  /// Serializes this ScheduleItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleItemDto&&(identical(other.time, time) || other.time == time)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.room, room) || other.room == room)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,subject,teacher,room,period);

@override
String toString() {
  return 'ScheduleItemDto(time: $time, subject: $subject, teacher: $teacher, room: $room, period: $period)';
}


}

/// @nodoc
abstract mixin class $ScheduleItemDtoCopyWith<$Res>  {
  factory $ScheduleItemDtoCopyWith(ScheduleItemDto value, $Res Function(ScheduleItemDto) _then) = _$ScheduleItemDtoCopyWithImpl;
@useResult
$Res call({
 String time, String subject, String teacher, String room, String period
});




}
/// @nodoc
class _$ScheduleItemDtoCopyWithImpl<$Res>
    implements $ScheduleItemDtoCopyWith<$Res> {
  _$ScheduleItemDtoCopyWithImpl(this._self, this._then);

  final ScheduleItemDto _self;
  final $Res Function(ScheduleItemDto) _then;

/// Create a copy of ScheduleItemDto
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


/// Adds pattern-matching-related methods to [ScheduleItemDto].
extension ScheduleItemDtoPatterns on ScheduleItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleItemDto() when $default != null:
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
case _ScheduleItemDto() when $default != null:
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
case _ScheduleItemDto():
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
case _ScheduleItemDto() when $default != null:
return $default(_that.time,_that.subject,_that.teacher,_that.room,_that.period);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleItemDto implements ScheduleItemDto {
  const _ScheduleItemDto({required this.time, required this.subject, required this.teacher, required this.room, required this.period});
  factory _ScheduleItemDto.fromJson(Map<String, dynamic> json) => _$ScheduleItemDtoFromJson(json);

@override final  String time;
@override final  String subject;
@override final  String teacher;
@override final  String room;
@override final  String period;

/// Create a copy of ScheduleItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleItemDtoCopyWith<_ScheduleItemDto> get copyWith => __$ScheduleItemDtoCopyWithImpl<_ScheduleItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleItemDto&&(identical(other.time, time) || other.time == time)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.teacher, teacher) || other.teacher == teacher)&&(identical(other.room, room) || other.room == room)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,subject,teacher,room,period);

@override
String toString() {
  return 'ScheduleItemDto(time: $time, subject: $subject, teacher: $teacher, room: $room, period: $period)';
}


}

/// @nodoc
abstract mixin class _$ScheduleItemDtoCopyWith<$Res> implements $ScheduleItemDtoCopyWith<$Res> {
  factory _$ScheduleItemDtoCopyWith(_ScheduleItemDto value, $Res Function(_ScheduleItemDto) _then) = __$ScheduleItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String time, String subject, String teacher, String room, String period
});




}
/// @nodoc
class __$ScheduleItemDtoCopyWithImpl<$Res>
    implements _$ScheduleItemDtoCopyWith<$Res> {
  __$ScheduleItemDtoCopyWithImpl(this._self, this._then);

  final _ScheduleItemDto _self;
  final $Res Function(_ScheduleItemDto) _then;

/// Create a copy of ScheduleItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? subject = null,Object? teacher = null,Object? room = null,Object? period = null,}) {
  return _then(_ScheduleItemDto(
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
