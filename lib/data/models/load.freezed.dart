// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Load _$LoadFromJson(Map<String, dynamic> json) {
  return _Load.fromJson(json);
}

/// @nodoc
mixin _$Load {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get preinstalled => throw _privateConstructorUsedError;

  /// Serializes this Load to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoadCopyWith<Load> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadCopyWith<$Res> {
  factory $LoadCopyWith(Load value, $Res Function(Load) then) =
      _$LoadCopyWithImpl<$Res, Load>;
  @useResult
  $Res call({int? id, String? name, int? preinstalled});
}

/// @nodoc
class _$LoadCopyWithImpl<$Res, $Val extends Load>
    implements $LoadCopyWith<$Res> {
  _$LoadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? preinstalled = freezed,
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
      preinstalled: freezed == preinstalled
          ? _value.preinstalled
          : preinstalled // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> implements $LoadCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, int? preinstalled});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$LoadCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? preinstalled = freezed,
  }) {
    return _then(_$LoadImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      preinstalled: freezed == preinstalled
          ? _value.preinstalled
          : preinstalled // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoadImpl implements _Load {
  const _$LoadImpl({this.id, required this.name, this.preinstalled});

  factory _$LoadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoadImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.preinstalled, preinstalled) ||
                other.preinstalled == preinstalled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, preinstalled);

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadImplToJson(
      this,
    );
  }
}

abstract class _Load implements Load {
  const factory _Load(
      {final int? id,
      required final String? name,
      final int? preinstalled}) = _$LoadImpl;

  factory _Load.fromJson(Map<String, dynamic> json) = _$LoadImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get preinstalled;

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
