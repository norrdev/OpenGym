import 'package:flutter/material.dart';
import 'package:npng/screens/exercises/excersises_screen.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';

import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/settings/setings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    pageList.add(const Center(
      child: CircularProgressIndicator(),
    )); //pageList.add(const WorkoutStartPage());
    pageList.add(Container()); //pageList.add(const ProgramsPage());
    pageList.add(const ExercisesScreen());
    pageList.add(Container()); //pageList.add(const LogStartPage());
    pageList.add(const SettingsPage());
    getCurrentIndex();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    saveCurrentIndex();
  }

  void saveCurrentIndex() async {
    // 1
    final prefs = await SharedPreferences.getInstance();
    // 2
    prefs.setInt(prefSelectedIndexKey, _selectedIndex);
  }

  void getCurrentIndex() async {
    // 1
    final prefs = await SharedPreferences.getInstance();
    // 2
    if (prefs.containsKey(prefSelectedIndexKey)) {
      // 3
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
      case 1:
        title = S.of(context).pageProgramsTitle;
        break;
      case 2:
        title = S.of(context).pageExerciseTitle;
        break;
      case 3:
        title = S.of(context).log;
        break;
      case 4:
        title = S.of(context).settings;
        break;
      default:
    }
    return MpScaffold(
      bottomNavigationBar: MpBottomNavigationBar(
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
              'assets/icons/icons8-rules-96.png',
              height: 40,
            ),
            label: S.of(context).pageProgramsTitle,
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
        //selectedItemColor: Theme.of(context).colorScheme.primary,
      ),
      appBar: MpAppBar(
        title: Text(title),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pageList,
      ),
    );
  }
}
