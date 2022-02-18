import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/screens/exercises/exercises_screen.dart';
import 'package:npng/screens/log/log_calendar_screen.dart';
import 'package:npng/screens/programs/programs_screen.dart';
import 'package:npng/screens/programs/program_new_screen.dart';
import 'package:npng/screens/workout/workout_00_start_screen.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/settings/setings_screen.dart';
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
    pageList.add(const WorkoutStartScreen());
    pageList.add(const ProgramsScreen());
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
        trailing: (_selectedIndex == 1)
            ? MpFlatButton(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  (isApple) ? CupertinoIcons.add : Icons.add,
                  color: (isApple)
                      ? CupertinoTheme.of(context)
                          .textTheme
                          .actionTextStyle
                          .color
                      : Theme.of(context).secondaryHeaderColor,
                ),
                onPressed: () => Navigator.push(
                  context,
                  mpPageRoute(
                    builder: (context) => const ProgramNewScreen(),
                  ),
                ).then((value) => setState(() {})),
              )
            : null,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pageList,
      ),
    );
  }
}
