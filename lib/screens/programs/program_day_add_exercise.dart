import 'package:flutter/material.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';

/// Add exercise to workout day screen.
/// [day]: day to add
class ProgramDayAddExercise extends StatefulWidget {
  const ProgramDayAddExercise({Key? key, required this.day}) : super(key: key);
  final Day day;

  @override
  _ProgramDayAddExerciseState createState() => _ProgramDayAddExerciseState();
}

class _ProgramDayAddExerciseState extends State<ProgramDayAddExercise> {
  int selectedMuscle = -1;
  List<bool> selectedEx = [];

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageAddEx),
      ),
      body: SafeArea(
        child: Column(
          //scrollDirection: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: StreamBuilder<List<Muscle>>(
                stream: repository.watchAllMuscles(),
                builder: (context, AsyncSnapshot<List<Muscle>> snapshot) {
                  //if (snapshot.connectionState == ConnectionState.active) {
                  final List<Muscle> muscles =
                      snapshot.hasData ? [...snapshot.data!] : [];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 4.0,
                      runSpacing: 4.0,
                      children:
                          List<Widget>.generate(muscles.length, (int index) {
                        final item = muscles[index];
                        return ChoiceChip(
                          selected: (index == selectedMuscle) ? true : false,
                          label: Text(item.name as String),
                          onSelected: (bool selected) {
                            selectedMuscle = index;
                            setState(() {});
                          },
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              flex: 2,
              child: StreamBuilder(
                stream: repository.findExcersisesByMuscle(selectedMuscle),
                builder: (context, AsyncSnapshot<List<Exercise>> snapshotEx) {
                  final List<Exercise> exercises =
                      (snapshotEx.hasData) ? [...snapshotEx.data!] : [];
                  selectedEx = List<bool>.filled(exercises.length, false);
                  return ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final Exercise item = exercises[index];
                      return ListTile(
                        title: Text(item.name as String),
                        trailing: IconButton(
                          icon: const Icon(Icons.add_circle),
                          onPressed: () {
                            repository.insertWorkout(
                                widget.day.id as int, item.id as int);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(S.of(context).addEx),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
