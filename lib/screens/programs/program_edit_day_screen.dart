import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';

class ProgramEditDayScreen extends StatelessWidget {
  final Day day;

  const ProgramEditDayScreen({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    TextEditingController _tcName = TextEditingController(text: day.name);
    TextEditingController _tcDesc =
        TextEditingController(text: day.description);
    final _formKey = GlobalKey<FormState>();

    return MpScaffold(
      appBar: MpAppBar(
        title: Text(day.name.toString()),
        trailing: MpLinkButton(
          label: S.of(context).save,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Day newDay = Day(
                id: day.id,
                name: _tcName.text,
                description: _tcDesc.text,
              );
              repository.updateDay(newDay);
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                if (isApple)
                  CupertinoTextFormFieldRow(
                    controller: _tcName,
                    placeholder: S.of(context).name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
      ),
    );
  }
}
