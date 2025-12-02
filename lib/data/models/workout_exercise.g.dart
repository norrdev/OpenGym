// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutExerciseImpl _$$WorkoutExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkoutExerciseImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      maxSets: (json['maxSets'] as num).toInt(),
      restTime: (json['restTime'] as num).toInt(),
      sets: (json['sets'] as List<dynamic>)
          .map((e) => WorkoutSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      completed: json['completed'] as bool,
      limbs: (json['limbs'] as num).toInt(),
      loadId: (json['loadId'] as num).toInt(),
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
