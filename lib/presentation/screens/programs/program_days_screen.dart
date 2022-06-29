import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/presentation/screens/programs/program_day_screen.dart';
import 'package:npng/presentation/screens/programs/program_edit_day_screen.dart';
import 'package:npng/presentation/screens/programs/program_new_day_screen.dart';
import 'package:npng/theme.dart';

class ProgramDaysScreen extends StatefulWidget {
  static String id = 'program-days';
  final Program program;
  const ProgramDaysScreen({super.key, required this.program});

  @override
  State<ProgramDaysScreen> createState() => _ProgramDaysScreenState();
}

class _ProgramDaysScreenState extends State<ProgramDaysScreen> {
  @override
  Widget build(BuildContext context) {
    final repository = context.read<Repository>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.program.name as String),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProgramNewDayScreen(
                  programId: widget.program.id as int,
                ),
              ),
            ).whenComplete(() => setState(() {})),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Day>>(
          stream: repository.findDaysByProgram(widget.program.id as int),
          builder: (context, AsyncSnapshot<List<Day>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Because must be mutable for sorting
              final List<Day> days =
                  (snapshot.hasData) ? [...snapshot.data!] : [];
              return ReorderableListView.builder(
                itemCount: days.length,
                onReorder: (int oldIndex, int newIndex) {
                  if (newIndex > oldIndex) newIndex -= 1;
                  final Day movedDay = days.removeAt(oldIndex);
                  days.insert(newIndex, movedDay);
                  repository.reorderDays(days);
                },
                itemBuilder: (context, index) {
                  final item = days[index];
                  return Slidable(
                    key: ValueKey(item),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProgramEditDayScreen(
                                day: item,
                              ),
                            ),
                          ).whenComplete(() {
                            setState(() {});
                          }),
                          backgroundColor: kActionColorEdit,
                          foregroundColor: kActionColorIcon,
                          icon: Icons.edit,
                          label: S.of(context).edit,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(item.name as String),
                      subtitle: Text(item.description as String),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProgramDayScreen(day: item))),
                    ),
                  );
                },
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
