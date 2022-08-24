// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Workout _$$_WorkoutFromJson(Map<String, dynamic> json) => _$_Workout(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      ord: json['ord'] as int?,
      sets: json['sets'] as int?,
      repeats: json['repeats'] as int?,
      rest: json['rest'] as int?,
      exercisesId: json['exercisesId'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_WorkoutToJson(_$_Workout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ord': instance.ord,
      'sets': instance.sets,
      'repeats': instance.repeats,
      'rest': instance.rest,
      'exercisesId': instance.exercisesId,
      'weight': instance.weight,
    };
