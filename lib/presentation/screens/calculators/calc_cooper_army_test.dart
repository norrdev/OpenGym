import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../logic/calculators/calc_cooper_strong.dart';
import '../../../widgets/text_form_fields.dart';

class CooperArmyTestScreen extends StatefulWidget {
  const CooperArmyTestScreen({super.key});

  @override
  State<CooperArmyTestScreen> createState() => _CooperArmyTestScreenState();
}

class _CooperArmyTestScreenState extends State<CooperArmyTestScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcMinutes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).cooperStrongPageTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(S.of(context).cooperStrongPageDesc),
                const SizedBox(height: 16),
                SizedBox(
                  height: 360.0,
                  child: Image.asset(
                    'assets/images/cooper.png',
                    fit: BoxFit.none,
                    //filterQuality: FilterQuality.low,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormFieldInt(
                  tcValue: tcMinutes,
                  labelText: S.of(context).cooperStrongMinutes,
                  errorText: S.of(context).cooperStrongMinutesValidation,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String force = cooperStrong(
                          context: context, minutes: int.parse(tcMinutes.text));
                      String res = '''
**${S.of(context).cooperMark}:** $force
''';
                      Navigator.pushNamed(context, '/result', arguments: {
                        'header': S.of(context).cooperStrongPageTitle,
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
