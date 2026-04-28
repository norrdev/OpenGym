import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/screens.dart';
import '../../generated/l10n.dart';
import '../../logic/providers/app_providers.dart';

class BurgerMenu extends ConsumerWidget {
  const BurgerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              ref
                  .read(currentTabProvider.notifier)
                  .saveCurrentIndex(kScreenWorkout);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_gymnastics),
            title: Text(S.of(context).pageExerciseTitle),
            onTap: () {
              ref
                  .read(currentTabProvider.notifier)
                  .saveCurrentIndex(kScreenExersises);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month_rounded),
            title: Text(S.of(context).log),
            onTap: () {
              ref
                  .read(currentTabProvider.notifier)
                  .saveCurrentIndex(kScreenLog);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.gas_meter_rounded),
            title: Text(S.of(context).calculate),
            onTap: () {
              ref
                  .read(currentTabProvider.notifier)
                  .saveCurrentIndex(kScreenCalc);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: Text(S.of(context).settings),
            onTap: () {
              ref
                  .read(currentTabProvider.notifier)
                  .saveCurrentIndex(kScreenSettings);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
