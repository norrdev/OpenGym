import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/screens.dart';
import '../../generated/l10n.dart';
import '../../logic/cubit/current_tab_cubit.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/icon/icon-alfa.png'),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center_rounded),
            title: Text(S.of(context).pageWorkout),
            onTap: () {
              context.read<CurrentTabCubit>().saveCurrentIndex(kScreenWorkout);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_gymnastics),
            title: Text(S.of(context).pageExerciseTitle),
            onTap: () {
              context
                  .read<CurrentTabCubit>()
                  .saveCurrentIndex(kScreenExersises);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_rounded),
            title: Text(S.of(context).log),
            onTap: () {
              context.read<CurrentTabCubit>().saveCurrentIndex(kScreenLog);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.gas_meter_rounded),
            title: Text(S.of(context).calculate),
            onTap: () {
              context.read<CurrentTabCubit>().saveCurrentIndex(kScreenCalc);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: Text(S.of(context).settings),
            onTap: () {
              context.read<CurrentTabCubit>().saveCurrentIndex(kScreenSettings);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
