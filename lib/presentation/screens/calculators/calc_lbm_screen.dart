import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc.dart';
import '../../../logic/calculators/calc_lbm.dart';
import '../../widgets/text_form_fields.dart';

class CalcLbmScreen extends StatefulWidget {
  const CalcLbmScreen({super.key});

  @override
  State<CalcLbmScreen> createState() => _CalcLbmScreenState();
}

class _CalcLbmScreenState extends State<CalcLbmScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeight = TextEditingController();
  TextEditingController tcHeight = TextEditingController();
  Sex sex = Sex.female;
  bool isUS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).lbmPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).lbmPageDescription),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcWeight,
                  labelText: S.of(context).bmiWeight,
                  errorText: S.of(context).bmiWeightValidation,
                ),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcHeight,
                  labelText: S.of(context).bmiHeight,
                  errorText: S.of(context).bmiHeightValidation,
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
                ElevatedButton(
                  child: Text(S.of(context).calculate),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double weight = double.parse(tcWeight.text);
                      double height = double.parse(tcHeight.text);

                      if (isUS) {
                        weight = lbsToKg(weight);
                        height = inchToCm(height);
                      }

                      double boer = calcLbmBoer(
                        weight: weight,
                        gender: sex,
                        heightCm: height,
                      );

                      double hume = calcLbmBoer(
                        weight: weight,
                        gender: sex,
                        heightCm: height,
                      );

                      if (isUS) {
                        boer = kgToLbs(boer);
                        hume = kgToLbs(hume);
                      }

                      String res = '''
# ${S.of(context).lbmPageDescription}
**${S.of(context).lbmPageTitle} Boer**: ${boer.toStringAsFixed(3)}

**${S.of(context).lbmPageTitle} Hume**: ${hume.toStringAsFixed(3)}
''';
                      Navigator.pushNamed(context, '/result', arguments: {
                        'header': S.of(context).lbmPageTitle,
                        'text': res,
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
