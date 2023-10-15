// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'muscle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Muscle _$MuscleFromJson(Map<String, dynamic> json) {
  return _Muscle.fromJson(json);
}

/// @nodoc
mixin _$Muscle {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuscleCopyWith<Muscle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuscleCopyWith<$Res> {
  factory $MuscleCopyWith(Muscle value, $Res Function(Muscle) then) =
      _$MuscleCopyWithImpl<$Res, Muscle>;
  @useResult
  $Res call({int? id, String? name, @Uint8ListConverter() Uint8List? icon});
}

/// @nodoc
class _$MuscleCopyWithImpl<$Res, $Val extends Muscle>
    implements $MuscleCopyWith<$Res> {
  _$MuscleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MuscleImplCopyWith<$Res> implements $MuscleCopyWith<$Res> {
  factory _$$MuscleImplCopyWith(
          _$MuscleImpl value, $Res Function(_$MuscleImpl) then) =
      __$$MuscleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, @Uint8ListConverter() Uint8List? icon});
}

/// @nodoc
class __$$MuscleImplCopyWithImpl<$Res>
    extends _$MuscleCopyWithImpl<$Res, _$MuscleImpl>
    implements _$$MuscleImplCopyWith<$Res> {
  __$$MuscleImplCopyWithImpl(
      _$MuscleImpl _value, $Res Function(_$MuscleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$MuscleImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MuscleImpl implements _Muscle {
  const _$MuscleImpl(
      {this.id, required this.name, @Uint8ListConverter() this.icon});

  factory _$MuscleImpl.fromJson(Map<String, dynamic> json) =>
      _$$MuscleImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @Uint8ListConverter()
  final Uint8List? icon;

  @override
  String toString() {
    return 'Muscle(id: $id, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuscleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MuscleImplCopyWith<_$MuscleImpl> get copyWith =>
      __$$MuscleImplCopyWithImpl<_$MuscleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MuscleImplToJson(
      this,
    );
  }
}

abstract class _Muscle implements Muscle {
  const factory _Muscle(
      {final int? id,
      required final String? name,
      @Uint8ListConverter() final Uint8List? icon}) = _$MuscleImpl;

  factory _Muscle.fromJson(Map<String, dynamic> json) = _$MuscleImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @Uint8ListConverter()
  Uint8List? get icon;
  @override
  @JsonKey(ignore: true)
  _$$MuscleImplCopyWith<_$MuscleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
