import 'package:equatable/equatable.dart';

/// Workout model (exercise, sets, repeats, rest).
class Workout extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final int? ord;
  final int? sets;
  final int? repeats;
  final int? rest;
  final int? exercisesId;
  final double? weight;

  const Workout({
    this.id,
    this.name,
    this.description,
    this.ord,
    this.sets,
    this.repeats,
    this.rest,
    this.exercisesId,
    this.weight,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      ord: json['ord'] as int,
      sets: json['sets'] as int,
      repeats: json['repeats'] as int,
      rest: json['rest'] as int,
      exercisesId: json['exercises_id'] as int,
      weight: json['weight'] as double,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'ord': ord,
        'sets': sets,
        'repeats': repeats,
        'rest': rest,
        'exercises_id': exercisesId,
        'weight': weight,
      };

  @override
  List<Object?> get props =>
      [id, name, description, ord, sets, repeats, rest, exercisesId, weight];
}
