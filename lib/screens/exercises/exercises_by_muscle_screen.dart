import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/screens/exercises/exercise_edit_screen.dart';
import 'package:npng/screens/exercises/exercise_new_screen.dart';
import 'package:npng/screens/exercises/exercise_view_screen.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:npng/generated/l10n.dart';

class ExercisesByMuscleScreen extends StatefulWidget {
  static String id = '/exersises-by-muscle';
  final int musclesId;
  final String pageTitle;

  const ExercisesByMuscleScreen(
      {Key? key, required this.musclesId, required this.pageTitle})
      : super(key: key);

  @override
  State<ExercisesByMuscleScreen> createState() =>
      _ExercisesByMuscleScreenState();
}

class _ExercisesByMuscleScreenState extends State<ExercisesByMuscleScreen> {
  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(widget.pageTitle),
        trailing: MpFlatButton(
          padding: const EdgeInsets.all(8),
          child: Icon(
            (isApple) ? CupertinoIcons.add : Icons.add,
            color: (isApple)
                ? CupertinoTheme.of(context).textTheme.actionTextStyle.color
                : Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () => Navigator.push(
            context,
            mpPageRoute(
              builder: (context) => ExerciseNewScreen(
                muscleId: widget.musclesId,
              ),
            ),
          ).then((value) => setState(() {})),
        ),
      ),
      body: StreamBuilder<List<Exercise>>(
        stream: repository.findExcersisesByMuscle(widget.musclesId),
        builder: (context, AsyncSnapshot<List<Exercise>> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final exes = snapshot.data ?? [];
            return Material(
              type: MaterialType.transparency,
              child: ListView.builder(
                itemCount: exes.length,
                itemBuilder: (context, index) {
                  final item = exes[index];
                  return Slidable(
                    key: ValueKey(item),
                    child: ListTile(
                      title: Text(item.name!),
                      onTap: () => Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) {
                            return ExerciseViewScreen(
                              exercise: item,
                            );
                          },
                        ),
                      ),
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => Navigator.push(
                            context,
                            mpPageRoute(
                              builder: (context) {
                                return ExerciseEditScreen(
                                  exercise: item,
                                );
                              },
                            ),
                          ).then((value) {
                            setState(() {});
                          }),
                          backgroundColor: const Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: S.of(context).edit,
                        ),
                        SlidableAction(
                          // An action can be bigger than the others.
                          //flex: 2,
                          onPressed: (context) {
                            repository.deleteExercise(item);
                            setState(() {});
                          },
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: S.of(context).delete,
                        ),
                      ],
                    ),
                  );
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
    );
  }
}

void doNothing(BuildContext context) {}
