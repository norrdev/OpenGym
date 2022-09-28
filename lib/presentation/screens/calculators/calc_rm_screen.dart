import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc.dart';
import '../../../logic/calculators/calc_rm.dart';
import '../../widgets/text_form_fields.dart';

class CalcRmScreen extends StatefulWidget {
  const CalcRmScreen({super.key});

  @override
  State<CalcRmScreen> createState() => _CalcRmScreenState();
}

class _CalcRmScreenState extends State<CalcRmScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeightAthlete = TextEditingController();
  TextEditingController tcWeightBarebell = TextEditingController();
  TextEditingController tcRepeat = TextEditingController();
  Sex sex = Sex.female;
  bool isUS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).rmPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).rmPageDesc),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcWeightAthlete,
                  labelText: S.of(context).bmiWeight,
                  errorText: S.of(context).bmiWeightValidation,
                ),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcWeightBarebell,
                  labelText: S.of(context).rmBarebellWeight,
                  errorText: S.of(context).rmBarebellWeightValidation,
                ),
                const SizedBox(height: 16),
                TextFormFieldInt(
                  tcValue: tcRepeat,
                  labelText: S.of(context).rmRepeats,
                  errorText: S.of(context).rmRepeatValidation,
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
                      double weightAthlete = double.parse(tcWeightAthlete.text);
                      double weightBarebell =
                          double.parse(tcWeightBarebell.text);
                      if (isUS) {
                        weightBarebell = lbsToKg(weightBarebell);
                        weightAthlete = lbsToKg(weightAthlete);
                      }
                      CalcRm rm = CalcRm(
                          weightAthlete: weightAthlete,
                          weightBarebell: weightBarebell,
                          repeat: int.parse(tcRepeat.text),
                          gender: sex);

                      String res = ''' 
|**${S.of(context).rmMethod}**|**${S.of(context).rmResult}**|
|---|---|
|${S.of(context).Brzycki}|${isUS ? kgToLbs(rm.oneRmBrzycki).toStringAsFixed(3) : rm.oneRmBrzycki.toStringAsFixed(3)}|
|${S.of(context).Epley}|${isUS ? kgToLbs(rm.oneRmEpley).toStringAsFixed(3) : rm.oneRmEpley.toStringAsFixed(3)}|
|${S.of(context).Lander}|${isUS ? kgToLbs(rm.oneRmLander).toStringAsFixed(3) : rm.oneRmLander.toStringAsFixed(3)}|
|${S.of(context).Lombardi}|${isUS ? kgToLbs(rm.oneRmLombardi).toStringAsFixed(3) : rm.oneRmLombardi.toStringAsFixed(3)}|
|${S.of(context).Mayhew}|${isUS ? kgToLbs(rm.oneRmMayhew).toStringAsFixed(3) : rm.oneRmMayhew.toStringAsFixed(3)}|
|${S.of(context).OConner}|${isUS ? kgToLbs(rm.oneRmOConner).toStringAsFixed(3) : rm.oneRmOConner.toStringAsFixed(3)}|
|${S.of(context).Wathan}|${isUS ? kgToLbs(rm.oneRmWathan).toStringAsFixed(3) : rm.oneRmWathan.toStringAsFixed(3)}|
|${S.of(context).Wilks}|${isUS ? kgToLbs(rm.oneRmWilks).toStringAsFixed(3) : rm.oneRmWilks.toStringAsFixed(3)}|
''';

                      Navigator.pushNamed(context, '/result', arguments: {
                        'header': S.of(context).rmPageTitle,
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
