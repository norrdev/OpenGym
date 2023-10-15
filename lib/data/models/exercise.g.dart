// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseImpl _$$ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      equipmentId: json['equipmentId'] as int?,
      preinstalled: json['preinstalled'] as int?,
      loadId: json['loadId'] as int?,
      limbs: json['limbs'] as int?,
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
