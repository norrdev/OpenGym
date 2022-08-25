// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$MuscleCopyWithImpl<$Res>;
  $Res call({int? id, String? name, @Uint8ListConverter() Uint8List? icon});
}

/// @nodoc
class _$MuscleCopyWithImpl<$Res> implements $MuscleCopyWith<$Res> {
  _$MuscleCopyWithImpl(this._value, this._then);

  final Muscle _value;
  // ignore: unused_field
  final $Res Function(Muscle) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
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
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
abstract class _$$_MuscleCopyWith<$Res> implements $MuscleCopyWith<$Res> {
  factory _$$_MuscleCopyWith(_$_Muscle value, $Res Function(_$_Muscle) then) =
      __$$_MuscleCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, @Uint8ListConverter() Uint8List? icon});
}

/// @nodoc
class __$$_MuscleCopyWithImpl<$Res> extends _$MuscleCopyWithImpl<$Res>
    implements _$$_MuscleCopyWith<$Res> {
  __$$_MuscleCopyWithImpl(_$_Muscle _value, $Res Function(_$_Muscle) _then)
      : super(_value, (v) => _then(v as _$_Muscle));

  @override
  _$_Muscle get _value => super._value as _$_Muscle;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$_Muscle(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Muscle implements _Muscle {
  const _$_Muscle(
      {this.id, required this.name, @Uint8ListConverter() this.icon});

  factory _$_Muscle.fromJson(Map<String, dynamic> json) =>
      _$$_MuscleFromJson(json);

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
            other is _$_Muscle &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  _$$_MuscleCopyWith<_$_Muscle> get copyWith =>
      __$$_MuscleCopyWithImpl<_$_Muscle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MuscleToJson(
      this,
    );
  }
}

abstract class _Muscle implements Muscle {
  const factory _Muscle(
      {final int? id,
      required final String? name,
      @Uint8ListConverter() final Uint8List? icon}) = _$_Muscle;

  factory _Muscle.fromJson(Map<String, dynamic> json) = _$_Muscle.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @Uint8ListConverter()
  Uint8List? get icon;
  @override
  @JsonKey(ignore: true)
  _$$_MuscleCopyWith<_$_Muscle> get copyWith =>
      throw _privateConstructorUsedError;
}
