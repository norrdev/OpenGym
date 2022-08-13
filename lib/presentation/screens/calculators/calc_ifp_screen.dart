import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc.dart';
import '../../../logic/calculators/calc_ifp.dart';
import '../../../widgets/text_form_fields.dart';

class CalcIfpScreen extends StatefulWidget {
  const CalcIfpScreen({super.key});

  @override
  State<CalcIfpScreen> createState() => _CalcIfpScreenState();
}

class _CalcIfpScreenState extends State<CalcIfpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeightAthlete = TextEditingController();
  TextEditingController tcTotal = TextEditingController();
  Sex sex = Sex.female;
  bool isUS = false;
  Equipment equipment = Equipment.raw;
  Event event = Event.sbd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ifpPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(S.of(context).ifpPageDescription),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcWeightAthlete,
                  labelText: S.of(context).bmiWeight,
                  errorText: S.of(context).bmiWeightValidation,
                ),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcTotal,
                  labelText: S.of(context).ifpTotalWeight,
                  errorText: S.of(context).rmBarebellWeightValidation,
                ),
                const SizedBox(height: 16),
                ListTile(
                  title: Text(S.of(context).useImperialUS),
                  trailing: Switch(
                      value: isUS,
                      onChanged: (value) {
                        setState(() {
                          isUS = value;
                          double total = double.tryParse(tcTotal.text) ?? 0;
                          double bodyweight =
                              double.tryParse(tcWeightAthlete.text) ?? 0;
                          if (isUS) {
                            total = kgToLbs(total);
                            bodyweight = kgToLbs(bodyweight);
                          } else {
                            total = lbsToKg(total);
                            bodyweight = lbsToKg(bodyweight);
                          }
                          tcTotal.text = total.toStringAsFixed(3);
                          tcWeightAthlete.text = bodyweight.toStringAsFixed(3);
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
                Row(
                  children: [
                    Radio(
                      value: Equipment.raw,
                      groupValue: equipment,
                      onChanged: (Equipment? value) {
                        setState(() {
                          equipment = value!;
                        });
                      },
                    ),
                    Text(S.of(context).ifpRaw),
                    Radio(
                      value: Equipment.singlePly,
                      groupValue: equipment,
                      onChanged: (Equipment? value) {
                        setState(() {
                          equipment = value!;
                        });
                      },
                    ),
                    Text(S.of(context).ifpSingleply),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: Event.sbd,
                      groupValue: event,
                      onChanged: (Event? value) {
                        setState(() {
                          event = value!;
                        });
                      },
                    ),
                    Text(S.of(context).ifp3Lift),
                    Radio(
                      value: Event.b,
                      groupValue: event,
                      onChanged: (Event? value) {
                        setState(() {
                          event = value!;
                        });
                      },
                    ),
                    Text(S.of(context).ifpBench),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double total = double.parse(tcTotal.text);
                      double bodyweight = double.parse(tcWeightAthlete.text);
                      if (isUS) {
                        total = lbsToKg(total);
                        bodyweight = lbsToKg(bodyweight);
                      }

                      Map<String, double> result = calcIFP(
                          bodyweight: bodyweight,
                          total: total,
                          gender: sex,
                          equipment: equipment,
                          event: event);

                      String res = """
**GLP**: ${result["glp"]!.toStringAsFixed(3)}

**Dots**: ${result["dots"]!.toStringAsFixed(3)}
"""; //
                      Navigator.pushNamed(context, '/result', arguments: {
                        'header': S.of(context).ifpPageTitle,
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
