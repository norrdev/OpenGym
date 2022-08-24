// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return _Workout.fromJson(json);
}

/// @nodoc
mixin _$Workout {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get ord => throw _privateConstructorUsedError;
  int? get sets => throw _privateConstructorUsedError;
  int? get repeats => throw _privateConstructorUsedError;
  int? get rest => throw _privateConstructorUsedError;
  int? get exercisesId => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? ord,
      int? sets,
      int? repeats,
      int? rest,
      int? exercisesId,
      double? weight});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res> implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  final Workout _value;
  // ignore: unused_field
  final $Res Function(Workout) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? ord = freezed,
    Object? sets = freezed,
    Object? repeats = freezed,
    Object? rest = freezed,
    Object? exercisesId = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ord: ord == freezed
          ? _value.ord
          : ord // ignore: cast_nullable_to_non_nullable
              as int?,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int?,
      repeats: repeats == freezed
          ? _value.repeats
          : repeats // ignore: cast_nullable_to_non_nullable
              as int?,
      rest: rest == freezed
          ? _value.rest
          : rest // ignore: cast_nullable_to_non_nullable
              as int?,
      exercisesId: exercisesId == freezed
          ? _value.exercisesId
          : exercisesId // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkoutCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$_WorkoutCopyWith(
          _$_Workout value, $Res Function(_$_Workout) then) =
      __$$_WorkoutCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? ord,
      int? sets,
      int? repeats,
      int? rest,
      int? exercisesId,
      double? weight});
}

/// @nodoc
class __$$_WorkoutCopyWithImpl<$Res> extends _$WorkoutCopyWithImpl<$Res>
    implements _$$_WorkoutCopyWith<$Res> {
  __$$_WorkoutCopyWithImpl(_$_Workout _value, $Res Function(_$_Workout) _then)
      : super(_value, (v) => _then(v as _$_Workout));

  @override
  _$_Workout get _value => super._value as _$_Workout;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? ord = freezed,
    Object? sets = freezed,
    Object? repeats = freezed,
    Object? rest = freezed,
    Object? exercisesId = freezed,
    Object? weight = freezed,
  }) {
    return _then(_$_Workout(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ord: ord == freezed
          ? _value.ord
          : ord // ignore: cast_nullable_to_non_nullable
              as int?,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int?,
      repeats: repeats == freezed
          ? _value.repeats
          : repeats // ignore: cast_nullable_to_non_nullable
              as int?,
      rest: rest == freezed
          ? _value.rest
          : rest // ignore: cast_nullable_to_non_nullable
              as int?,
      exercisesId: exercisesId == freezed
          ? _value.exercisesId
          : exercisesId // ignore: cast_nullable_to_non_nullable
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
class _$_Workout implements _Workout {
  const _$_Workout(
      {this.id,
      this.name,
      this.description,
      this.ord,
      this.sets,
      this.repeats,
      this.rest,
      this.exercisesId,
      this.weight});

  factory _$_Workout.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? ord;
  @override
  final int? sets;
  @override
  final int? repeats;
  @override
  final int? rest;
  @override
  final int? exercisesId;
  @override
  final double? weight;

  @override
  String toString() {
    return 'Workout(id: $id, name: $name, description: $description, ord: $ord, sets: $sets, repeats: $repeats, rest: $rest, exercisesId: $exercisesId, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Workout &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.ord, ord) &&
            const DeepCollectionEquality().equals(other.sets, sets) &&
            const DeepCollectionEquality().equals(other.repeats, repeats) &&
            const DeepCollectionEquality().equals(other.rest, rest) &&
            const DeepCollectionEquality()
                .equals(other.exercisesId, exercisesId) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(ord),
      const DeepCollectionEquality().hash(sets),
      const DeepCollectionEquality().hash(repeats),
      const DeepCollectionEquality().hash(rest),
      const DeepCollectionEquality().hash(exercisesId),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$$_WorkoutCopyWith<_$_Workout> get copyWith =>
      __$$_WorkoutCopyWithImpl<_$_Workout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutToJson(
      this,
    );
  }
}

abstract class _Workout implements Workout {
  const factory _Workout(
      {final int? id,
      final String? name,
      final String? description,
      final int? ord,
      final int? sets,
      final int? repeats,
      final int? rest,
      final int? exercisesId,
      final double? weight}) = _$_Workout;

  factory _Workout.fromJson(Map<String, dynamic> json) = _$_Workout.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  int? get ord;
  @override
  int? get sets;
  @override
  int? get repeats;
  @override
  int? get rest;
  @override
  int? get exercisesId;
  @override
  double? get weight;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutCopyWith<_$_Workout> get copyWith =>
      throw _privateConstructorUsedError;
}
