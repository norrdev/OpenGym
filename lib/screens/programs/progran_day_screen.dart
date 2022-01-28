import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:npng/generated/l10n.dart';

class ProgramDayScreen extends StatefulWidget {
  const ProgramDayScreen({Key? key, required this.day}) : super(key: key);
  final Day day;

  @override
  State<ProgramDayScreen> createState() => _ProgramDayScreenState();
}

class _ProgramDayScreenState extends State<ProgramDayScreen> {
  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(widget.day.name as String),
        trailing: MpFlatButton(
          padding: const EdgeInsets.all(8),
          child: Icon(
            (isApple) ? CupertinoIcons.add : Icons.add,
            color: (isApple)
                ? CupertinoTheme.of(context).textTheme.actionTextStyle.color
                : Theme.of(context).secondaryHeaderColor,
          ),
          // onPressed: () => Navigator.push(
          //   context,
          //   mpPageRoute(
          //     builder: (context) => ProgramNewDayScreen(
          //       programId: widget.program.id as int,
          //     ),
          //   ),
          // ).then((value) => setState(() {})),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<List<Workout>>(
          stream: repository.findWorkoutByDay(widget.day.id as int),
          builder: (context, AsyncSnapshot<List<Workout>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final List<Workout> workouts =
                  (snapshot.hasData) ? [...snapshot.data!] : [];
              return Material(
                type: MaterialType.transparency,
                child: ReorderableListView.builder(
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    final item = workouts[index];
                    // return Card(
                    //   key: ValueKey(item),
                    //   child: ListTile(
                    //     title: Text(item.name as String),
                    //     subtitle: Text(item.description as String),
                    //   ),
                    // );
                    return Card(
                      key: ValueKey(item),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ExpansionTile(
                            tilePadding:
                                const EdgeInsets.only(right: 30.0, left: 16.0),
                            title: Text(item.name as String),
                            subtitle: Text(item.description as String),
                            children: [
                              Column(
                                children: [
                                  Text(S.of(context).sets),
                                  MpChangeIntField(
                                    value: item.sets as int,
                                    decreaseCallback: () => print(index),
                                    increaseCallback: () => print(index),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(S.of(context).repeats),
                                  MpChangeIntField(
                                    value: item.repeats as int,
                                    decreaseCallback: () => print(index),
                                    increaseCallback: () => print(index),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(S.of(context).rest),
                                  MpChangeIntField(
                                    value: item.rest as int,
                                    decreaseCallback: () => print(index),
                                    increaseCallback: () => print(index),
                                  ),
                                ],
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  MpFlatButton(
                                    label: S.of(context).delete,
                                    child: (isApple)
                                        ? const Icon(CupertinoIcons.delete)
                                        : const Icon(Icons.delete),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  onReorder: (int oldIndex, int newIndex) {
                    if (newIndex > oldIndex) newIndex -= 1;
                    final Workout movedWorkout = workouts.removeAt(oldIndex);
                    workouts.insert(newIndex, movedWorkout);
                    repository.reorderWorkouts(workouts);

                    // There is no need to update state here.
                    // repository.reorderDays(days).then((value) {
                    //   setState(() {});
                    // });
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
