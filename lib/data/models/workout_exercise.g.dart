// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutExerciseImpl _$$WorkoutExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutExerciseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      maxSets: json['maxSets'] as int,
      restTime: json['restTime'] as int,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      completed: json['completed'] as bool,
      limbs: json['limbs'] as int,
      loadId: json['loadId'] as int,
    );

Map<String, dynamic> _$$WorkoutExerciseImplToJson(
        _$WorkoutExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxSets': instance.maxSets,
      'restTime': instance.restTime,
      'sets': instance.sets,
      'completed': instance.completed,
      'limbs': instance.limbs,
      'loadId': instance.loadId,
    };
