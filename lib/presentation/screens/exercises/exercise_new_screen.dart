import 'package:flutter/material.dart' hide RadioGroup;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';

import '../../widgets/widgets.dart';

class ExerciseNewScreen extends StatefulWidget {
  final int muscleId;

  const ExerciseNewScreen({super.key, required this.muscleId});

  @override
  State<ExerciseNewScreen> createState() => _ExerciseNewScreenState();
}

class _ExerciseNewScreenState extends State<ExerciseNewScreen> {
  TextEditingController tcName = TextEditingController(text: '');
  TextEditingController tcDesc = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  int limbs = 1;
  int equipment = 1;
  int loadId = 1;

  @override
  Widget build(BuildContext context) {
    final repository =
        RepositoryProvider.of<Repository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageAddEx),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Exercise newExe = Exercise(
                  name: tcName.text,
                  description: tcDesc.text,
                  equipmentId: equipment,
                  limbs: limbs,
                  loadId: loadId,
                );
                repository.insertExercise(widget.muscleId, newExe);
                Navigator.pop(context);
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
                        initialValue: loadId,
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
                          setState(() {
                            loadId = value ?? 1;
                          });
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
                        initialValue: equipment,
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
                          setState(() {
                            equipment = value ?? 1;
                          });
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
