import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc.dart';
import '../../../logic/calculators/calc_rfm.dart';
import '../../../widgets/text_form_fields.dart';

class CalcRfmScreen extends StatefulWidget {
  const CalcRfmScreen({super.key});

  @override
  State<CalcRfmScreen> createState() => _CalcRfmScreenState();
}

class _CalcRfmScreenState extends State<CalcRfmScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcHeight = TextEditingController();
  TextEditingController tcWaistCircumference = TextEditingController();
  Sex sex = Sex.female;
  bool isUS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).rfmPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).rfmPageDescription),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcHeight,
                  labelText: S.of(context).bmiHeight,
                  errorText: S.of(context).bmiHeightValidation,
                ),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcWaistCircumference,
                  labelText: S.of(context).absiWaistCircumference,
                  errorText: S.of(context).absiWaistCircumferenceValidation,
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
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double height = double.parse(tcHeight.text);
                      double waistCircumference =
                          double.parse(tcWaistCircumference.text);

                      if (isUS) {
                        waistCircumference = lbsToKg(waistCircumference);
                        height = inchToCm(height);
                      }
                      double rfm = calcRFM(
                          heightAthleteCm: height,
                          gender: sex,
                          waistCircumferenceCm: waistCircumference);

                      String res = '''
**${S.of(context).rfmPageTitle}**: ${rfm.toStringAsFixed(1)}%

**${S.of(context).bfpCategory}:** ${bodyFat(context: context, persent: rfm, gender: sex)}
'''; //
                      Navigator.pushNamed(context, '/result', arguments: {
                        'header': S.of(context).rfmPageTitle,
                        'text': res,
                      });
                    }
                  },
                  child: Text(S.of(context).calculate),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
