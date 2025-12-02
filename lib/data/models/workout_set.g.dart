// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutSetImpl _$$WorkoutSetImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutSetImpl(
      repeats: (json['repeats'] as num?)?.toInt(),
      repeatsLeft: (json['repeatsLeft'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      weightLeft: (json['weightLeft'] as num?)?.toDouble(),
      timeLoad: (json['timeLoad'] as num?)?.toInt(),
      rest: (json['rest'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WorkoutSetImplToJson(_$WorkoutSetImpl instance) =>
    <String, dynamic>{
      'repeats': instance.repeats,
      'repeatsLeft': instance.repeatsLeft,
      'weight': instance.weight,
      'weightLeft': instance.weightLeft,
      'timeLoad': instance.timeLoad,
      'rest': instance.rest,
      'distance': instance.distance,
    };
