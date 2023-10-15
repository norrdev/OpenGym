// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutImpl _$$WorkoutImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      ord: json['ord'] as int?,
      sets: json['sets'] as int?,
      repeats: json['repeats'] as int?,
      repeatsLeft: json['repeatsLeft'] as int?,
      rest: json['rest'] as int?,
      exerciseId: json['exerciseId'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      weightLeft: (json['weightLeft'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      timeLoad: json['timeLoad'] as int?,
      equipmentId: json['equipmentId'] as int?,
      loadId: json['loadId'] as int?,
      limbs: json['limbs'] as int?,
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
