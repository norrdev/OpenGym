// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutSet _$$_WorkoutSetFromJson(Map<String, dynamic> json) =>
    _$_WorkoutSet(
      repeats: json['repeats'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_WorkoutSetToJson(_$_WorkoutSet instance) =>
    <String, dynamic>{
      'repeats': instance.repeats,
      'weight': instance.weight,
    };
