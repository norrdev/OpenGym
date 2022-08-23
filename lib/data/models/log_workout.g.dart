// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogWorkout _$$_LogWorkoutFromJson(Map<String, dynamic> json) =>
    _$_LogWorkout(
      id: json['id'] as int?,
      repeat: json['repeat'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_LogWorkoutToJson(_$_LogWorkout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repeat': instance.repeat,
      'weight': instance.weight,
      'name': instance.name,
    };
