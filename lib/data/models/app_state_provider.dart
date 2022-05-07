import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for the application state
/// [_selectedIndex] is the index of the current page
class AppStateProvider extends ChangeNotifier {
  static const String prefSelectedIndexKey = 'selectedIndex';
  int _selectedIndex = 0;

  AppStateProvider() {
    loadCurrentIndex().then((value) => _selectedIndex = value);
  }

  int get selectedIndex {
    return _selectedIndex;
  }

  set selectedIndex(int value) {
    _selectedIndex = value;
    saveCurrentIndex(value);
    // TODO: This Notifyes all listeners!
    notifyListeners();
  }

  void notify() {
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

  // Default program.
  int _defaultProgram = -1;

  int get defaultProgram => _defaultProgram;

  set defaultProgram(int defaultProgram) {
    _defaultProgram = defaultProgram;
    notifyListeners();
  }

  bool _isDaysReordered = false;

  bool get isDaysReordered => _isDaysReordered;

  set isDaysReordered(bool isDaysReordered) {
    _isDaysReordered = isDaysReordered;
    notifyListeners();
  }

  void setDaysReorderedFalse() {
    _isDaysReordered = false;
  }
}
