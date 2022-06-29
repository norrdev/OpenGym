import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'default_program_state.dart';

class DefaultProgramCubit extends Cubit<DefaultProgramState> {
  final int defaultProgram;

  DefaultProgramCubit({required this.defaultProgram})
      : super(DefaultProgramInitial()) {
    emit(DefaultProgramLoaded(defaultProgram));
  }

  void setDefaultProgram(int defaultProgram) {
    emit(DefaultProgramLoaded(defaultProgram));
  }
}
