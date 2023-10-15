import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:npng/constants/workout.dart';

import '../../data/models/models.dart';
import '../../data/repository.dart';
import '../../generated/l10n.dart';
import 'spin_edit.dart';

class WorkoutExerciseSettings extends StatelessWidget {
  final int index;

  final Map<int, bool> expanded;
  final Workout item;
  final Repository repository;
  const WorkoutExerciseSettings({
    super.key,
    required this.expanded,
    required this.item,
    required this.repository,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(item);
    }
    return ExpansionTile(
      onExpansionChanged: (value) => expanded[index] = value,
      key: Key(index.toString()),
      initiallyExpanded: expanded[index] ?? false,
      tilePadding: const EdgeInsets.only(right: 30.0, left: 16.0),
      title: Text(
        item.name ?? '',
      ),
      iconColor: Theme.of(context).primaryColor,
      collapsedIconColor: Theme.of(context).primaryColor,
      subtitle: Text(
        item.description ?? '', // Colors.grey,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
          child: SpinEditInt(
              label: S.of(context).sets,
              initialValue: item.sets ?? 0,
              onChange: (newValue) {
                repository.updateWorkout(item.copyWith(sets: newValue.toInt()));
              }),
        ),
        if (item.limbs == 1 &&
            item.loadId != kLoadTime &&
            item.loadId != kLoadDistance)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
            child: SpinEditInt(
              label: S.of(context).repeats,
              initialValue: item.repeats ?? 0,
              onChange: (newValue) => repository
                  .updateWorkout(item.copyWith(repeats: newValue.toInt())),
            ),
          ),
        if (item.limbs == 2 &&
            item.loadId != kLoadTime &&
            item.loadId != kLoadDistance)
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                child: SpinEditInt(
                  label: '${S.of(context).repeats} ${S.of(context).left}',
                  initialValue: item.repeatsLeft ?? 0,
                  onChange: (newValue) {
                    repository.updateWorkout(
                        item.copyWith(repeatsLeft: newValue.toInt()));
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                child: SpinEditInt(
                  label: '${S.of(context).repeats} ${S.of(context).right}',
                  initialValue: item.repeats ?? 0,
                  onChange: (newValue) => repository
                      .updateWorkout(item.copyWith(repeats: newValue.toInt())),
                ),
              ),
            ],
          ),
        if (item.limbs == 1 && item.loadId == kLoadWeight)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
            child: SpinEditDouble(
              label: S.of(context).weight,
              initialValue: item.weight ?? 0,
              onChange: (newValue) => repository
                  .updateWorkout(item.copyWith(weight: newValue.toDouble())),
            ),
          ),
        if (item.limbs == 2 && item.loadId == kLoadWeight)
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                child: SpinEditDouble(
                  label: '${S.of(context).weight} ${S.of(context).left}',
                  initialValue: item.weightLeft ?? 0,
                  onChange: (newValue) => repository.updateWorkout(
                      item.copyWith(weightLeft: newValue.toDouble())),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                child: SpinEditDouble(
                  label: '${S.of(context).weight} ${S.of(context).right}',
                  initialValue: item.weight ?? 0,
                  onChange: (newValue) => repository.updateWorkout(
                      item.copyWith(weight: newValue.toDouble())),
                ),
              ),
            ],
          ),
        if (item.loadId == kLoadTime)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
            child: SpinEditInt(
              initialValue: item.timeLoad ?? 0,
              onChange: (val) => repository
                  .updateWorkout(item.copyWith(timeLoad: val.toInt())),
              label: S.of(context).time,
            ),
          ),
        if (item.loadId == 3)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
            child: SpinEditDouble(
              initialValue: item.distance ?? 0,
              onChange: (val) => repository
                  .updateWorkout(item.copyWith(distance: val.toDouble())),
              label: S.of(context).cooperDistanse,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
          child: SpinEditInt(
            label: S.of(context).rest,
            initialValue: item.rest ?? 0,
            onChange: (newValue) =>
                repository.updateWorkout(item.copyWith(rest: newValue.toInt())),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
