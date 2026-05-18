import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../../generated/l10n.dart';
import '../../../logic/providers/app_providers.dart';

class ProgramNewScreen extends StatelessWidget {
  const ProgramNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = readRepository(context);
    TextEditingController tcName = TextEditingController(text: '');
    TextEditingController tcDesc = TextEditingController(text: '');
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).programAdd),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Exercise newProgram = Exercise(
                  name: tcName.text,
                  description: tcDesc.text,
                  equipmentId: null,
                  limbs: null,
                  loadId: null,
                );
                repository.insertProgram(newProgram);
                Navigator.pop(context);
              }
            },
          ),
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
