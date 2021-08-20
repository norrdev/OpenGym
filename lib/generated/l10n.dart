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

  /// `Save & rest`
  String get restButton {
    return Intl.message(
      'Save & rest',
      name: 'restButton',
      desc: '',
      args: [],
    );
  }

  /// `Stop the rest`
  String get stopRest {
    return Intl.message(
      'Stop the rest',
      name: 'stopRest',
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

  /// `Licenses`
  String get licenses {
    return Intl.message(
      'Licenses',
      name: 'licenses',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
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

  /// `min.`
  String get min {
    return Intl.message(
      'min.',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Muscles`
  String get muscles {
    return Intl.message(
      'Muscles',
      name: 'muscles',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Share database`
  String get share {
    return Intl.message(
      'Share database',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Backup database`
  String get backup {
    return Intl.message(
      'Backup database',
      name: 'backup',
      desc: '',
      args: [],
    );
  }

  /// `Restore from backup`
  String get restore {
    return Intl.message(
      'Restore from backup',
      name: 'restore',
      desc: '',
      args: [],
    );
  }

  /// `Import database`
  String get import {
    return Intl.message(
      'Import database',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Programs`
  String get pageProgramsTitle {
    return Intl.message(
      'Programs',
      name: 'pageProgramsTitle',
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

  /// `Workout finished`
  String get workoutFinished {
    return Intl.message(
      'Workout finished',
      name: 'workoutFinished',
      desc: '',
      args: [],
    );
  }

  /// `Save to Log`
  String get saveToLog {
    return Intl.message(
      'Save to Log',
      name: 'saveToLog',
      desc: '',
      args: [],
    );
  }

  /// `Log`
  String get log {
    return Intl.message(
      'Log',
      name: 'log',
      desc: '',
      args: [],
    );
  }

  /// `Workout begin`
  String get wrkBegin {
    return Intl.message(
      'Workout begin',
      name: 'wrkBegin',
      desc: '',
      args: [],
    );
  }

  /// `Workout end`
  String get wrkEnd {
    return Intl.message(
      'Workout end',
      name: 'wrkEnd',
      desc: '',
      args: [],
    );
  }

  /// `Workout duration`
  String get wrkDuration {
    return Intl.message(
      'Workout duration',
      name: 'wrkDuration',
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
