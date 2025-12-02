// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogWorkoutImpl _$$LogWorkoutImplFromJson(Map<String, dynamic> json) =>
    _$LogWorkoutImpl(
      id: (json['id'] as num?)?.toInt(),
      repeats: (json['repeats'] as num?)?.toInt(),
      repeatsLeft: (json['repeatsLeft'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      weightLeft: (json['weightLeft'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      timeLoad: (json['timeLoad'] as num?)?.toInt(),
      name: json['name'] as String?,
      loadId: (json['loadId'] as num?)?.toInt(),
      limbs: (json['limbs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LogWorkoutImplToJson(_$LogWorkoutImpl instance) =>
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
