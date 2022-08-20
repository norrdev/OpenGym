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

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter you age. ABSI calculator is only for people 2 or much years old.`
  String get absiAgeValidation {
    return Intl.message(
      'Please, enter you age. ABSI calculator is only for people 2 or much years old.',
      name: 'absiAgeValidation',
      desc: '',
      args: [],
    );
  }

  /// `Average ABSI of people in your age and same gender`
  String get absiMean {
    return Intl.message(
      'Average ABSI of people in your age and same gender',
      name: 'absiMean',
      desc: '',
      args: [],
    );
  }

  /// `A body shape index and mortality risk calculator.`
  String get absiPageDesc {
    return Intl.message(
      'A body shape index and mortality risk calculator.',
      name: 'absiPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `A body shape index (ABSI)`
  String get absiPageTitle {
    return Intl.message(
      'A body shape index (ABSI)',
      name: 'absiPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Premature mortality risk`
  String get absiRisk {
    return Intl.message(
      'Premature mortality risk',
      name: 'absiRisk',
      desc: '',
      args: [],
    );
  }

  /// `Very Low`
  String get absiRisk1 {
    return Intl.message(
      'Very Low',
      name: 'absiRisk1',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get absiRisk2 {
    return Intl.message(
      'Low',
      name: 'absiRisk2',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get absiRisk3 {
    return Intl.message(
      'Average',
      name: 'absiRisk3',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get absiRisk4 {
    return Intl.message(
      'High',
      name: 'absiRisk4',
      desc: '',
      args: [],
    );
  }

  /// `Very High`
  String get absiRisk5 {
    return Intl.message(
      'Very High',
      name: 'absiRisk5',
      desc: '',
      args: [],
    );
  }

  /// `Waist circumference`
  String get absiWaistCircumference {
    return Intl.message(
      'Waist circumference',
      name: 'absiWaistCircumference',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your waist circumference in centimeters.`
  String get absiWaistCircumferenceValidation {
    return Intl.message(
      'Please enter your waist circumference in centimeters.',
      name: 'absiWaistCircumferenceValidation',
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

  /// `Exercise added.`
  String get addEx {
    return Intl.message(
      'Exercise added.',
      name: 'addEx',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter you age.`
  String get ageValidation {
    return Intl.message(
      'Please, enter you age.',
      name: 'ageValidation',
      desc: '',
      args: [],
    );
  }

  /// `Allow changes?`
  String get allowChanges {
    return Intl.message(
      'Allow changes?',
      name: 'allowChanges',
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

  /// `Athletes`
  String get bfpAthletes {
    return Intl.message(
      'Athletes',
      name: 'bfpAthletes',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get bfpAverage {
    return Intl.message(
      'Average',
      name: 'bfpAverage',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get bfpCategory {
    return Intl.message(
      'Category',
      name: 'bfpCategory',
      desc: '',
      args: [],
    );
  }

  /// `Essential fat`
  String get bfpEssential {
    return Intl.message(
      'Essential fat',
      name: 'bfpEssential',
      desc: '',
      args: [],
    );
  }

  /// `Fitness`
  String get bfpFitness {
    return Intl.message(
      'Fitness',
      name: 'bfpFitness',
      desc: '',
      args: [],
    );
  }

  /// `Obese`
  String get bfpObese {
    return Intl.message(
      'Obese',
      name: 'bfpObese',
      desc: '',
      args: [],
    );
  }

  /// `Body fat percentage (BFP)`
  String get bfpPageTitle {
    return Intl.message(
      'Body fat percentage (BFP)',
      name: 'bfpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get bmi {
    return Intl.message(
      'BMI',
      name: 'bmi',
      desc: '',
      args: [],
    );
  }

  /// `Severely underweight.`
  String get bmi15_16 {
    return Intl.message(
      'Severely underweight.',
      name: 'bmi15_16',
      desc: '',
      args: [],
    );
  }

  /// `Very severely underweight.`
  String get bmi15 {
    return Intl.message(
      'Very severely underweight.',
      name: 'bmi15',
      desc: '',
      args: [],
    );
  }

  /// `Underweight.`
  String get bmi16_18 {
    return Intl.message(
      'Underweight.',
      name: 'bmi16_18',
      desc: '',
      args: [],
    );
  }

  /// `Normal (healthy weight).`
  String get bmi18_25 {
    return Intl.message(
      'Normal (healthy weight).',
      name: 'bmi18_25',
      desc: '',
      args: [],
    );
  }

  /// `Overweight.`
  String get bmi25_30 {
    return Intl.message(
      'Overweight.',
      name: 'bmi25_30',
      desc: '',
      args: [],
    );
  }

  /// `Obese Class I (Moderately obese).`
  String get bmi30_35 {
    return Intl.message(
      'Obese Class I (Moderately obese).',
      name: 'bmi30_35',
      desc: '',
      args: [],
    );
  }

  /// `Obese Class II (Severely obese).`
  String get bmi35_40 {
    return Intl.message(
      'Obese Class II (Severely obese).',
      name: 'bmi35_40',
      desc: '',
      args: [],
    );
  }

  /// `Obese Class III (Very severely obese).`
  String get bmi40 {
    return Intl.message(
      'Obese Class III (Very severely obese).',
      name: 'bmi40',
      desc: '',
      args: [],
    );
  }

  /// `Your height`
  String get bmiHeight {
    return Intl.message(
      'Your height',
      name: 'bmiHeight',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your height.`
  String get bmiHeightValidation {
    return Intl.message(
      'Please enter your height.',
      name: 'bmiHeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Calculate your Body Mass Index (WHO).`
  String get bmiPageDesc {
    return Intl.message(
      'Calculate your Body Mass Index (WHO).',
      name: 'bmiPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Body Mass Index (BMI)`
  String get bmiPageTitle {
    return Intl.message(
      'Body Mass Index (BMI)',
      name: 'bmiPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your weight`
  String get bmiWeight {
    return Intl.message(
      'Your weight',
      name: 'bmiWeight',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your weight.`
  String get bmiWeightValidation {
    return Intl.message(
      'Please enter your weight.',
      name: 'bmiWeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Brzycki`
  String get Brzycki {
    return Intl.message(
      'Brzycki',
      name: 'Brzycki',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get calculate {
    return Intl.message(
      'Calculate',
      name: 'calculate',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
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

  /// `cm`
  String get cm {
    return Intl.message(
      'cm',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get cooperAverage {
    return Intl.message(
      'Average',
      name: 'cooperAverage',
      desc: '',
      args: [],
    );
  }

  /// `Bad`
  String get cooperBad {
    return Intl.message(
      'Bad',
      name: 'cooperBad',
      desc: '',
      args: [],
    );
  }

  /// `Distanse`
  String get cooperDistanse {
    return Intl.message(
      'Distanse',
      name: 'cooperDistanse',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter the distance.`
  String get cooperDistanseValidation {
    return Intl.message(
      'Please, enter the distance.',
      name: 'cooperDistanseValidation',
      desc: '',
      args: [],
    );
  }

  /// `Excellent`
  String get cooperExcellent {
    return Intl.message(
      'Excellent',
      name: 'cooperExcellent',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get cooperGood {
    return Intl.message(
      'Good',
      name: 'cooperGood',
      desc: '',
      args: [],
    );
  }

  /// `Mark`
  String get cooperMark {
    return Intl.message(
      'Mark',
      name: 'cooperMark',
      desc: '',
      args: [],
    );
  }

  /// `Run 12 minutes as fast, as you can. And enter the distance in the field below. You can do it in a stadium, or using a fitness tracker with GPS.`
  String get cooperPageDesc {
    return Intl.message(
      'Run 12 minutes as fast, as you can. And enter the distance in the field below. You can do it in a stadium, or using a fitness tracker with GPS.',
      name: 'cooperPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cooper test + VO max`
  String get cooperPageTitle {
    return Intl.message(
      'Cooper test + VO max',
      name: 'cooperPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `The number of whole minutes to complete 4 cycles`
  String get cooperStrongMinutes {
    return Intl.message(
      'The number of whole minutes to complete 4 cycles',
      name: 'cooperStrongMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter number.`
  String get cooperStrongMinutesValidation {
    return Intl.message(
      'Please, enter number.',
      name: 'cooperStrongMinutesValidation',
      desc: '',
      args: [],
    );
  }

  /// `Another type of Cooper's strength endurance test, also no less common (created for the US military, but also used by sportsmen and military personnel of other countries), includes 4 repetitions of the following set of exercises:\n\n - do 10 push-ups and stay in support lying;\n - leaning on our hands with a jump, we bring our legs to our hands, squatting and then back 10 times;\n - we turn on our back and put our legs behind our heads 10 times (the exercise is performed lying on our back);\n - 10 jumps with a change of legs and touching the knee to the ground.`
  String get cooperStrongPageDesc {
    return Intl.message(
      'Another type of Cooper\'s strength endurance test, also no less common (created for the US military, but also used by sportsmen and military personnel of other countries), includes 4 repetitions of the following set of exercises:\n\n - do 10 push-ups and stay in support lying;\n - leaning on our hands with a jump, we bring our legs to our hands, squatting and then back 10 times;\n - we turn on our back and put our legs behind our heads 10 times (the exercise is performed lying on our back);\n - 10 jumps with a change of legs and touching the knee to the ground.',
      name: 'cooperStrongPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cooper army test`
  String get cooperStrongPageTitle {
    return Intl.message(
      'Cooper army test',
      name: 'cooperStrongPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Terrible`
  String get cooperTerrible {
    return Intl.message(
      'Terrible',
      name: 'cooperTerrible',
      desc: '',
      args: [],
    );
  }

  /// `© Denis Filonov`
  String get copyright {
    return Intl.message(
      '© Denis Filonov',
      name: 'copyright',
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

  /// `Add day`
  String get dayAdd {
    return Intl.message(
      'Add day',
      name: 'dayAdd',
      desc: '',
      args: [],
    );
  }

  /// `Database imported from`
  String get dbImportedFrom {
    return Intl.message(
      'Database imported from',
      name: 'dbImportedFrom',
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

  /// `Description`
  String get desc {
    return Intl.message(
      'Description',
      name: 'desc',
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

  /// `Please enter some text`
  String get enterText {
    return Intl.message(
      'Please enter some text',
      name: 'enterText',
      desc: '',
      args: [],
    );
  }

  /// `Epley`
  String get Epley {
    return Intl.message(
      'Epley',
      name: 'Epley',
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

  /// `Exercise name`
  String get exName {
    return Intl.message(
      'Exercise name',
      name: 'exName',
      desc: '',
      args: [],
    );
  }

  /// `Equipment`
  String get equipment {
    return Intl.message(
      'Equipment',
      name: 'equipment',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
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

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Body form`
  String get homePageBody {
    return Intl.message(
      'Body form',
      name: 'homePageBody',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get homePageFood {
    return Intl.message(
      'Food',
      name: 'homePageFood',
      desc: '',
      args: [],
    );
  }

  /// `Strength and endurance`
  String get homePagePower {
    return Intl.message(
      'Strength and endurance',
      name: 'homePagePower',
      desc: '',
      args: [],
    );
  }

  /// `Body proportions`
  String get homePageProportions {
    return Intl.message(
      'Body proportions',
      name: 'homePageProportions',
      desc: '',
      args: [],
    );
  }

  /// `3-Lift`
  String get ifp3Lift {
    return Intl.message(
      '3-Lift',
      name: 'ifp3Lift',
      desc: '',
      args: [],
    );
  }

  /// `Bench`
  String get ifpBench {
    return Intl.message(
      'Bench',
      name: 'ifpBench',
      desc: '',
      args: [],
    );
  }

  /// `IFP Goodlift Calculator.`
  String get ifpPageDescription {
    return Intl.message(
      'IFP Goodlift Calculator.',
      name: 'ifpPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `IPF Points`
  String get ifpPageTitle {
    return Intl.message(
      'IPF Points',
      name: 'ifpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Raw`
  String get ifpRaw {
    return Intl.message(
      'Raw',
      name: 'ifpRaw',
      desc: '',
      args: [],
    );
  }

  /// `Single-ply`
  String get ifpSingleply {
    return Intl.message(
      'Single-ply',
      name: 'ifpSingleply',
      desc: '',
      args: [],
    );
  }

  /// `Total weight`
  String get ifpTotalWeight {
    return Intl.message(
      'Total weight',
      name: 'ifpTotalWeight',
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

  /// `This option will overwrite all data with imports and exit the application. Make a backup!`
  String get importWarning {
    return Intl.message(
      'This option will overwrite all data with imports and exit the application. Make a backup!',
      name: 'importWarning',
      desc: '',
      args: [],
    );
  }

  /// `in`
  String get inch {
    return Intl.message(
      'in',
      name: 'inch',
      desc: '',
      args: [],
    );
  }

  /// `Are you a professional athlete?`
  String get isAthlete {
    return Intl.message(
      'Are you a professional athlete?',
      name: 'isAthlete',
      desc: '',
      args: [],
    );
  }

  /// `Lander`
  String get Lander {
    return Intl.message(
      'Lander',
      name: 'Lander',
      desc: '',
      args: [],
    );
  }

  /// `Fat-free body mass.`
  String get lbmPageDescription {
    return Intl.message(
      'Fat-free body mass.',
      name: 'lbmPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Lean Body Mass`
  String get lbmPageTitle {
    return Intl.message(
      'Lean Body Mass',
      name: 'lbmPageTitle',
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

  /// `Log`
  String get log {
    return Intl.message(
      'Log',
      name: 'log',
      desc: '',
      args: [],
    );
  }

  /// `Lombardi`
  String get Lombardi {
    return Intl.message(
      'Lombardi',
      name: 'Lombardi',
      desc: '',
      args: [],
    );
  }

  /// `Load`
  String get loadStr {
    return Intl.message(
      'Load',
      name: 'loadStr',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Mayhew`
  String get Mayhew {
    return Intl.message(
      'Mayhew',
      name: 'Mayhew',
      desc: '',
      args: [],
    );
  }

  /// `Bicep girth`
  String get mcBicep {
    return Intl.message(
      'Bicep girth',
      name: 'mcBicep',
      desc: '',
      args: [],
    );
  }

  /// `Girth of the buttocks`
  String get mcButt {
    return Intl.message(
      'Girth of the buttocks',
      name: 'mcButt',
      desc: '',
      args: [],
    );
  }

  /// `Calf circumference`
  String get mcCalf {
    return Intl.message(
      'Calf circumference',
      name: 'mcCalf',
      desc: '',
      args: [],
    );
  }

  /// `Chest girth`
  String get mcChest {
    return Intl.message(
      'Chest girth',
      name: 'mcChest',
      desc: '',
      args: [],
    );
  }

  /// `Forearm girth`
  String get mcForearm {
    return Intl.message(
      'Forearm girth',
      name: 'mcForearm',
      desc: '',
      args: [],
    );
  }

  /// `Neck girth`
  String get mcNeck {
    return Intl.message(
      'Neck girth',
      name: 'mcNeck',
      desc: '',
      args: [],
    );
  }

  /// `Ideal Body Proportions Formula For the Natural Athlete (McCallum).`
  String get mcPageDesc {
    return Intl.message(
      'Ideal Body Proportions Formula For the Natural Athlete (McCallum).',
      name: 'mcPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Body proportions (McCallum)`
  String get mcPageTitle {
    return Intl.message(
      'Body proportions (McCallum)',
      name: 'mcPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Body part`
  String get mcPart {
    return Intl.message(
      'Body part',
      name: 'mcPart',
      desc: '',
      args: [],
    );
  }

  /// `Maximum`
  String get mcrobertMax {
    return Intl.message(
      'Maximum',
      name: 'mcrobertMax',
      desc: '',
      args: [],
    );
  }

  /// `Minimum`
  String get mcrobertMin {
    return Intl.message(
      'Minimum',
      name: 'mcrobertMin',
      desc: '',
      args: [],
    );
  }

  /// `Ideal Body Proportions Formula For the Natural Athlete (McRobert).`
  String get mcrobertPageDesc {
    return Intl.message(
      'Ideal Body Proportions Formula For the Natural Athlete (McRobert).',
      name: 'mcrobertPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Body proportions (McRobert)`
  String get mcrobertPageTitle {
    return Intl.message(
      'Body proportions (McRobert)',
      name: 'mcrobertPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thigh girth`
  String get mcThigh {
    return Intl.message(
      'Thigh girth',
      name: 'mcThigh',
      desc: '',
      args: [],
    );
  }

  /// `Waist`
  String get mcWaist {
    return Intl.message(
      'Waist',
      name: 'mcWaist',
      desc: '',
      args: [],
    );
  }

  /// `Wrist girth`
  String get mcWrist {
    return Intl.message(
      'Wrist girth',
      name: 'mcWrist',
      desc: '',
      args: [],
    );
  }

  /// `Enter your wrist circumference.`
  String get mcWristValidation {
    return Intl.message(
      'Enter your wrist circumference.',
      name: 'mcWristValidation',
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

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `No description.`
  String get noDesc {
    return Intl.message(
      'No description.',
      name: 'noDesc',
      desc: '',
      args: [],
    );
  }

  /// `No exercises on this day.`
  String get noex {
    return Intl.message(
      'No exercises on this day.',
      name: 'noex',
      desc: '',
      args: [],
    );
  }

  /// `Nothing selected`
  String get nothingSelected {
    return Intl.message(
      'Nothing selected',
      name: 'nothingSelected',
      desc: '',
      args: [],
    );
  }

  /// `O'Conner`
  String get OConner {
    return Intl.message(
      'O`Conner',
      name: 'OConner',
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

  /// `Programs`
  String get pageProgramsTitle {
    return Intl.message(
      'Programs',
      name: 'pageProgramsTitle',
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

  /// `Add program`
  String get programAdd {
    return Intl.message(
      'Add program',
      name: 'programAdd',
      desc: '',
      args: [],
    );
  }

  /// `Preinstalled exercise`
  String get preinstalledEx {
    return Intl.message(
      'Preinstalled exercise',
      name: 'preinstalledEx',
      desc: '',
      args: [],
    );
  }

  /// `Rename`
  String get rename {
    return Intl.message(
      'Rename',
      name: 'rename',
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

  /// `Save & rest`
  String get restButton {
    return Intl.message(
      'Save & rest',
      name: 'restButton',
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

  /// `Relative fat mass in % calculation.`
  String get rfmPageDescription {
    return Intl.message(
      'Relative fat mass in % calculation.',
      name: 'rfmPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Relative fat mass (RFM)`
  String get rfmPageTitle {
    return Intl.message(
      'Relative fat mass (RFM)',
      name: 'rfmPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Weight of barebell`
  String get rmBarebellWeight {
    return Intl.message(
      'Weight of barebell',
      name: 'rmBarebellWeight',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter weight of barbell.`
  String get rmBarebellWeightValidation {
    return Intl.message(
      'Please, enter weight of barbell.',
      name: 'rmBarebellWeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Method`
  String get rmMethod {
    return Intl.message(
      'Method',
      name: 'rmMethod',
      desc: '',
      args: [],
    );
  }

  /// `1 RM calculation by different methods.`
  String get rmPageDesc {
    return Intl.message(
      '1 RM calculation by different methods.',
      name: 'rmPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `1 RM calculation`
  String get rmPageTitle {
    return Intl.message(
      '1 RM calculation',
      name: 'rmPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Repeats`
  String get rmRepeats {
    return Intl.message(
      'Repeats',
      name: 'rmRepeats',
      desc: '',
      args: [],
    );
  }

  /// `Enter repeats.`
  String get rmRepeatValidation {
    return Intl.message(
      'Enter repeats.',
      name: 'rmRepeatValidation',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get rmResult {
    return Intl.message(
      'Result',
      name: 'rmResult',
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

  /// `Save database to file`
  String get saveToFile {
    return Intl.message(
      'Save database to file',
      name: 'saveToFile',
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

  /// `Select or create program first`
  String get selectProgram {
    return Intl.message(
      'Select or create program first',
      name: 'selectProgram',
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

  /// `Perform the set, and when you're done, press the button.`
  String get setsText {
    return Intl.message(
      'Perform the set, and when you\'re done, press the button.',
      name: 'setsText',
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

  /// `Share database`
  String get share {
    return Intl.message(
      'Share database',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Are you really want to skip this exercise today?`
  String get skipDialog {
    return Intl.message(
      'Are you really want to skip this exercise today?',
      name: 'skipDialog',
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

  /// `Stop the rest`
  String get stopRest {
    return Intl.message(
      'Stop the rest',
      name: 'stopRest',
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

  /// `NpNg`
  String get title {
    return Intl.message(
      'NpNg',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Use Imperial/US system (lbs, in, miles)?`
  String get useImperialUS {
    return Intl.message(
      'Use Imperial/US system (lbs, in, miles)?',
      name: 'useImperialUS',
      desc: '',
      args: [],
    );
  }

  /// `Wathan`
  String get Wathan {
    return Intl.message(
      'Wathan',
      name: 'Wathan',
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

  /// `Wilks`
  String get Wilks {
    return Intl.message(
      'Wilks',
      name: 'Wilks',
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

  /// `Workout in progress`
  String get workoutInProgress {
    return Intl.message(
      'Workout in progress',
      name: 'workoutInProgress',
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

  /// `Workout duration`
  String get wrkDuration {
    return Intl.message(
      'Workout duration',
      name: 'wrkDuration',
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

  /// `Training volume`
  String get wrkTrainingVolume {
    return Intl.message(
      'Training volume',
      name: 'wrkTrainingVolume',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `One bar or no bar`
  String get oneBarOrNoBar {
    return Intl.message(
      'One bar or no bar',
      name: 'oneBarOrNoBar',
      desc: '',
      args: [],
    );
  }

  /// `Two bars`
  String get twoBars {
    return Intl.message(
      'Two bars',
      name: 'twoBars',
      desc: '',
      args: [],
    );
  }

  /// `Both limbs work simultaneously or one muscle group works`
  String get twoLimbsWorksTogether {
    return Intl.message(
      'Both limbs work simultaneously or one muscle group works',
      name: 'twoLimbsWorksTogether',
      desc: '',
      args: [],
    );
  }

  /// `Limbs work alternately or separately`
  String get limbsWorkAlt {
    return Intl.message(
      'Limbs work alternately or separately',
      name: 'limbsWorkAlt',
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
