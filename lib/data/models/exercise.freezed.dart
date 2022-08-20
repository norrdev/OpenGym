// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  return _Exercise.fromJson(json);
}

/// @nodoc
mixin _$Exercise {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get equipmentId => throw _privateConstructorUsedError;
  int? get preinstalled => throw _privateConstructorUsedError;
  int? get bars => throw _privateConstructorUsedError;
  int? get loadId => throw _privateConstructorUsedError;
  int? get limbs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseCopyWith<Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) then) =
      _$ExerciseCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? equipmentId,
      int? preinstalled,
      int? bars,
      int? loadId,
      int? limbs});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res> implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._value, this._then);

  final Exercise _value;
  // ignore: unused_field
  final $Res Function(Exercise) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? equipmentId = freezed,
    Object? preinstalled = freezed,
    Object? bars = freezed,
    Object? loadId = freezed,
    Object? limbs = freezed,
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
      equipmentId: equipmentId == freezed
          ? _value.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      preinstalled: preinstalled == freezed
          ? _value.preinstalled
          : preinstalled // ignore: cast_nullable_to_non_nullable
              as int?,
      bars: bars == freezed
          ? _value.bars
          : bars // ignore: cast_nullable_to_non_nullable
              as int?,
      loadId: loadId == freezed
          ? _value.loadId
          : loadId // ignore: cast_nullable_to_non_nullable
              as int?,
      limbs: limbs == freezed
          ? _value.limbs
          : limbs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ExerciseCopyWith<$Res> implements $ExerciseCopyWith<$Res> {
  factory _$$_ExerciseCopyWith(
          _$_Exercise value, $Res Function(_$_Exercise) then) =
      __$$_ExerciseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? description,
      int? equipmentId,
      int? preinstalled,
      int? bars,
      int? loadId,
      int? limbs});
}

/// @nodoc
class __$$_ExerciseCopyWithImpl<$Res> extends _$ExerciseCopyWithImpl<$Res>
    implements _$$_ExerciseCopyWith<$Res> {
  __$$_ExerciseCopyWithImpl(
      _$_Exercise _value, $Res Function(_$_Exercise) _then)
      : super(_value, (v) => _then(v as _$_Exercise));

  @override
  _$_Exercise get _value => super._value as _$_Exercise;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? equipmentId = freezed,
    Object? preinstalled = freezed,
    Object? bars = freezed,
    Object? loadId = freezed,
    Object? limbs = freezed,
  }) {
    return _then(_$_Exercise(
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
      equipmentId: equipmentId == freezed
          ? _value.equipmentId
          : equipmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      preinstalled: preinstalled == freezed
          ? _value.preinstalled
          : preinstalled // ignore: cast_nullable_to_non_nullable
              as int?,
      bars: bars == freezed
          ? _value.bars
          : bars // ignore: cast_nullable_to_non_nullable
              as int?,
      loadId: loadId == freezed
          ? _value.loadId
          : loadId // ignore: cast_nullable_to_non_nullable
              as int?,
      limbs: limbs == freezed
          ? _value.limbs
          : limbs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Exercise implements _Exercise {
  const _$_Exercise(
      {this.id,
      required this.name,
      this.description,
      required this.equipmentId,
      this.preinstalled,
      required this.bars,
      required this.loadId,
      required this.limbs});

  factory _$_Exercise.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final int? equipmentId;
  @override
  final int? preinstalled;
  @override
  final int? bars;
  @override
  final int? loadId;
  @override
  final int? limbs;

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, description: $description, equipmentId: $equipmentId, preinstalled: $preinstalled, bars: $bars, loadId: $loadId, limbs: $limbs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Exercise &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.equipmentId, equipmentId) &&
            const DeepCollectionEquality()
                .equals(other.preinstalled, preinstalled) &&
            const DeepCollectionEquality().equals(other.bars, bars) &&
            const DeepCollectionEquality().equals(other.loadId, loadId) &&
            const DeepCollectionEquality().equals(other.limbs, limbs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(equipmentId),
      const DeepCollectionEquality().hash(preinstalled),
      const DeepCollectionEquality().hash(bars),
      const DeepCollectionEquality().hash(loadId),
      const DeepCollectionEquality().hash(limbs));

  @JsonKey(ignore: true)
  @override
  _$$_ExerciseCopyWith<_$_Exercise> get copyWith =>
      __$$_ExerciseCopyWithImpl<_$_Exercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExerciseToJson(
      this,
    );
  }
}

abstract class _Exercise implements Exercise {
  const factory _Exercise(
      {final int? id,
      required final String? name,
      final String? description,
      required final int? equipmentId,
      final int? preinstalled,
      required final int? bars,
      required final int? loadId,
      required final int? limbs}) = _$_Exercise;

  factory _Exercise.fromJson(Map<String, dynamic> json) = _$_Exercise.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  int? get equipmentId;
  @override
  int? get preinstalled;
  @override
  int? get bars;
  @override
  int? get loadId;
  @override
  int? get limbs;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseCopyWith<_$_Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}
