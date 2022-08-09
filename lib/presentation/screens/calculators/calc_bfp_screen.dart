import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc.dart';
import '../../../logic/calculators/calc_bfp.dart';
import '../../../widgets/text_form_fields.dart';

class BfpScreen extends StatefulWidget {
  const BfpScreen({super.key});

  @override
  State<BfpScreen> createState() => _BfpScreenState();
}

class _BfpScreenState extends State<BfpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeight = TextEditingController();
  TextEditingController tcHeight = TextEditingController();
  TextEditingController tcAge = TextEditingController();
  Sex sex = Sex.female;
  bool isUS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).bfpPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormFieldDouble(
                  tcWeight: tcWeight,
                  labelText: S.of(context).bmiWeight,
                  errorText: S.of(context).bmiWeightValidation,
                ),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcWeight: tcHeight,
                  labelText: S.of(context).bmiHeight,
                  errorText: S.of(context).bmiHeightValidation,
                ),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcWeight: tcAge,
                  labelText: S.of(context).age,
                  errorText: S.of(context).ageValidation,
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
                    double weight = double.parse(tcWeight.text);
                    double height = double.parse(tcHeight.text);

                    int age = int.parse(tcAge.text);

                    if (isUS) {
                      weight = lbsToKg(weight);
                      height = inchToCm(height);
                    }
                    double bfp = calcBFP(
                      weightAthlete: weight,
                      heightAthleteCm: height,
                      gender: sex,
                      age: age,
                    );

                    String res = '''
# ${bfp.toStringAsFixed(2)}%

**${S.of(context).bfpCategory}:** ${bodyFat(context: context, persent: bfp, gender: sex)}
''';
                    Navigator.pushNamed(context, '/result', arguments: {
                      'header': S.of(context).bfpPageTitle,
                      'text': res,
                    });
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
