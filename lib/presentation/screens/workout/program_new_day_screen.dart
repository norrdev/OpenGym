import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
import '../../../data/repository.dart';
import '../../../generated/l10n.dart';

class ProgramNewDayScreen extends StatelessWidget {
  final int programId;
  const ProgramNewDayScreen({super.key, required this.programId});

  @override
  Widget build(BuildContext context) {
    final repository =
        RepositoryProvider.of<Repository>(context, listen: false);
    TextEditingController tcName = TextEditingController(text: '');
    TextEditingController tcDesc = TextEditingController(text: '');
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).dayAdd),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Day newDay = Day(
                  name: tcName.text,
                  description: tcDesc.text,
                );
                repository.insertDay(programId, newDay);
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
