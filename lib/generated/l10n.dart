// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `NpNg`
  String get title {
    return Intl.message(
      'NpNg',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Sets`
  String get sets {
    return Intl.message(
      'Sets',
      name: 'sets',
      desc: '',
      args: [],
    );
  }

  /// `Rest time (seconds)`
  String get rest {
    return Intl.message(
      'Rest time (seconds)',
      name: 'rest',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// ` from `
  String get from {
    return Intl.message(
      ' from ',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Rest`
  String get restButton {
    return Intl.message(
      'Rest',
      name: 'restButton',
      desc: '',
      args: [],
    );
  }

  /// `Perfom the set, and when you're done, press the button.`
  String get setsText {
    return Intl.message(
      'Perfom the set, and when you\'re done, press the button.',
      name: 'setsText',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Timer`
  String get timer {
    return Intl.message(
      'Timer',
      name: 'timer',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Please enter some text`
  String get enterText {
    return Intl.message(
      'Please enter some text',
      name: 'enterText',
      desc: '',
      args: [],
    );
  }

  /// `Routines`
  String get pageRoutinesTitle {
    return Intl.message(
      'Routines',
      name: 'pageRoutinesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get pageExerciseTitle {
    return Intl.message(
      'Exercises',
      name: 'pageExerciseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Exercise name`
  String get exName {
    return Intl.message(
      'Exercise name',
      name: 'exName',
      desc: '',
      args: [],
    );
  }

  /// `Exercise description`
  String get exDesc {
    return Intl.message(
      'Exercise description',
      name: 'exDesc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}