// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogWorkout _$$_LogWorkoutFromJson(Map<String, dynamic> json) =>
    _$_LogWorkout(
      id: json['id'] as int?,
      repeats: json['repeats'] as int?,
      repeatsLeft: json['repeatsLeft'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      weightLeft: (json['weightLeft'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      timeLoad: json['timeLoad'] as int?,
      name: json['name'] as String?,
      loadId: json['loadId'] as int?,
      limbs: json['limbs'] as int?,
    );

Map<String, dynamic> _$$_LogWorkoutToJson(_$_LogWorkout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repeats': instance.repeats,
      'repeatsLeft': instance.repeatsLeft,
      'weight': instance.weight,
      'weightLeft': instance.weightLeft,
      'distance': instance.distance,
      'timeLoad': instance.timeLoad,
      'name': instance.name,
      'loadId': instance.loadId,
      'limbs': instance.limbs,
    };
