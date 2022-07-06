import 'package:equatable/equatable.dart';

class WorkoutSet extends Equatable {
  int repeats = 0;
  double weight = 0;
  bool completed = false;

  @override
  List<Object?> get props => [
        repeats,
        weight,
        completed,
      ];
}
