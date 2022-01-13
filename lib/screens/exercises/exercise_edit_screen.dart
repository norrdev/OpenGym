import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/excercise.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';

class ExerciseEditScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseEditScreen({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    TextEditingController _tcName = TextEditingController(text: exercise.name);
    TextEditingController _tcDesc =
        TextEditingController(text: exercise.description);

    return MpScaffold(
      appBar: MpAppBar(
        title: Text(exercise.name.toString()),
        trailing: MpLinkButton(
          label: S.of(context).save,
          onPressed: () {
            Exercise newExe = Exercise(
              id: exercise.id,
              name: _tcName.text,
              description: _tcDesc.text,
            );
            repository.updateExercise(newExe);
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              if (isApple)
                CupertinoTextFormFieldRow(
                  controller: _tcName,
                  placeholder: S.of(context).name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).enterText;
                    }
                    return null;
                  },
                ),
              if (isApple)
                CupertinoTextFormFieldRow(
                  controller: _tcDesc,
                  placeholder: S.of(context).desc,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) {
                    return null;
                  },
                ),
              if (!isApple)
                TextFormField(
                  controller: _tcName,
                  validator: (value) {
                    if (value!.isEmpty) {
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
              if (!isApple) const SizedBox(height: 16.0),
              if (!isApple)
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
    );
  }
}
