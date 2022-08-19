// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'load.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Load _$LoadFromJson(Map<String, dynamic> json) {
  return _Load.fromJson(json);
}

/// @nodoc
mixin _$Load {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get preinstalled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadCopyWith<Load> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadCopyWith<$Res> {
  factory $LoadCopyWith(Load value, $Res Function(Load) then) =
      _$LoadCopyWithImpl<$Res>;
  $Res call({int? id, String? name, int? preinstalled});
}

/// @nodoc
class _$LoadCopyWithImpl<$Res> implements $LoadCopyWith<$Res> {
  _$LoadCopyWithImpl(this._value, this._then);

  final Load _value;
  // ignore: unused_field
  final $Res Function(Load) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? preinstalled = freezed,
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
      preinstalled: preinstalled == freezed
          ? _value.preinstalled
          : preinstalled // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_LoadCopyWith<$Res> implements $LoadCopyWith<$Res> {
  factory _$$_LoadCopyWith(_$_Load value, $Res Function(_$_Load) then) =
      __$$_LoadCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, int? preinstalled});
}

/// @nodoc
class __$$_LoadCopyWithImpl<$Res> extends _$LoadCopyWithImpl<$Res>
    implements _$$_LoadCopyWith<$Res> {
  __$$_LoadCopyWithImpl(_$_Load _value, $Res Function(_$_Load) _then)
      : super(_value, (v) => _then(v as _$_Load));

  @override
  _$_Load get _value => super._value as _$_Load;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? preinstalled = freezed,
  }) {
    return _then(_$_Load(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      preinstalled: preinstalled == freezed
          ? _value.preinstalled
          : preinstalled // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Load implements _Load {
  const _$_Load({this.id, required this.name, this.preinstalled});

  factory _$_Load.fromJson(Map<String, dynamic> json) => _$$_LoadFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? preinstalled;

  @override
  String toString() {
    return 'Load(id: $id, name: $name, preinstalled: $preinstalled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Load &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.preinstalled, preinstalled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(preinstalled));

  @JsonKey(ignore: true)
  @override
  _$$_LoadCopyWith<_$_Load> get copyWith =>
      __$$_LoadCopyWithImpl<_$_Load>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoadToJson(
      this,
    );
  }
}

abstract class _Load implements Load {
  const factory _Load(
      {final int? id,
      required final String? name,
      final int? preinstalled}) = _$_Load;

  factory _Load.fromJson(Map<String, dynamic> json) = _$_Load.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get preinstalled;
  @override
  @JsonKey(ignore: true)
  _$$_LoadCopyWith<_$_Load> get copyWith => throw _privateConstructorUsedError;
}
