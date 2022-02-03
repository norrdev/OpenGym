import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/programs/program_days_screen.dart';
import 'package:npng/screens/programs/program_edit_screen.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({Key? key}) : super(key: key);
  static String id = '/programs';

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    repository.getCurrentProgram().then((value) => _current = value);
    return StreamBuilder<List<Program>>(
      stream: repository.watchAllPrograms(),
      builder: (context, AsyncSnapshot<List<Program>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final programs = snapshot.data ?? [];
          return Material(
            type: MaterialType.transparency,
            child: ListView.builder(
                itemCount: programs.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = programs[index];
                  return Slidable(
                    key: ValueKey(item),
                    child: ListTile(
                      leading: Radio<int>(
                        value: item.id as int,
                        groupValue: _current,
                        onChanged: (value) {
                          repository
                              .setCurrentProgram(item.id as int)
                              .then((value) {
                            setState(() {});
                          });
                        },
                      ),
                      title: Text(item.name as String),
                      subtitle: Text(item.description as String),
                      onTap: () => Navigator.push(
                        context,
                        mpPageRoute(
                            builder: (context) => ProgramDaysScreen(
                                  program: item,
                                )),
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
                                return ProgramEditScreen(
                                  program: item,
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
                        //TODO CASCADE DELETE PROGRAMS AND DAYS AND LOG. OR HIDE PROGRAM

                        // SlidableAction(
                        //   // An action can be bigger than the others.
                        //   //flex: 2,
                        //   onPressed: (context) {
                        //     //repository.deleteExercise(item);
                        //     setState(() {});
                        //   },
                        //   backgroundColor: Colors.redAccent,
                        //   foregroundColor: Colors.white,
                        //   icon: Icons.delete,
                        //   label: S.of(context).delete,
                        // ),
                      ],
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
