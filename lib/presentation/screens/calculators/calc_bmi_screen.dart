import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npng/constants/numbers.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/logic/calculators/calc.dart';
import 'package:npng/logic/calculators/calc_bmi.dart';

class CalcBmiScreen extends StatefulWidget {
  const CalcBmiScreen({super.key});

  @override
  State<CalcBmiScreen> createState() => _CalcBmiScreenState();
}

class _CalcBmiScreenState extends State<CalcBmiScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeight = TextEditingController(text: '89.6');
  bool weightError = false;
  TextEditingController tcHeight = TextEditingController(text: '183.5');
  bool heightError = false;
  double bmi = 0;
  String result = '';
  bool isUS = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).bmiPageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  (bmi > 0) ? bmi.toStringAsFixed(3) : '',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 2,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: tcWeight,
                        decoration: InputDecoration(
                          labelText: S.of(context).bmiWeight,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(kDoubleRegExp)),
                        ],
                        validator: (value) {
                          if (double.tryParse(value!) == null) {
                            return 'Please enter your weight';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: tcHeight,
                        decoration: const InputDecoration(
                          labelText: 'Height (cm)',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (double.tryParse(value!) == null) {
                            return 'Please enter your height';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        child: const Text('Calculate'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            double weight = double.parse(tcWeight.text);
                            double height = double.parse(tcHeight.text);

                            if (isUS) {
                              weight = lbsToKg(weight);
                              height = inchToCm(height);
                            }

                            CalculatorBmi calc = CalculatorBmi(
                                context: context,
                                weightAthlete: weight,
                                heightAthleteCm: height);

                            bmi = calc.bmi();
                            result = calc.bmiInterpretation();
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
