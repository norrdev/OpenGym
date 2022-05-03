import 'package:flutter/material.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/models/workout_provider.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_01_process_screen.dart';
import 'package:provider/provider.dart';

class WorkoutStartScreen extends StatefulWidget {
  const WorkoutStartScreen({Key? key}) : super(key: key);

  @override
  _WorkoutStartScreenState createState() => _WorkoutStartScreenState();
}

class _WorkoutStartScreenState extends State<WorkoutStartScreen> {
  @override
  void initState() {
    _selector();
    super.initState();
  }

  void _selector() async {
    int def = await context.read<Repository>().getCurrentProgram();
    Provider.of<WorkoutProvider>(context, listen: false).defaultProgram = def;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    ScrollController _scontroller = ScrollController();
    return SafeArea(
      child: Consumer<WorkoutProvider>(
        builder: (context, workout, child) {
          return StreamBuilder<List<Day>>(
            stream: repository.findDaysByProgram(workout.defaultProgram),
            builder: (context, AsyncSnapshot<List<Day>> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // Because must be mutable for sorting
                final List<Day> days =
                    (snapshot.hasData) ? [...snapshot.data!] : [];

                if (days.isEmpty) {
                  return Center(child: Text(S.of(context).selectProgram));
                }

                return ListView.builder(
                  controller: _scontroller,
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    final item = days[index];
                    return ListTile(
                      title: Text(item.name as String),
                      subtitle: Text(item.description as String),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutProcessScreen(
                            day: item,
                          ),
                        ),
                      ).then((value) => setState(() {})),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
