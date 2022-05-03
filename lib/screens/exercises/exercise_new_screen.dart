import 'package:flutter/material.dart';
import 'package:npng/data/models/exercise.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';

class ExerciseNewScreen extends StatelessWidget {
  final int muscleId;

  const ExerciseNewScreen({Key? key, required this.muscleId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    TextEditingController _tcName = TextEditingController(text: '');
    TextEditingController _tcDesc = TextEditingController(text: '');
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageAddEx),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Exercise newExe = Exercise(
                  name: _tcName.text,
                  description: _tcDesc.text,
                );
                repository.insertExercise(muscleId, newExe);
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
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _tcName,
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
                TextFormField(
                  controller: _tcDesc,
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
