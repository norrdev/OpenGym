// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  int? get logDaysId => throw _privateConstructorUsedError;
  int? get daysId => throw _privateConstructorUsedError;
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
      _$LogDayCopyWithImpl<$Res>;
  $Res call(
      {int? logDaysId,
      int? daysId,
      String? start,
      String? finish,
      String? daysName,
      String? programsName});
}

/// @nodoc
class _$LogDayCopyWithImpl<$Res> implements $LogDayCopyWith<$Res> {
  _$LogDayCopyWithImpl(this._value, this._then);

  final LogDay _value;
  // ignore: unused_field
  final $Res Function(LogDay) _then;

  @override
  $Res call({
    Object? logDaysId = freezed,
    Object? daysId = freezed,
    Object? start = freezed,
    Object? finish = freezed,
    Object? daysName = freezed,
    Object? programsName = freezed,
  }) {
    return _then(_value.copyWith(
      logDaysId: logDaysId == freezed
          ? _value.logDaysId
          : logDaysId // ignore: cast_nullable_to_non_nullable
              as int?,
      daysId: daysId == freezed
          ? _value.daysId
          : daysId // ignore: cast_nullable_to_non_nullable
              as int?,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      finish: finish == freezed
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as String?,
      daysName: daysName == freezed
          ? _value.daysName
          : daysName // ignore: cast_nullable_to_non_nullable
              as String?,
      programsName: programsName == freezed
          ? _value.programsName
          : programsName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LogDayCopyWith<$Res> implements $LogDayCopyWith<$Res> {
  factory _$$_LogDayCopyWith(_$_LogDay value, $Res Function(_$_LogDay) then) =
      __$$_LogDayCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? logDaysId,
      int? daysId,
      String? start,
      String? finish,
      String? daysName,
      String? programsName});
}

/// @nodoc
class __$$_LogDayCopyWithImpl<$Res> extends _$LogDayCopyWithImpl<$Res>
    implements _$$_LogDayCopyWith<$Res> {
  __$$_LogDayCopyWithImpl(_$_LogDay _value, $Res Function(_$_LogDay) _then)
      : super(_value, (v) => _then(v as _$_LogDay));

  @override
  _$_LogDay get _value => super._value as _$_LogDay;

  @override
  $Res call({
    Object? logDaysId = freezed,
    Object? daysId = freezed,
    Object? start = freezed,
    Object? finish = freezed,
    Object? daysName = freezed,
    Object? programsName = freezed,
  }) {
    return _then(_$_LogDay(
      logDaysId: logDaysId == freezed
          ? _value.logDaysId
          : logDaysId // ignore: cast_nullable_to_non_nullable
              as int?,
      daysId: daysId == freezed
          ? _value.daysId
          : daysId // ignore: cast_nullable_to_non_nullable
              as int?,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      finish: finish == freezed
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as String?,
      daysName: daysName == freezed
          ? _value.daysName
          : daysName // ignore: cast_nullable_to_non_nullable
              as String?,
      programsName: programsName == freezed
          ? _value.programsName
          : programsName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LogDay implements _LogDay {
  _$_LogDay(
      {this.logDaysId,
      this.daysId,
      this.start,
      this.finish,
      this.daysName,
      this.programsName});

  factory _$_LogDay.fromJson(Map<String, dynamic> json) =>
      _$$_LogDayFromJson(json);

  @override
  final int? logDaysId;
  @override
  final int? daysId;
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
    return 'LogDay(logDaysId: $logDaysId, daysId: $daysId, start: $start, finish: $finish, daysName: $daysName, programsName: $programsName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogDay &&
            const DeepCollectionEquality().equals(other.logDaysId, logDaysId) &&
            const DeepCollectionEquality().equals(other.daysId, daysId) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.finish, finish) &&
            const DeepCollectionEquality().equals(other.daysName, daysName) &&
            const DeepCollectionEquality()
                .equals(other.programsName, programsName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(logDaysId),
      const DeepCollectionEquality().hash(daysId),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(finish),
      const DeepCollectionEquality().hash(daysName),
      const DeepCollectionEquality().hash(programsName));

  @JsonKey(ignore: true)
  @override
  _$$_LogDayCopyWith<_$_LogDay> get copyWith =>
      __$$_LogDayCopyWithImpl<_$_LogDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogDayToJson(
      this,
    );
  }
}

abstract class _LogDay implements LogDay {
  factory _LogDay(
      {final int? logDaysId,
      final int? daysId,
      final String? start,
      final String? finish,
      final String? daysName,
      final String? programsName}) = _$_LogDay;

  factory _LogDay.fromJson(Map<String, dynamic> json) = _$_LogDay.fromJson;

  @override
  int? get logDaysId;
  @override
  int? get daysId;
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
  _$$_LogDayCopyWith<_$_LogDay> get copyWith =>
      throw _privateConstructorUsedError;
}
