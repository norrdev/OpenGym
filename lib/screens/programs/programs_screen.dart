import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/programs/program_days_screen.dart';
import 'package:npng/screens/programs/program_edit_screen.dart';
import 'package:npng/screens/programs/program_new_screen.dart';
import 'package:npng/state/default_program_state.dart';
import 'package:npng/theme.dart';

import 'package:provider/provider.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({super.key});
  static String id = '/programs';

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  @override
  Widget build(BuildContext context) {
    final repository = context.watch<Repository>();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageProgramsTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProgramNewScreen(),
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<Program>>(
        stream: repository.watchAllPrograms(),
        builder: (context, AsyncSnapshot<List<Program>> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final programs = snapshot.data ?? [];
            return ListView.builder(
                itemCount: programs.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = programs[index];
                  return Slidable(
                    key: ValueKey(item),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProgramEditScreen(
                                  program: item,
                                );
                              },
                            ),
                          ).whenComplete(() => setState(() {})),
                          backgroundColor: kActionColorEdit,
                          foregroundColor: kActionColorIcon,
                          icon: Icons.edit,
                          label: S.of(context).edit,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Radio<int>(
                        value: item.id as int,
                        groupValue:
                            context.watch<DefaultProgramState>().defaultProgram,
                        onChanged: (_) {
                          repository
                              .setCurrentProgram(item.id as int)
                              .then((_) {
                            context.read<DefaultProgramState>().defaultProgram =
                                item.id as int;
                          });
                        },
                      ),
                      title: Text(item.name as String),
                      subtitle: Text(item.description as String),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgramDaysScreen(
                            program: item,
                          ),
                        ),
                      ),
                    ),
                  );
                });
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
