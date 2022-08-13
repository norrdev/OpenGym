import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc.dart';
import '../../../logic/calculators/calc_mccallum.dart';
import '../../../widgets/text_form_fields.dart';

class CalcMcCallumScreen extends StatefulWidget {
  const CalcMcCallumScreen({super.key});

  @override
  State<CalcMcCallumScreen> createState() => _CalcMcCallumScreenState();
}

class _CalcMcCallumScreenState extends State<CalcMcCallumScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWrist = TextEditingController();

  bool isUS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mcPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).mcPageDesc),
                const SizedBox(height: 16),
                TextFormFieldDouble(
                  tcValue: tcWrist,
                  labelText: S.of(context).mcWrist,
                  errorText: S.of(context).mcWristValidation,
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
                      double wrist = double.parse(tcWrist.text);

                      if (isUS) {
                        wrist = inchToCm(wrist);
                      }

                      Map<String, double> mac =
                          mcCallum(wristCm: wrist, context: context);

                      String res = '''
|**${S.of(context).mcPart}**|**${isUS ? S.of(context).inch : S.of(context).cm}**|
|---|---|
''';
                      mac.forEach((key, value) {
                        res += '''
|  $key  |  ${isUS ? cmToInch(value).toStringAsFixed(1) : value.toStringAsFixed(1)}  |
''';
                      });
                      Navigator.pushNamed(context, '/result', arguments: {
                        'header': S.of(context).mcPageTitle,
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
