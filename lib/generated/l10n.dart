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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
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

  /// `Repeats`
  String get repeats {
    return Intl.message(
      'Repeats',
      name: 'repeats',
      desc: '',
      args: [],
    );
  }

  /// `Rest time (sec)`
  String get rest {
    return Intl.message(
      'Rest time (sec)',
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

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
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

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get desc {
    return Intl.message(
      'Description',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get ccontinue {
    return Intl.message(
      'Continue',
      name: 'ccontinue',
      desc: '',
      args: [],
    );
  }

  /// `No excersises on this day.`
  String get noex {
    return Intl.message(
      'No excersises on this day.',
      name: 'noex',
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

  /// `Days`
  String get pageDaysTitle {
    return Intl.message(
      'Days',
      name: 'pageDaysTitle',
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

  /// `Add exercise`
  String get pageAddEx {
    return Intl.message(
      'Add exercise',
      name: 'pageAddEx',
      desc: '',
      args: [],
    );
  }

  /// `Workout`
  String get pageWorkout {
    return Intl.message(
      'Workout',
      name: 'pageWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Current workout`
  String get currentWorkout {
    return Intl.message(
      'Current workout',
      name: 'currentWorkout',
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
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
