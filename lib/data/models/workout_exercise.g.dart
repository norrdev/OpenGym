// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutExercise _$$_WorkoutExerciseFromJson(Map<String, dynamic> json) =>
    _$_WorkoutExercise(
      id: json['id'] as int,
      name: json['name'] as String,
      maxSets: json['maxSets'] as int,
      restTime: json['restTime'] as int,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$_WorkoutExerciseToJson(_$_WorkoutExercise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxSets': instance.maxSets,
      'restTime': instance.restTime,
      'sets': instance.sets,
      'completed': instance.completed,
    };
