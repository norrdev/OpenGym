import 'package:equatable/equatable.dart';

class WorkoutSet extends Equatable {
  final int repeats;
  final double weight;

  const WorkoutSet({
    required this.repeats,
    required this.weight,
  });

  @override
  List<Object?> get props => [
        repeats,
        weight,
      ];

  WorkoutSet copyWith({
    int? repeats,
    double? weight,
  }) {
    return WorkoutSet(
      repeats: repeats ?? this.repeats,
      weight: weight ?? this.weight,
    );
  }
}
