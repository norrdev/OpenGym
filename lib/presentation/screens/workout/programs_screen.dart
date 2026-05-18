import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/presentation/screens/workout/program_new_screen.dart';
import 'package:npng/presentation/widgets/help_icon_button.dart';

import '../../../data/models/models.dart';
import '../../../generated/l10n.dart';
import '../../../logic/providers/app_providers.dart';
import '../../../theme.dart';
import 'program_edit_screen.dart';

class ProgramsScreen extends ConsumerStatefulWidget {
  const ProgramsScreen({super.key});
  static String id = '/programs';

  @override
  ConsumerState<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends ConsumerState<ProgramsScreen> {
  @override
  Widget build(BuildContext context) {
    final repository = ref.watch(repositoryProvider);

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
                  final programId = item.id;
                  return Slidable(
                    key: ValueKey(item),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            if (programId == null) return;
                            repository.deleteProgram(programId).then((value) {
                              if (value == false) {
                                SnackBar snackBar = SnackBar(
                                  content: Text(S.of(context).canNotDelProgram),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                          },
                          backgroundColor: kActionColorDelete,
                          foregroundColor: kActionColorIcon,
                          icon: Icons.delete,
                          label: S.of(context).delete,
                        ),
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
                      leading: Consumer(builder: (context, ref, _) {
                        final defaultProgram = ref.watch(defaultProgramProvider);
                        if (programId == null) {
                          return const SizedBox.shrink();
                        }
                        return Radio<int>(
                          value: programId,
                          groupValue: defaultProgram,
                          onChanged: (_) {
                            repository.setCurrentProgramId(programId).then((_) {
                              ref
                                  .read(defaultProgramProvider.notifier)
                                  .setDefaultProgram(programId);
                            });
                          },
                        );
                      }),
                      title: Text(item.name ?? ''),
                      subtitle: Text(item.description ?? ''),
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
