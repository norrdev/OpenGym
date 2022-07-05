import 'package:equatable/equatable.dart';

/// Workout in log model.
class LogWorkout extends Equatable {
  final int? id, repeat;
  final double? weight;
  final String? name;

  const LogWorkout({this.id, this.repeat, this.weight, this.name});

  factory LogWorkout.fromJson(Map<String, dynamic> json) => LogWorkout(
        id: json['id'] as int,
        repeat: json['repeat'] as int,
        weight: json['weight'] as double,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'repeat': repeat,
        'weight': weight,
        'name': name,
      };

  @override
  List<Object?> get props => [id, repeat, weight, name];
}
