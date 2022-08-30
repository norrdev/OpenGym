import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../data/models/models.dart';
import '../../../data/repository.dart';
import '../../../generated/l10n.dart';

class ExerciseViewScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseViewScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name.toString()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              LoadViewWidget(repository: repository, exercise: exercise),
              EquipmentViewWidget(exercise: exercise),
              const SizedBox(height: 16.0),
              if (exercise.preinstalled == 1)
                Text('${S.of(context).preinstalledEx}.'),
              const SizedBox(height: 16.0),
              Text(exercise.description ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}

class EquipmentViewWidget extends StatelessWidget {
  const EquipmentViewWidget({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return (exercise.limbs == 1)
        ? ListTile(
            leading: ColorFiltered(
              colorFilter: kGrayscaleColorFilter,
              child: Image.asset('assets/icons/icons8-deadlift-96.png'),
            ),
            title: Text(S.of(context).twoLimbsWorksTogether),
          )
        : ListTile(
            leading: ColorFiltered(
              colorFilter: kGrayscaleColorFilter,
              child:
                  Image.asset('assets/icons/icons8-workout-skin-type-2-96.png'),
            ),
            title: Text(S.of(context).limbsWorkAlt),
          );
  }
}

class LoadViewWidget extends StatelessWidget {
  const LoadViewWidget({
    super.key,
    required this.repository,
    required this.exercise,
  });

  final Repository repository;
  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Load>(
      future: repository.findLoadById(exercise.loadId ?? 0),
      builder: (context, AsyncSnapshot<Load> snapshot) {
        if (snapshot.hasData) {
          return ListTile(
            leading: ColorFiltered(
              colorFilter: kGrayscaleColorFilter,
              child: Image.asset('assets/icons/icons8-loading-bar-96.png'),
            ),
            title: Text(snapshot.data!.name ?? ''),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
