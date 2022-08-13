import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc.dart';
import '../../../logic/calculators/calc_cooper_vomax.dart';
import '../../../widgets/text_form_fields.dart';

class CooperVomaxScreen extends StatefulWidget {
  const CooperVomaxScreen({super.key});

  @override
  State<CooperVomaxScreen> createState() => _CooperVomaxScreenState();
}

class _CooperVomaxScreenState extends State<CooperVomaxScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcDistanse = TextEditingController(text: '2700');
  TextEditingController tcAge = TextEditingController(text: '42');
  bool isAthlete = false;
  Sex sex = Sex.female;
  bool isUS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).cooperPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).cooperPageDesc),
                const SizedBox(height: 16),
                TextFormFieldInt(
                  tcValue: tcAge,
                  labelText: S.of(context).age,
                  errorText: S.of(context).ageValidation,
                ),
                const SizedBox(height: 16),
                TextFormFieldInt(
                  tcValue: tcDistanse,
                  labelText: S.of(context).cooperDistanse,
                  errorText: S.of(context).cooperDistanseValidation,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Radio(
                      value: Sex.female,
                      groupValue: sex,
                      onChanged: (Sex? value) {
                        setState(() {
                          sex = value!;
                        });
                      },
                    ),
                    Text(S.of(context).female),
                    Radio(
                      value: Sex.male,
                      groupValue: sex,
                      onChanged: (Sex? value) {
                        setState(() {
                          sex = value!;
                        });
                      },
                    ),
                    Text(S.of(context).male),
                  ],
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text(S.of(context).isAthlete),
                  trailing: Switch(
                      value: isAthlete,
                      onChanged: (value) {
                        setState(() {
                          isAthlete = value;
                        });
                      }),
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text(S.of(context).useImperialUS),
                  trailing: Switch(
                      value: isUS,
                      onChanged: (value) {
                        setState(() {
                          isUS = value;
                        });
                      }),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double distanse = double.parse(tcDistanse.text);
                      if (isUS) {
                        distanse = mileToMeter(distanse);
                      }
                      String run = cooperRun(
                        distanse: distanse.toInt(),
                        gender: sex,
                        age: int.parse(tcAge.text),
                        isAthlete: isAthlete,
                        context: context,
                      );
                      String vo =
                          cooperVoMax(distanse: distanse).toStringAsFixed(2);
                      String res = '''
**${S.of(context).cooperMark}:** $run 

**VO2 max =** $vo''';
                      Navigator.pushNamed(context, '/result', arguments: {
                        'header': S.of(context).cooperPageTitle,
                        'text': res,
                      });
                    }
                  },
                  child: Text(S.of(context).calculate),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
