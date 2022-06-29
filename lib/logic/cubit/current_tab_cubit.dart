import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'current_tab_state.dart';

class CurrentTabCubit extends Cubit<CurrentTabState> {
  CurrentTabCubit() : super(CurrentTabInitial()) {
    loadCurrentIndex();
  }

  static const String prefSelectedIndexKey = 'selectedIndex';

  /// Load current index from shared preferences
  loadCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSelectedIndexKey)) {
      int index = prefs.getInt(prefSelectedIndexKey) ?? 0;
      emit(CurrentTabLoaded(index));
    } else {
      emit(CurrentTabWrong());
    }
  }

  /// Save current index to shared preferences
  void saveCurrentIndex(int selectedIndex) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, selectedIndex);
    emit(CurrentTabLoaded(selectedIndex));
  }
}
