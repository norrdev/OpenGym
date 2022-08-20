// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Exercise _$$_ExerciseFromJson(Map<String, dynamic> json) => _$_Exercise(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      equipmentId: json['equipmentId'] as int?,
      preinstalled: json['preinstalled'] as int?,
      bars: json['bars'] as int?,
      loadId: json['loadId'] as int?,
      limbs: json['limbs'] as int?,
    );

Map<String, dynamic> _$$_ExerciseToJson(_$_Exercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'equipmentId': instance.equipmentId,
      'preinstalled': instance.preinstalled,
      'bars': instance.bars,
      'loadId': instance.loadId,
      'limbs': instance.limbs,
    };
