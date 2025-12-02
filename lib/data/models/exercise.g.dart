// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      equipmentId: (json['equipmentId'] as num?)?.toInt(),
      preinstalled: (json['preinstalled'] as num?)?.toInt(),
      loadId: (json['loadId'] as num?)?.toInt(),
      limbs: (json['limbs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ExerciseImplToJson(_$ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'equipmentId': instance.equipmentId,
      'preinstalled': instance.preinstalled,
      'loadId': instance.loadId,
      'limbs': instance.limbs,
    };
