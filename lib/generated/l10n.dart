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

  /// `НбНп`
  String get title {
    return Intl.message(
      'НбНп',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Количество подходов`
  String get sets {
    return Intl.message(
      'Количество подходов',
      name: 'sets',
      desc: '',
      args: [],
    );
  }

  /// `Время отдыха в секундах`
  String get rest {
    return Intl.message(
      'Время отдыха в секундах',
      name: 'rest',
      desc: '',
      args: [],
    );
  }

  /// `Старт`
  String get start {
    return Intl.message(
      'Старт',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// ` из `
  String get from {
    return Intl.message(
      ' из ',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Отдых`
  String get restButton {
    return Intl.message(
      'Отдых',
      name: 'restButton',
      desc: '',
      args: [],
    );
  }

  /// `Выполните подход, и когда закончите, нажмите кнопку.`
  String get setsText {
    return Intl.message(
      'Выполните подход, и когда закончите, нажмите кнопку.',
      name: 'setsText',
      desc: '',
      args: [],
    );
  }

  /// `О приложении`
  String get about {
    return Intl.message(
      'О приложении',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Таймер`
  String get timer {
    return Intl.message(
      'Таймер',
      name: 'timer',
      desc: '',
      args: [],
    );
  }

  /// `Правка`
  String get edit {
    return Intl.message(
      'Правка',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Введите текст`
  String get enterText {
    return Intl.message(
      'Введите текст',
      name: 'enterText',
      desc: '',
      args: [],
    );
  }

  /// `Название`
  String get name {
    return Intl.message(
      'Название',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get desc {
    return Intl.message(
      'Описание',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Тренировки`
  String get pageRoutinesTitle {
    return Intl.message(
      'Тренировки',
      name: 'pageRoutinesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Дни`
  String get pageDaysTitle {
    return Intl.message(
      'Дни',
      name: 'pageDaysTitle',
      desc: '',
      args: [],
    );
  }

  /// `Упражнения`
  String get pageExerciseTitle {
    return Intl.message(
      'Упражнения',
      name: 'pageExerciseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Название упражнения`
  String get exName {
    return Intl.message(
      'Название упражнения',
      name: 'exName',
      desc: '',
      args: [],
    );
  }

  /// `Описание упражнения`
  String get exDesc {
    return Intl.message(
      'Описание упражнения',
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
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
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