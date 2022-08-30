// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutSet _$$_WorkoutSetFromJson(Map<String, dynamic> json) =>
    _$_WorkoutSet(
      repeats: json['repeats'] as int?,
      repeatsLeft: json['repeatsLeft'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      weightLeft: (json['weightLeft'] as num?)?.toDouble(),
      timeLoad: json['timeLoad'] as int?,
      rest: json['rest'] as int?,
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_WorkoutSetToJson(_$_WorkoutSet instance) =>
    <String, dynamic>{
      'repeats': instance.repeats,
      'repeatsLeft': instance.repeatsLeft,
      'weight': instance.weight,
      'weightLeft': instance.weightLeft,
      'timeLoad': instance.timeLoad,
      'rest': instance.rest,
      'distance': instance.distance,
    };
