import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc.dart';
import '../../../logic/calculators/calc_mcrobert.dart';
import '../../widgets/text_form_fields.dart';

class CalcMcRobertScreen extends StatefulWidget {
  const CalcMcRobertScreen({super.key});

  @override
  State<CalcMcRobertScreen> createState() => _CalcMcRobertScreenState();
}

class _CalcMcRobertScreenState extends State<CalcMcRobertScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcHeight = TextEditingController();

  bool isUS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mcrobertPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).mcrobertPageDesc),
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
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double height = double.parse(tcHeight.text);

                      if (isUS) {
                        height = inchToCm(height);
                      }

                      Map<String, List<double>> mac =
                          mcRobert(context: context, heightCm: height);
                      String res = '''
|**${S.of(context).mcPart}**|**${S.of(context).mcrobertMin}**|**${S.of(context).mcrobertMax}**|
|---|---|---|
''';
                      mac.forEach((key, value) {
                        res += '''
|  $key  |  ${isUS ? cmToInch(value[0]).toStringAsFixed(1) : value[0].toStringAsFixed(1)}  |${isUS ? cmToInch(value[1]).toStringAsFixed(1) : value[1].toStringAsFixed(1)}  |
''';
                      });
                      Navigator.pushNamed(context, '/result', arguments: {
                        'header': S.of(context).mcrobertPageTitle,
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
