// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogDay _$LogDayFromJson(Map<String, dynamic> json) {
  return _LogDay.fromJson(json);
}

/// @nodoc
mixin _$LogDay {
  int? get logDayId => throw _privateConstructorUsedError;
  int? get dayId => throw _privateConstructorUsedError;
  String? get start => throw _privateConstructorUsedError;
  String? get finish => throw _privateConstructorUsedError;
  String? get daysName => throw _privateConstructorUsedError;
  String? get programsName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogDayCopyWith<LogDay> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogDayCopyWith<$Res> {
  factory $LogDayCopyWith(LogDay value, $Res Function(LogDay) then) =
      _$LogDayCopyWithImpl<$Res, LogDay>;
  @useResult
  $Res call(
      {int? logDayId,
      int? dayId,
      String? start,
      String? finish,
      String? daysName,
      String? programsName});
}

/// @nodoc
class _$LogDayCopyWithImpl<$Res, $Val extends LogDay>
    implements $LogDayCopyWith<$Res> {
  _$LogDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logDayId = freezed,
    Object? dayId = freezed,
    Object? start = freezed,
    Object? finish = freezed,
    Object? daysName = freezed,
    Object? programsName = freezed,
  }) {
    return _then(_value.copyWith(
      logDayId: freezed == logDayId
          ? _value.logDayId
          : logDayId // ignore: cast_nullable_to_non_nullable
              as int?,
      dayId: freezed == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      finish: freezed == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as String?,
      daysName: freezed == daysName
          ? _value.daysName
          : daysName // ignore: cast_nullable_to_non_nullable
              as String?,
      programsName: freezed == programsName
          ? _value.programsName
          : programsName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogDayImplCopyWith<$Res> implements $LogDayCopyWith<$Res> {
  factory _$$LogDayImplCopyWith(
          _$LogDayImpl value, $Res Function(_$LogDayImpl) then) =
      __$$LogDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? logDayId,
      int? dayId,
      String? start,
      String? finish,
      String? daysName,
      String? programsName});
}

/// @nodoc
class __$$LogDayImplCopyWithImpl<$Res>
    extends _$LogDayCopyWithImpl<$Res, _$LogDayImpl>
    implements _$$LogDayImplCopyWith<$Res> {
  __$$LogDayImplCopyWithImpl(
      _$LogDayImpl _value, $Res Function(_$LogDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logDayId = freezed,
    Object? dayId = freezed,
    Object? start = freezed,
    Object? finish = freezed,
    Object? daysName = freezed,
    Object? programsName = freezed,
  }) {
    return _then(_$LogDayImpl(
      logDayId: freezed == logDayId
          ? _value.logDayId
          : logDayId // ignore: cast_nullable_to_non_nullable
              as int?,
      dayId: freezed == dayId
          ? _value.dayId
          : dayId // ignore: cast_nullable_to_non_nullable
              as int?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      finish: freezed == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as String?,
      daysName: freezed == daysName
          ? _value.daysName
          : daysName // ignore: cast_nullable_to_non_nullable
              as String?,
      programsName: freezed == programsName
          ? _value.programsName
          : programsName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogDayImpl implements _LogDay {
  _$LogDayImpl(
      {this.logDayId,
      this.dayId,
      this.start,
      this.finish,
      this.daysName,
      this.programsName});

  factory _$LogDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogDayImplFromJson(json);

  @override
  final int? logDayId;
  @override
  final int? dayId;
  @override
  final String? start;
  @override
  final String? finish;
  @override
  final String? daysName;
  @override
  final String? programsName;

  @override
  String toString() {
    return 'LogDay(logDayId: $logDayId, dayId: $dayId, start: $start, finish: $finish, daysName: $daysName, programsName: $programsName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogDayImpl &&
            (identical(other.logDayId, logDayId) ||
                other.logDayId == logDayId) &&
            (identical(other.dayId, dayId) || other.dayId == dayId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.finish, finish) || other.finish == finish) &&
            (identical(other.daysName, daysName) ||
                other.daysName == daysName) &&
            (identical(other.programsName, programsName) ||
                other.programsName == programsName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, logDayId, dayId, start, finish, daysName, programsName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogDayImplCopyWith<_$LogDayImpl> get copyWith =>
      __$$LogDayImplCopyWithImpl<_$LogDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogDayImplToJson(
      this,
    );
  }
}

abstract class _LogDay implements LogDay {
  factory _LogDay(
      {final int? logDayId,
      final int? dayId,
      final String? start,
      final String? finish,
      final String? daysName,
      final String? programsName}) = _$LogDayImpl;

  factory _LogDay.fromJson(Map<String, dynamic> json) = _$LogDayImpl.fromJson;

  @override
  int? get logDayId;
  @override
  int? get dayId;
  @override
  String? get start;
  @override
  String? get finish;
  @override
  String? get daysName;
  @override
  String? get programsName;
  @override
  @JsonKey(ignore: true)
  _$$LogDayImplCopyWith<_$LogDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
