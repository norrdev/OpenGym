// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workout_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutExerciseCopyWith<WorkoutExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutExerciseCopyWith<$Res> {
  factory $WorkoutExerciseCopyWith(
          WorkoutExercise value, $Res Function(WorkoutExercise) then) =
      _$WorkoutExerciseCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      int maxSets,
      int restTime,
      List<WorkoutSet> sets,
      bool completed});
}

/// @nodoc
class _$WorkoutExerciseCopyWithImpl<$Res>
    implements $WorkoutExerciseCopyWith<$Res> {
  _$WorkoutExerciseCopyWithImpl(this._value, this._then);

  final WorkoutExercise _value;
  // ignore: unused_field
  final $Res Function(WorkoutExercise) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? maxSets = freezed,
    Object? restTime = freezed,
    Object? sets = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxSets: maxSets == freezed
          ? _value.maxSets
          : maxSets // ignore: cast_nullable_to_non_nullable
              as int,
      restTime: restTime == freezed
          ? _value.restTime
          : restTime // ignore: cast_nullable_to_non_nullable
              as int,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkoutExerciseCopyWith<$Res>
    implements $WorkoutExerciseCopyWith<$Res> {
  factory _$$_WorkoutExerciseCopyWith(
          _$_WorkoutExercise value, $Res Function(_$_WorkoutExercise) then) =
      __$$_WorkoutExerciseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      int maxSets,
      int restTime,
      List<WorkoutSet> sets,
      bool completed});
}

/// @nodoc
class __$$_WorkoutExerciseCopyWithImpl<$Res>
    extends _$WorkoutExerciseCopyWithImpl<$Res>
    implements _$$_WorkoutExerciseCopyWith<$Res> {
  __$$_WorkoutExerciseCopyWithImpl(
      _$_WorkoutExercise _value, $Res Function(_$_WorkoutExercise) _then)
      : super(_value, (v) => _then(v as _$_WorkoutExercise));

  @override
  _$_WorkoutExercise get _value => super._value as _$_WorkoutExercise;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? maxSets = freezed,
    Object? restTime = freezed,
    Object? sets = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$_WorkoutExercise(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      maxSets: maxSets == freezed
          ? _value.maxSets
          : maxSets // ignore: cast_nullable_to_non_nullable
              as int,
      restTime: restTime == freezed
          ? _value.restTime
          : restTime // ignore: cast_nullable_to_non_nullable
              as int,
      sets: sets == freezed
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkoutExercise implements _WorkoutExercise {
  const _$_WorkoutExercise(
      {required this.id,
      required this.name,
      required this.maxSets,
      required this.restTime,
      required final List<WorkoutSet> sets,
      required this.completed})
      : _sets = sets;

  factory _$_WorkoutExercise.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutExerciseFromJson(json);

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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  final bool completed;

  @override
  String toString() {
    return 'WorkoutExercise(id: $id, name: $name, maxSets: $maxSets, restTime: $restTime, sets: $sets, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutExercise &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.maxSets, maxSets) &&
            const DeepCollectionEquality().equals(other.restTime, restTime) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            const DeepCollectionEquality().equals(other.completed, completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(maxSets),
      const DeepCollectionEquality().hash(restTime),
      const DeepCollectionEquality().hash(_sets),
      const DeepCollectionEquality().hash(completed));

  @JsonKey(ignore: true)
  @override
  _$$_WorkoutExerciseCopyWith<_$_WorkoutExercise> get copyWith =>
      __$$_WorkoutExerciseCopyWithImpl<_$_WorkoutExercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutExerciseToJson(
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
      required final bool completed}) = _$_WorkoutExercise;

  factory _WorkoutExercise.fromJson(Map<String, dynamic> json) =
      _$_WorkoutExercise.fromJson;

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
  @JsonKey(ignore: true)
  _$$_WorkoutExerciseCopyWith<_$_WorkoutExercise> get copyWith =>
      throw _privateConstructorUsedError;
}
