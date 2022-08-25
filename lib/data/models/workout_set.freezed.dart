// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workout_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) {
  return _WorkoutSet.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSet {
  int? get repeats => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutSetCopyWith<WorkoutSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetCopyWith<$Res> {
  factory $WorkoutSetCopyWith(
          WorkoutSet value, $Res Function(WorkoutSet) then) =
      _$WorkoutSetCopyWithImpl<$Res>;
  $Res call({int? repeats, double? weight});
}

/// @nodoc
class _$WorkoutSetCopyWithImpl<$Res> implements $WorkoutSetCopyWith<$Res> {
  _$WorkoutSetCopyWithImpl(this._value, this._then);

  final WorkoutSet _value;
  // ignore: unused_field
  final $Res Function(WorkoutSet) _then;

  @override
  $Res call({
    Object? repeats = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      repeats: repeats == freezed
          ? _value.repeats
          : repeats // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkoutSetCopyWith<$Res>
    implements $WorkoutSetCopyWith<$Res> {
  factory _$$_WorkoutSetCopyWith(
          _$_WorkoutSet value, $Res Function(_$_WorkoutSet) then) =
      __$$_WorkoutSetCopyWithImpl<$Res>;
  @override
  $Res call({int? repeats, double? weight});
}

/// @nodoc
class __$$_WorkoutSetCopyWithImpl<$Res> extends _$WorkoutSetCopyWithImpl<$Res>
    implements _$$_WorkoutSetCopyWith<$Res> {
  __$$_WorkoutSetCopyWithImpl(
      _$_WorkoutSet _value, $Res Function(_$_WorkoutSet) _then)
      : super(_value, (v) => _then(v as _$_WorkoutSet));

  @override
  _$_WorkoutSet get _value => super._value as _$_WorkoutSet;

  @override
  $Res call({
    Object? repeats = freezed,
    Object? weight = freezed,
  }) {
    return _then(_$_WorkoutSet(
      repeats: repeats == freezed
          ? _value.repeats
          : repeats // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkoutSet implements _WorkoutSet {
  const _$_WorkoutSet({this.repeats, this.weight});

  factory _$_WorkoutSet.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutSetFromJson(json);

  @override
  final int? repeats;
  @override
  final double? weight;

  @override
  String toString() {
    return 'WorkoutSet(repeats: $repeats, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutSet &&
            const DeepCollectionEquality().equals(other.repeats, repeats) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(repeats),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$$_WorkoutSetCopyWith<_$_WorkoutSet> get copyWith =>
      __$$_WorkoutSetCopyWithImpl<_$_WorkoutSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutSetToJson(
      this,
    );
  }
}

abstract class _WorkoutSet implements WorkoutSet {
  const factory _WorkoutSet({final int? repeats, final double? weight}) =
      _$_WorkoutSet;

  factory _WorkoutSet.fromJson(Map<String, dynamic> json) =
      _$_WorkoutSet.fromJson;

  @override
  int? get repeats;
  @override
  double? get weight;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutSetCopyWith<_$_WorkoutSet> get copyWith =>
      throw _privateConstructorUsedError;
}
