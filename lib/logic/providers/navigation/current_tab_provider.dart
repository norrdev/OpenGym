import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentTabProvider = NotifierProvider<CurrentTabNotifier, int>(
  CurrentTabNotifier.new,
);

class CurrentTabNotifier extends Notifier<int> {
  static const String prefSelectedIndexKey = 'selectedIndex';

  @override
  int build() {
    Future(loadCurrentIndex);
    return 0;
  }

  Future<void> loadCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getInt(prefSelectedIndexKey) ?? 0;
  }

  Future<void> saveCurrentIndex(int selectedIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(prefSelectedIndexKey, selectedIndex);
    state = selectedIndex;
  }
}
