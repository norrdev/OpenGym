import 'package:flutter/material.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';

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
  int limb = 1;
  int equipment = 1;
  int load = 1;
  int bars = 1;

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
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
                  bars: bars,
                  equipmentId: equipment,
                  limbs: limb,
                  loadId: load,
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
                        value: load,
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
                            load = value ?? 1;
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
                Row(
                  children: [
                    Radio<int>(
                        value: 1,
                        groupValue: bars,
                        onChanged: (int? value) {
                          setState(() {
                            bars = value ?? 1;
                          });
                        }),
                    const Flexible(
                        // TODO Move to localizarion file
                        child: Text('Один гриф или нет грифа')),
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                        value: 2,
                        groupValue: bars,
                        onChanged: (int? value) {
                          setState(() {
                            bars = value ?? 2;
                          });
                        }),
                    const Flexible(
                        // TODO Move to localizarion file
                        child: Text('Два грифа')),
                  ],
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
                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: limb,
                        onChanged: (int? value) {
                          setState(() {
                            limb = value!;
                          });
                        }),
                    const Flexible(
                      // TODO Move to localizarion file
                      child: Text(
                        'Обе конечности работают одновременно или работает одна мышечная группа',
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                Row(
                  children: [
                    Radio(
                        value: 2,
                        groupValue: limb,
                        onChanged: (int? value) {
                          setState(() {
                            limb = value!;
                          });
                        }),
                    const Flexible(
                        // TODO Move to localizarion file
                        child: Text('Конечности работают попеременно')),
                  ],
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
