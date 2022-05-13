import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for the application state
/// [_selectedIndex] is the index of the current page
class CurrentTabState extends ChangeNotifier {
  static const String prefSelectedIndexKey = 'selectedIndex';
  int _selectedIndex = 0;

  CurrentTabState() {
    loadCurrentIndex().then((value) => _selectedIndex = value);
  }

  int get selectedIndex {
    return _selectedIndex;
  }

  set selectedIndex(int value) {
    _selectedIndex = value;
    saveCurrentIndex(value);
    notifyListeners();
  }

  /// Load current index from shared preferences
  Future<int> loadCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSelectedIndexKey)) {
      int index = prefs.getInt(prefSelectedIndexKey) ?? 0;
      return index;
    } else {
      return 0;
    }
  }

  /// Save current index to shared preferences
  void saveCurrentIndex(int selectedIndex) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, selectedIndex);
  }
}
