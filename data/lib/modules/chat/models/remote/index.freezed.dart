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
mixin _$ChatApiDto {

 String get chatId; String get type; List<String> get participants; String? get groupName; String? get groupAvatar; String? get lastMessage; DateTime? get lastMessageTime; String? get createdBy;
/// Create a copy of ChatApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatApiDtoCopyWith<ChatApiDto> get copyWith => _$ChatApiDtoCopyWithImpl<ChatApiDto>(this as ChatApiDto, _$identity);

  /// Serializes this ChatApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatApiDto&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupAvatar, groupAvatar) || other.groupAvatar == groupAvatar)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,type,const DeepCollectionEquality().hash(participants),groupName,groupAvatar,lastMessage,lastMessageTime,createdBy);

@override
String toString() {
  return 'ChatApiDto(chatId: $chatId, type: $type, participants: $participants, groupName: $groupName, groupAvatar: $groupAvatar, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class $ChatApiDtoCopyWith<$Res>  {
  factory $ChatApiDtoCopyWith(ChatApiDto value, $Res Function(ChatApiDto) _then) = _$ChatApiDtoCopyWithImpl;
@useResult
$Res call({
 String chatId, String type, List<String> participants, String? groupName, String? groupAvatar, String? lastMessage, DateTime? lastMessageTime, String? createdBy
});




}
/// @nodoc
class _$ChatApiDtoCopyWithImpl<$Res>
    implements $ChatApiDtoCopyWith<$Res> {
  _$ChatApiDtoCopyWithImpl(this._self, this._then);

  final ChatApiDto _self;
  final $Res Function(ChatApiDto) _then;

/// Create a copy of ChatApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? type = null,Object? participants = null,Object? groupName = freezed,Object? groupAvatar = freezed,Object? lastMessage = freezed,Object? lastMessageTime = freezed,Object? createdBy = freezed,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,groupName: freezed == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String?,groupAvatar: freezed == groupAvatar ? _self.groupAvatar : groupAvatar // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastMessageTime: freezed == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatApiDto].
extension ChatApiDtoPatterns on ChatApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatApiDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  String type,  List<String> participants,  String? groupName,  String? groupAvatar,  String? lastMessage,  DateTime? lastMessageTime,  String? createdBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatApiDto() when $default != null:
return $default(_that.chatId,_that.type,_that.participants,_that.groupName,_that.groupAvatar,_that.lastMessage,_that.lastMessageTime,_that.createdBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  String type,  List<String> participants,  String? groupName,  String? groupAvatar,  String? lastMessage,  DateTime? lastMessageTime,  String? createdBy)  $default,) {final _that = this;
switch (_that) {
case _ChatApiDto():
return $default(_that.chatId,_that.type,_that.participants,_that.groupName,_that.groupAvatar,_that.lastMessage,_that.lastMessageTime,_that.createdBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  String type,  List<String> participants,  String? groupName,  String? groupAvatar,  String? lastMessage,  DateTime? lastMessageTime,  String? createdBy)?  $default,) {final _that = this;
switch (_that) {
case _ChatApiDto() when $default != null:
return $default(_that.chatId,_that.type,_that.participants,_that.groupName,_that.groupAvatar,_that.lastMessage,_that.lastMessageTime,_that.createdBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatApiDto extends ChatApiDto {
  const _ChatApiDto({required this.chatId, required this.type, required final  List<String> participants, this.groupName, this.groupAvatar, this.lastMessage, this.lastMessageTime, this.createdBy}): _participants = participants,super._();
  factory _ChatApiDto.fromJson(Map<String, dynamic> json) => _$ChatApiDtoFromJson(json);

@override final  String chatId;
@override final  String type;
 final  List<String> _participants;
@override List<String> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override final  String? groupName;
@override final  String? groupAvatar;
@override final  String? lastMessage;
@override final  DateTime? lastMessageTime;
@override final  String? createdBy;

/// Create a copy of ChatApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatApiDtoCopyWith<_ChatApiDto> get copyWith => __$ChatApiDtoCopyWithImpl<_ChatApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatApiDto&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.groupAvatar, groupAvatar) || other.groupAvatar == groupAvatar)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,type,const DeepCollectionEquality().hash(_participants),groupName,groupAvatar,lastMessage,lastMessageTime,createdBy);

@override
String toString() {
  return 'ChatApiDto(chatId: $chatId, type: $type, participants: $participants, groupName: $groupName, groupAvatar: $groupAvatar, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, createdBy: $createdBy)';
}


}

/// @nodoc
abstract mixin class _$ChatApiDtoCopyWith<$Res> implements $ChatApiDtoCopyWith<$Res> {
  factory _$ChatApiDtoCopyWith(_ChatApiDto value, $Res Function(_ChatApiDto) _then) = __$ChatApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String chatId, String type, List<String> participants, String? groupName, String? groupAvatar, String? lastMessage, DateTime? lastMessageTime, String? createdBy
});




}
/// @nodoc
class __$ChatApiDtoCopyWithImpl<$Res>
    implements _$ChatApiDtoCopyWith<$Res> {
  __$ChatApiDtoCopyWithImpl(this._self, this._then);

  final _ChatApiDto _self;
  final $Res Function(_ChatApiDto) _then;

/// Create a copy of ChatApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? type = null,Object? participants = null,Object? groupName = freezed,Object? groupAvatar = freezed,Object? lastMessage = freezed,Object? lastMessageTime = freezed,Object? createdBy = freezed,}) {
  return _then(_ChatApiDto(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>,groupName: freezed == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String?,groupAvatar: freezed == groupAvatar ? _self.groupAvatar : groupAvatar // ignore: cast_nullable_to_non_nullable
as String?,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastMessageTime: freezed == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MessageApiDto {

 String get messageId; String get senderId; String get text; DateTime get timestamp; String get type; List<String> get readBy;
/// Create a copy of MessageApiDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageApiDtoCopyWith<MessageApiDto> get copyWith => _$MessageApiDtoCopyWithImpl<MessageApiDto>(this as MessageApiDto, _$identity);

  /// Serializes this MessageApiDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageApiDto&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.text, text) || other.text == text)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.readBy, readBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,senderId,text,timestamp,type,const DeepCollectionEquality().hash(readBy));

@override
String toString() {
  return 'MessageApiDto(messageId: $messageId, senderId: $senderId, text: $text, timestamp: $timestamp, type: $type, readBy: $readBy)';
}


}

/// @nodoc
abstract mixin class $MessageApiDtoCopyWith<$Res>  {
  factory $MessageApiDtoCopyWith(MessageApiDto value, $Res Function(MessageApiDto) _then) = _$MessageApiDtoCopyWithImpl;
@useResult
$Res call({
 String messageId, String senderId, String text, DateTime timestamp, String type, List<String> readBy
});




}
/// @nodoc
class _$MessageApiDtoCopyWithImpl<$Res>
    implements $MessageApiDtoCopyWith<$Res> {
  _$MessageApiDtoCopyWithImpl(this._self, this._then);

  final MessageApiDto _self;
  final $Res Function(MessageApiDto) _then;

/// Create a copy of MessageApiDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messageId = null,Object? senderId = null,Object? text = null,Object? timestamp = null,Object? type = null,Object? readBy = null,}) {
  return _then(_self.copyWith(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,readBy: null == readBy ? _self.readBy : readBy // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageApiDto].
extension MessageApiDtoPatterns on MessageApiDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageApiDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageApiDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageApiDto value)  $default,){
final _that = this;
switch (_that) {
case _MessageApiDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageApiDto value)?  $default,){
final _that = this;
switch (_that) {
case _MessageApiDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String messageId,  String senderId,  String text,  DateTime timestamp,  String type,  List<String> readBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageApiDto() when $default != null:
return $default(_that.messageId,_that.senderId,_that.text,_that.timestamp,_that.type,_that.readBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String messageId,  String senderId,  String text,  DateTime timestamp,  String type,  List<String> readBy)  $default,) {final _that = this;
switch (_that) {
case _MessageApiDto():
return $default(_that.messageId,_that.senderId,_that.text,_that.timestamp,_that.type,_that.readBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String messageId,  String senderId,  String text,  DateTime timestamp,  String type,  List<String> readBy)?  $default,) {final _that = this;
switch (_that) {
case _MessageApiDto() when $default != null:
return $default(_that.messageId,_that.senderId,_that.text,_that.timestamp,_that.type,_that.readBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageApiDto extends MessageApiDto {
  const _MessageApiDto({required this.messageId, required this.senderId, required this.text, required this.timestamp, this.type = 'text', final  List<String> readBy = const []}): _readBy = readBy,super._();
  factory _MessageApiDto.fromJson(Map<String, dynamic> json) => _$MessageApiDtoFromJson(json);

@override final  String messageId;
@override final  String senderId;
@override final  String text;
@override final  DateTime timestamp;
@override@JsonKey() final  String type;
 final  List<String> _readBy;
@override@JsonKey() List<String> get readBy {
  if (_readBy is EqualUnmodifiableListView) return _readBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readBy);
}


/// Create a copy of MessageApiDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageApiDtoCopyWith<_MessageApiDto> get copyWith => __$MessageApiDtoCopyWithImpl<_MessageApiDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageApiDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageApiDto&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.text, text) || other.text == text)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._readBy, _readBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,senderId,text,timestamp,type,const DeepCollectionEquality().hash(_readBy));

@override
String toString() {
  return 'MessageApiDto(messageId: $messageId, senderId: $senderId, text: $text, timestamp: $timestamp, type: $type, readBy: $readBy)';
}


}

/// @nodoc
abstract mixin class _$MessageApiDtoCopyWith<$Res> implements $MessageApiDtoCopyWith<$Res> {
  factory _$MessageApiDtoCopyWith(_MessageApiDto value, $Res Function(_MessageApiDto) _then) = __$MessageApiDtoCopyWithImpl;
@override @useResult
$Res call({
 String messageId, String senderId, String text, DateTime timestamp, String type, List<String> readBy
});




}
/// @nodoc
class __$MessageApiDtoCopyWithImpl<$Res>
    implements _$MessageApiDtoCopyWith<$Res> {
  __$MessageApiDtoCopyWithImpl(this._self, this._then);

  final _MessageApiDto _self;
  final $Res Function(_MessageApiDto) _then;

/// Create a copy of MessageApiDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? senderId = null,Object? text = null,Object? timestamp = null,Object? type = null,Object? readBy = null,}) {
  return _then(_MessageApiDto(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,readBy: null == readBy ? _self._readBy : readBy // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
