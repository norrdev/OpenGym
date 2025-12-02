// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutExercise _$WorkoutExerciseFromJson(Map<String, dynamic> json) {
  return _WorkoutExercise.fromJson(json);
}

/// @nodoc
mixin _$WorkoutExercise {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get maxSets => throw _privateConstructorUsedError;
  int get restTime => throw _privateConstructorUsedError;
  List<WorkoutSet> get sets => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  int get limbs => throw _privateConstructorUsedError;
  int get loadId => throw _privateConstructorUsedError;

  /// Serializes this WorkoutExercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutExerciseCopyWith<WorkoutExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutExerciseCopyWith<$Res> {
  factory $WorkoutExerciseCopyWith(
          WorkoutExercise value, $Res Function(WorkoutExercise) then) =
      _$WorkoutExerciseCopyWithImpl<$Res, WorkoutExercise>;
  @useResult
  $Res call(
      {int id,
      String name,
      int maxSets,
      int restTime,
      List<WorkoutSet> sets,
      bool completed,
      int limbs,
      int loadId});
}

/// @nodoc
class _$WorkoutExerciseCopyWithImpl<$Res, $Val extends WorkoutExercise>
    implements $WorkoutExerciseCopyWith<$Res> {
  _$WorkoutExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxSets = null,
    Object? restTime = null,
    Object? sets = null,
    Object? completed = null,
    Object? limbs = null,
    Object? loadId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxSets: null == maxSets
          ? _value.maxSets
          : maxSets // ignore: cast_nullable_to_non_nullable
              as int,
      restTime: null == restTime
          ? _value.restTime
          : restTime // ignore: cast_nullable_to_non_nullable
              as int,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      limbs: null == limbs
          ? _value.limbs
          : limbs // ignore: cast_nullable_to_non_nullable
              as int,
      loadId: null == loadId
          ? _value.loadId
          : loadId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutExerciseImplCopyWith<$Res>
    implements $WorkoutExerciseCopyWith<$Res> {
  factory _$$WorkoutExerciseImplCopyWith(_$WorkoutExerciseImpl value,
          $Res Function(_$WorkoutExerciseImpl) then) =
      __$$WorkoutExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int maxSets,
      int restTime,
      List<WorkoutSet> sets,
      bool completed,
      int limbs,
      int loadId});
}

/// @nodoc
class __$$WorkoutExerciseImplCopyWithImpl<$Res>
    extends _$WorkoutExerciseCopyWithImpl<$Res, _$WorkoutExerciseImpl>
    implements _$$WorkoutExerciseImplCopyWith<$Res> {
  __$$WorkoutExerciseImplCopyWithImpl(
      _$WorkoutExerciseImpl _value, $Res Function(_$WorkoutExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxSets = null,
    Object? restTime = null,
    Object? sets = null,
    Object? completed = null,
    Object? limbs = null,
    Object? loadId = null,
  }) {
    return _then(_$WorkoutExerciseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxSets: null == maxSets
          ? _value.maxSets
          : maxSets // ignore: cast_nullable_to_non_nullable
              as int,
      restTime: null == restTime
          ? _value.restTime
          : restTime // ignore: cast_nullable_to_non_nullable
              as int,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      limbs: null == limbs
          ? _value.limbs
          : limbs // ignore: cast_nullable_to_non_nullable
              as int,
      loadId: null == loadId
          ? _value.loadId
          : loadId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutExerciseImpl implements _WorkoutExercise {
  const _$WorkoutExerciseImpl(
      {required this.id,
      required this.name,
      required this.maxSets,
      required this.restTime,
      required final List<WorkoutSet> sets,
      required this.completed,
      required this.limbs,
      required this.loadId})
      : _sets = sets;

  factory _$WorkoutExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutExerciseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int maxSets;
  @override
  final int restTime;
  final List<WorkoutSet> _sets;
  @override
  List<WorkoutSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final bool completed;
  @override
  final int limbs;
  @override
  final int loadId;

  @override
  String toString() {
    return 'WorkoutExercise(id: $id, name: $name, maxSets: $maxSets, restTime: $restTime, sets: $sets, completed: $completed, limbs: $limbs, loadId: $loadId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.maxSets, maxSets) || other.maxSets == maxSets) &&
            (identical(other.restTime, restTime) ||
                other.restTime == restTime) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.limbs, limbs) || other.limbs == limbs) &&
            (identical(other.loadId, loadId) || other.loadId == loadId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, maxSets, restTime,
      const DeepCollectionEquality().hash(_sets), completed, limbs, loadId);

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutExerciseImplCopyWith<_$WorkoutExerciseImpl> get copyWith =>
      __$$WorkoutExerciseImplCopyWithImpl<_$WorkoutExerciseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutExerciseImplToJson(
      this,
    );
  }
}

abstract class _WorkoutExercise implements WorkoutExercise {
  const factory _WorkoutExercise(
      {required final int id,
      required final String name,
      required final int maxSets,
      required final int restTime,
      required final List<WorkoutSet> sets,
      required final bool completed,
      required final int limbs,
      required final int loadId}) = _$WorkoutExerciseImpl;

  factory _WorkoutExercise.fromJson(Map<String, dynamic> json) =
      _$WorkoutExerciseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get maxSets;
  @override
  int get restTime;
  @override
  List<WorkoutSet> get sets;
  @override
  bool get completed;
  @override
  int get limbs;
  @override
  int get loadId;

  /// Create a copy of WorkoutExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutExerciseImplCopyWith<_$WorkoutExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
