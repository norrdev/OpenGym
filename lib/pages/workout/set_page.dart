import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/pages/workout/timer_page.dart';
import 'package:provider/provider.dart';
import 'package:npng/state/set_rest_provider.dart';
import 'package:npng/generated/l10n.dart';

class SetPage extends StatelessWidget {
  static const String id = '/set';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).setsText,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50),
              Text(
                '${Provider.of<SetRestProvider>(context).currentSet} ${S.of(context).from} ${Provider.of<SetRestProvider>(context).sets}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text(S.of(context).restButton),
                onPressed: () => Navigator.pushNamed(context, TimerPage.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
