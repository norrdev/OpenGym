// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MuscleImpl _$$MuscleImplFromJson(Map<String, dynamic> json) => _$MuscleImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: const Uint8ListConverter().fromJson(json['icon'] as List<int>?),
    );

Map<String, dynamic> _$$MuscleImplToJson(_$MuscleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': const Uint8ListConverter().toJson(instance.icon),
    };
