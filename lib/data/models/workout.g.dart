// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      ord: (json['ord'] as num?)?.toInt(),
      sets: (json['sets'] as num?)?.toInt(),
      repeats: (json['repeats'] as num?)?.toInt(),
      repeatsLeft: (json['repeatsLeft'] as num?)?.toInt(),
      rest: (json['rest'] as num?)?.toInt(),
      exerciseId: (json['exerciseId'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      weightLeft: (json['weightLeft'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      timeLoad: (json['timeLoad'] as num?)?.toInt(),
      equipmentId: (json['equipmentId'] as num?)?.toInt(),
      loadId: (json['loadId'] as num?)?.toInt(),
      limbs: (json['limbs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WorkoutImplToJson(_$WorkoutImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ord': instance.ord,
      'sets': instance.sets,
      'repeats': instance.repeats,
      'repeatsLeft': instance.repeatsLeft,
      'rest': instance.rest,
      'exerciseId': instance.exerciseId,
      'weight': instance.weight,
      'weightLeft': instance.weightLeft,
      'distance': instance.distance,
      'timeLoad': instance.timeLoad,
      'equipmentId': instance.equipmentId,
      'loadId': instance.loadId,
      'limbs': instance.limbs,
    };
