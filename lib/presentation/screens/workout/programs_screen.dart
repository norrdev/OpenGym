import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/presentation/screens/workout/program_new_screen.dart';
import 'package:npng/presentation/widgets/help_icon_button.dart';

import '../../../data/models/models.dart';
import '../../../data/repository.dart';
import '../../../generated/l10n.dart';
import '../../../logic/cubit/default_program_cubit.dart';
import '../../../theme.dart';
import 'program_edit_screen.dart';

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
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ProgramNewScreen();
                },
              ),
            ).whenComplete(() => setState(() {})),
            icon: const Icon(Icons.add),
          ),
          HelpIconButton(help: S.of(context).hintPrograms),
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
                    startActionPane: ActionPane(
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
                      leading:
                          BlocBuilder<DefaultProgramCubit, DefaultProgramState>(
                        builder: (context, state) {
                          return Radio<int>(
                            value: item.id as int,
                            groupValue: state is DefaultProgramLoaded
                                ? state.defaultProgram
                                : null,
                            onChanged: (_) {
                              repository
                                  .setCurrentProgramId(item.id as int)
                                  .then((_) {
                                context
                                    .read<DefaultProgramCubit>()
                                    .setDefaultProgram(item.id as int);
                              });
                            },
                          );
                        },
                      ),
                      title: Text(item.name as String),
                      subtitle: Text(item.description as String),
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
