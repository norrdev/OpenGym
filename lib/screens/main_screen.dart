import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/exercises/exercises_screen.dart';
import 'package:npng/screens/log/log_calendar_screen.dart';
import 'package:npng/screens/programs/programs_screen.dart';
import 'package:npng/screens/settings/setings_screen.dart';
import 'package:npng/screens/workout/workout_00_start_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pageList = <Widget>[];
  static const String prefSelectedIndexKey = 'selectedIndex';

  @override
  void initState() {
    super.initState();
    pageList.add(const WorkoutStartScreen());
    pageList.add(const ExercisesScreen());
    pageList.add(const LogCalendarScreen());
    pageList.add(const SettingsScreen());
    getCurrentIndex();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    saveCurrentIndex();
  }

  void saveCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefSelectedIndexKey, _selectedIndex);
  }

  void getCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSelectedIndexKey)) {
      setState(() {
        final index = prefs.getInt(prefSelectedIndexKey);
        if (index != null) {
          _selectedIndex = index;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = 'NpNg';
    switch (_selectedIndex) {
      case 0:
        title = S.of(context).pageWorkout;
        break;
      // case 1:
      //   title = S.of(context).pageProgramsTitle;
      //   break;
      case 1:
        title = S.of(context).pageExerciseTitle;
        break;
      case 2:
        title = S.of(context).log;
        break;
      case 3:
        title = S.of(context).settings;
        break;
      default:
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icons8-gym-96.png',
              height: 40,
            ),
            label: S.of(context).pageWorkout,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icons8-deadlift-96.png',
              height: 40,
            ),
            label: S.of(context).pageExerciseTitle,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icons8-calendar-96.png',
              height: 40,
            ),
            label: S.of(context).log,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/icons8-settings-96.png',
              height: 40,
            ),
            label: S.of(context).settings,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          if (_selectedIndex == 0)
            IconButton(
              padding: const EdgeInsets.all(8),
              icon: const Icon(Icons.checklist_rounded),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProgramsScreen(),
                ),
              ).then((value) => setState(() {})),
            )
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pageList,
      ),
    );
  }
}
