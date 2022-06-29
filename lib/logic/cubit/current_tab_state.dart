part of 'current_tab_cubit.dart';

abstract class CurrentTabState extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrentTabInitial extends CurrentTabState {}

class CurrentTabLoaded extends CurrentTabState {
  final int selectedIndex;

  CurrentTabLoaded(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class CurrentTabWrong extends CurrentTabState {
  final int selectedIndex = 0;

  @override
  List<Object> get props => [selectedIndex];
}
