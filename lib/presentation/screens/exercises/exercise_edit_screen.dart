import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../data/models/models.dart';
import '../../../widgets/radio_group.dart';

class ExerciseEditScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseEditScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    TextEditingController tcName = TextEditingController(text: exercise.name);
    TextEditingController tcDesc =
        TextEditingController(text: exercise.description);
    final formKey = GlobalKey<FormState>();
    int? limbs = exercise.limbs;
    int? equipment = exercise.equipmentId;
    int? loadId = exercise.loadId;
    int? preinstalled = exercise.preinstalled;

    if (kDebugMode) {
      print(exercise);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name.toString()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (preinstalled == 1) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(S.of(context).preinstalledEx),
                          content: Text(S.of(context).allowChanges),
                          actions: <Widget>[
                            MaterialButton(
                              child: Text(S.of(context).no),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                            MaterialButton(
                              child: Text(S.of(context).yes),
                              onPressed: () {
                                Exercise newExe = Exercise(
                                  id: exercise.id,
                                  name: tcName.text,
                                  description: tcDesc.text,
                                  equipmentId: equipment,
                                  limbs: limbs,
                                  loadId: loadId,
                                  preinstalled: preinstalled,
                                );
                                repository.updateExercise(newExe);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                } else {
                  Exercise newExe = Exercise(
                    id: exercise.id,
                    name: tcName.text,
                    description: tcDesc.text,
                    equipmentId: equipment,
                    limbs: limbs,
                    loadId: loadId,
                    preinstalled: preinstalled,
                  );
                  repository.updateExercise(newExe);
                  Navigator.pop(context);
                }
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                if (preinstalled == 1)
                  Column(
                    children: [
                      Text(S.of(context).preinstalledEx),
                      const SizedBox(height: 16),
                    ],
                  ),
                TextFormField(
                  controller: tcName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).enterText;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: S.of(context).name,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                StreamBuilder<List<Load>>(
                  stream: repository.watchAllLoad(),
                  builder: (context, AsyncSnapshot<List<Load>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final List<Load> loads = snapshot.data ?? [];
                      return DropdownButtonFormField<int>(
                        value: loadId,
                        decoration: InputDecoration(
                          labelText: S.of(context).loadStr,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(5),
                        items: loads.map((e) {
                          return DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          loadId = value ?? 1;
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                StreamBuilder<List<Equipment>>(
                  stream: repository.watchAllEquipment(),
                  builder: (context, AsyncSnapshot<List<Equipment>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final List<Equipment> equipments = snapshot.data ?? [];
                      return DropdownButtonFormField<int>(
                        value: equipment,
                        decoration: InputDecoration(
                          labelText: S.of(context).equipment,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(5),
                        items: equipments.map((e) {
                          return DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          //setState(() {
                          equipment = value ?? 1;
                          //});
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                RadioGroup(
                  initialValue: limbs,
                  titles: [
                    S.of(context).twoLimbsWorksTogether,
                    S.of(context).limbsWorkAlt
                  ],
                  onChanged: (int value) {
                    limbs = value;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: tcDesc,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: S.of(context).desc,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
