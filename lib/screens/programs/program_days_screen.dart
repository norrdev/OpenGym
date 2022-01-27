import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';

class ProgramDaysScreen extends StatelessWidget {
  static String id = 'program-days';
  final Program program;
  const ProgramDaysScreen({Key? key, required this.program}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(program.name as String),
        trailing: MpFlatButton(
          padding: const EdgeInsets.all(8),
          child: Icon(
            (isApple) ? CupertinoIcons.add : Icons.add,
            color: (isApple)
                ? CupertinoTheme.of(context).textTheme.actionTextStyle.color
                : Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () {
            //TODO Add day screen
          },
        ),
      ),
      body: StreamBuilder<List<Day>>(
        stream: repository.findDaysByProgram(program.id as int),
        builder: (context, AsyncSnapshot<List<Day>> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final days = snapshot.data ?? [];
            return Material(
              type: MaterialType.transparency,
              child: ListView.builder(
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final item = days[index];
                  return Slidable(
                    key: ValueKey(item),
                    child: ListTile(
                      title: Text(item.name as String),
                      subtitle: Text(item.description as String),
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
