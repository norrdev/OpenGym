// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSet _$WorkoutSetFromJson(Map<String, dynamic> json) {
  return _WorkoutSet.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSet {
  int? get repeats => throw _privateConstructorUsedError;
  int? get repeatsLeft => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get weightLeft => throw _privateConstructorUsedError;
  int? get timeLoad => throw _privateConstructorUsedError;
  int? get rest => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSetCopyWith<WorkoutSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetCopyWith<$Res> {
  factory $WorkoutSetCopyWith(
          WorkoutSet value, $Res Function(WorkoutSet) then) =
      _$WorkoutSetCopyWithImpl<$Res, WorkoutSet>;
  @useResult
  $Res call(
      {int? repeats,
      int? repeatsLeft,
      double? weight,
      double? weightLeft,
      int? timeLoad,
      int? rest,
      double? distance});
}

/// @nodoc
class _$WorkoutSetCopyWithImpl<$Res, $Val extends WorkoutSet>
    implements $WorkoutSetCopyWith<$Res> {
  _$WorkoutSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeats = freezed,
    Object? repeatsLeft = freezed,
    Object? weight = freezed,
    Object? weightLeft = freezed,
    Object? timeLoad = freezed,
    Object? rest = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      repeats: freezed == repeats
          ? _value.repeats
          : repeats // ignore: cast_nullable_to_non_nullable
              as int?,
      repeatsLeft: freezed == repeatsLeft
          ? _value.repeatsLeft
          : repeatsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weightLeft: freezed == weightLeft
          ? _value.weightLeft
          : weightLeft // ignore: cast_nullable_to_non_nullable
              as double?,
      timeLoad: freezed == timeLoad
          ? _value.timeLoad
          : timeLoad // ignore: cast_nullable_to_non_nullable
              as int?,
      rest: freezed == rest
          ? _value.rest
          : rest // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSetImplCopyWith<$Res>
    implements $WorkoutSetCopyWith<$Res> {
  factory _$$WorkoutSetImplCopyWith(
          _$WorkoutSetImpl value, $Res Function(_$WorkoutSetImpl) then) =
      __$$WorkoutSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? repeats,
      int? repeatsLeft,
      double? weight,
      double? weightLeft,
      int? timeLoad,
      int? rest,
      double? distance});
}

/// @nodoc
class __$$WorkoutSetImplCopyWithImpl<$Res>
    extends _$WorkoutSetCopyWithImpl<$Res, _$WorkoutSetImpl>
    implements _$$WorkoutSetImplCopyWith<$Res> {
  __$$WorkoutSetImplCopyWithImpl(
      _$WorkoutSetImpl _value, $Res Function(_$WorkoutSetImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeats = freezed,
    Object? repeatsLeft = freezed,
    Object? weight = freezed,
    Object? weightLeft = freezed,
    Object? timeLoad = freezed,
    Object? rest = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$WorkoutSetImpl(
      repeats: freezed == repeats
          ? _value.repeats
          : repeats // ignore: cast_nullable_to_non_nullable
              as int?,
      repeatsLeft: freezed == repeatsLeft
          ? _value.repeatsLeft
          : repeatsLeft // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weightLeft: freezed == weightLeft
          ? _value.weightLeft
          : weightLeft // ignore: cast_nullable_to_non_nullable
              as double?,
      timeLoad: freezed == timeLoad
          ? _value.timeLoad
          : timeLoad // ignore: cast_nullable_to_non_nullable
              as int?,
      rest: freezed == rest
          ? _value.rest
          : rest // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSetImpl implements _WorkoutSet {
  const _$WorkoutSetImpl(
      {this.repeats,
      this.repeatsLeft,
      this.weight,
      this.weightLeft,
      this.timeLoad,
      this.rest,
      this.distance});

  factory _$WorkoutSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSetImplFromJson(json);

  @override
  final int? repeats;
  @override
  final int? repeatsLeft;
  @override
  final double? weight;
  @override
  final double? weightLeft;
  @override
  final int? timeLoad;
  @override
  final int? rest;
  @override
  final double? distance;

  @override
  String toString() {
    return 'WorkoutSet(repeats: $repeats, repeatsLeft: $repeatsLeft, weight: $weight, weightLeft: $weightLeft, timeLoad: $timeLoad, rest: $rest, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSetImpl &&
            (identical(other.repeats, repeats) || other.repeats == repeats) &&
            (identical(other.repeatsLeft, repeatsLeft) ||
                other.repeatsLeft == repeatsLeft) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.weightLeft, weightLeft) ||
                other.weightLeft == weightLeft) &&
            (identical(other.timeLoad, timeLoad) ||
                other.timeLoad == timeLoad) &&
            (identical(other.rest, rest) || other.rest == rest) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, repeats, repeatsLeft, weight,
      weightLeft, timeLoad, rest, distance);

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSetImplCopyWith<_$WorkoutSetImpl> get copyWith =>
      __$$WorkoutSetImplCopyWithImpl<_$WorkoutSetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSetImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSet implements WorkoutSet {
  const factory _WorkoutSet(
      {final int? repeats,
      final int? repeatsLeft,
      final double? weight,
      final double? weightLeft,
      final int? timeLoad,
      final int? rest,
      final double? distance}) = _$WorkoutSetImpl;

  factory _WorkoutSet.fromJson(Map<String, dynamic> json) =
      _$WorkoutSetImpl.fromJson;

  @override
  int? get repeats;
  @override
  int? get repeatsLeft;
  @override
  double? get weight;
  @override
  double? get weightLeft;
  @override
  int? get timeLoad;
  @override
  int? get rest;
  @override
  double? get distance;

  /// Create a copy of WorkoutSet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSetImplCopyWith<_$WorkoutSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
