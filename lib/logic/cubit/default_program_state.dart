part of 'default_program_cubit.dart';

abstract class DefaultProgramState extends Equatable {
  const DefaultProgramState();

  @override
  List<Object> get props => [];
}

class DefaultProgramInitial extends DefaultProgramState {}

class DefaultProgramLoaded extends DefaultProgramState {
  final int defaultProgram;

  const DefaultProgramLoaded(this.defaultProgram);

  @override
  List<Object> get props => [defaultProgram];
}

class DefaultProgramWrong extends DefaultProgramState {
  final int defaultProgram = 0;

  @override
  List<Object> get props => [defaultProgram];
}
