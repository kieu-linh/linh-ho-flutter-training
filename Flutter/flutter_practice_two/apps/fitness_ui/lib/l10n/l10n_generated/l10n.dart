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

class FAUiS {
  FAUiS();

  static FAUiS? _current;

  static FAUiS get current {
    assert(_current != null,
        'No instance of FAUiS was loaded. Try to initialize the FAUiS delegate before accessing FAUiS.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<FAUiS> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = FAUiS();
      FAUiS._current = instance;

      return instance;
    });
  }

  static FAUiS of(BuildContext context) {
    final instance = FAUiS.maybeOf(context);
    assert(instance != null,
        'No instance of FAUiS present in the widget tree. Did you add FAUiS.delegate in localizationsDelegates?');
    return instance!;
  }

  static FAUiS? maybeOf(BuildContext context) {
    return Localizations.of<FAUiS>(context, FAUiS);
  }

  /// `PRO `
  String get firstSplashTitle {
    return Intl.message(
      'PRO ',
      name: 'firstSplashTitle',
      desc: '',
      args: [],
    );
  }

  /// `FITNESS`
  String get secondSplashTitle {
    return Intl.message(
      'FITNESS',
      name: 'secondSplashTitle',
      desc: '',
      args: [],
    );
  }

  /// `We train your body to be \n great and fit.`
  String get splashDescription {
    return Intl.message(
      'We train your body to be \n great and fit.',
      name: 'splashDescription',
      desc: '',
      args: [],
    );
  }

  /// `LET'S START`
  String get buttonStartText {
    return Intl.message(
      'LET\'S START',
      name: 'buttonStartText',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipPageText {
    return Intl.message(
      'Skip',
      name: 'skipPageText',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get nextPageText {
    return Intl.message(
      'NEXT',
      name: 'nextPageText',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Pro Fitness!`
  String get fitnessTitle {
    return Intl.message(
      'Welcome to Pro Fitness!',
      name: 'fitnessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hello there, sign in to \ncontinue!`
  String get signInText {
    return Intl.message(
      'Hello there, sign in to \ncontinue!',
      name: 'signInText',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get EmailHintText {
    return Intl.message(
      'Email Address',
      name: 'EmailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHintText {
    return Intl.message(
      'Password',
      name: 'passwordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPasswordText {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginText {
    return Intl.message(
      'Login',
      name: 'loginText',
      desc: '',
      args: [],
    );
  }

  /// `Or Login with`
  String get loginWithText {
    return Intl.message(
      'Or Login with',
      name: 'loginWithText',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Google`
  String get googleText {
    return Intl.message(
      'Connect with Google',
      name: 'googleText',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Facebook`
  String get facebookText {
    return Intl.message(
      'Connect with Facebook',
      name: 'facebookText',
      desc: '',
      args: [],
    );
  }

  /// `Register!`
  String get registerText {
    return Intl.message(
      'Register!',
      name: 'registerText',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get signInDescription {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'signInDescription',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Favorite`
  String get yourFavoriteText {
    return Intl.message(
      'Select Your Favorite',
      name: 'yourFavoriteText',
      desc: '',
      args: [],
    );
  }

  /// `NEXT STEPS`
  String get nextStepText {
    return Intl.message(
      'NEXT STEPS',
      name: 'nextStepText',
      desc: '',
      args: [],
    );
  }

  /// `Finish Steps`
  String get finishStepText {
    return Intl.message(
      'Finish Steps',
      name: 'finishStepText',
      desc: '',
      args: [],
    );
  }

  /// `Get Started!`
  String get getStartedText {
    return Intl.message(
      'Get Started!',
      name: 'getStartedText',
      desc: '',
      args: [],
    );
  }

  /// `How old are you?`
  String get yourOldText {
    return Intl.message(
      'How old are you?',
      name: 'yourOldText',
      desc: '',
      args: [],
    );
  }

  /// `Step {currentStep} of {numberOfSteps}`
  String stepPageText(int currentStep, int numberOfSteps) {
    return Intl.message(
      'Step $currentStep of $numberOfSteps',
      name: 'stepPageText',
      desc: '',
      args: [currentStep, numberOfSteps],
    );
  }

  /// `Sophia !`
  String get userName {
    return Intl.message(
      'Sophia !',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `How much do you weight?`
  String get weightTitle {
    return Intl.message(
      'How much do you weight?',
      name: 'weightTitle',
      desc: '',
      args: [],
    );
  }

  /// `What's your goal weight?`
  String get goalWeightTitle {
    return Intl.message(
      'What\'s your goal weight?',
      name: 'goalWeightTitle',
      desc: '',
      args: [],
    );
  }

  /// `How much do you Height?`
  String get heightTitle {
    return Intl.message(
      'How much do you Height?',
      name: 'heightTitle',
      desc: '',
      args: [],
    );
  }

  /// `What's your fitness level?`
  String get levelText {
    return Intl.message(
      'What\'s your fitness level?',
      name: 'levelText',
      desc: '',
      args: [],
    );
  }

  /// `What's your goal`
  String get goalText {
    return Intl.message(
      'What\'s your goal',
      name: 'goalText',
      desc: '',
      args: [],
    );
  }

  /// `Let's get started`
  String get startText {
    return Intl.message(
      'Let\'s get started',
      name: 'startText',
      desc: '',
      args: [],
    );
  }

  /// `LBS`
  String get lbs {
    return Intl.message(
      'LBS',
      name: 'lbs',
      desc: '',
      args: [],
    );
  }

  /// `KG`
  String get kg {
    return Intl.message(
      'KG',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `FEET`
  String get feet {
    return Intl.message(
      'FEET',
      name: 'feet',
      desc: '',
      args: [],
    );
  }

  /// `CM`
  String get cm {
    return Intl.message(
      'CM',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message(
      'Beginner',
      name: 'beginner',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Weight loss`
  String get weightLoss {
    return Intl.message(
      'Weight loss',
      name: 'weightLoss',
      desc: '',
      args: [],
    );
  }

  /// `Gain muscle`
  String get gainMuscle {
    return Intl.message(
      'Gain muscle',
      name: 'gainMuscle',
      desc: '',
      args: [],
    );
  }

  /// `Improve fitness`
  String get improveFitness {
    return Intl.message(
      'Improve fitness',
      name: 'improveFitness',
      desc: '',
      args: [],
    );
  }

  /// `The standard chunk of Lorem Ipsum \n used since the 1500s is reproduced below \n for those interested.`
  String get startDescription {
    return Intl.message(
      'The standard chunk of Lorem Ipsum \n used since the 1500s is reproduced below \n for those interested.',
      name: 'startDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sculpt your `
  String get firstStartText {
    return Intl.message(
      'Sculpt your ',
      name: 'firstStartText',
      desc: '',
      args: [],
    );
  }

  /// `ideal body, `
  String get secondStartText {
    return Intl.message(
      'ideal body, ',
      name: 'secondStartText',
      desc: '',
      args: [],
    );
  }

  /// `free your \n true self, transform your life.`
  String get thirdStartText {
    return Intl.message(
      'free your \n true self, transform your life.',
      name: 'thirdStartText',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Good Morning`
  String get morningTitle {
    return Intl.message(
      'Hello, Good Morning',
      name: 'morningTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Good Afternoon`
  String get afternoonTitle {
    return Intl.message(
      'Hello, Good Afternoon',
      name: 'afternoonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Good Evening`
  String get eveningTitle {
    return Intl.message(
      'Hello, Good Evening',
      name: 'eveningTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchText {
    return Intl.message(
      'Search',
      name: 'searchText',
      desc: '',
      args: [],
    );
  }

  /// `Fit Young Woman Doing \nBattle Stretch Training`
  String get cardTitle {
    return Intl.message(
      'Fit Young Woman Doing \nBattle Stretch Training',
      name: 'cardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start Exercise`
  String get buttonCardText {
    return Intl.message(
      'Start Exercise',
      name: 'buttonCardText',
      desc: '',
      args: [],
    );
  }

  /// `Select your Goal`
  String get selectGoalText {
    return Intl.message(
      'Select your Goal',
      name: 'selectGoalText',
      desc: '',
      args: [],
    );
  }

  /// `Loose Weight`
  String get looseWeightText {
    return Intl.message(
      'Loose Weight',
      name: 'looseWeightText',
      desc: '',
      args: [],
    );
  }

  /// `Gain Weight`
  String get gainWeightText {
    return Intl.message(
      'Gain Weight',
      name: 'gainWeightText',
      desc: '',
      args: [],
    );
  }

  /// `Body Building`
  String get bodyBuildingText {
    return Intl.message(
      'Body Building',
      name: 'bodyBuildingText',
      desc: '',
      args: [],
    );
  }

  /// `Healthy`
  String get healthy {
    return Intl.message(
      'Healthy',
      name: 'healthy',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Gym`
  String get gym {
    return Intl.message(
      'Gym',
      name: 'gym',
      desc: '',
      args: [],
    );
  }

  /// `Cardio`
  String get cardio {
    return Intl.message(
      'Cardio',
      name: 'cardio',
      desc: '',
      args: [],
    );
  }

  /// `Stretch`
  String get stretch {
    return Intl.message(
      'Stretch',
      name: 'stretch',
      desc: '',
      args: [],
    );
  }

  /// `Full Body`
  String get fullBody {
    return Intl.message(
      'Full Body',
      name: 'fullBody',
      desc: '',
      args: [],
    );
  }

  /// `Legs`
  String get legs {
    return Intl.message(
      'Legs',
      name: 'legs',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Meal Plans`
  String get mealPlans {
    return Intl.message(
      'Meal Plans',
      name: 'mealPlans',
      desc: '',
      args: [],
    );
  }

  /// `Exercise`
  String get exercise {
    return Intl.message(
      'Exercise',
      name: 'exercise',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Popular Exercise`
  String get popularExerciseDescription {
    return Intl.message(
      'Popular Exercise',
      name: 'popularExerciseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Full Shot Woman Stretching Arm`
  String get stretchingArmText {
    return Intl.message(
      'Full Shot Woman Stretching Arm',
      name: 'stretchingArmText',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get min {
    return Intl.message(
      'min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Athlete Practicing Monochrome`
  String get athleteDescription {
    return Intl.message(
      'Athlete Practicing Monochrome',
      name: 'athleteDescription',
      desc: '',
      args: [],
    );
  }

  /// `Greek salad with lettuce, green onion,`
  String get greekSaladText {
    return Intl.message(
      'Greek salad with lettuce, green onion,',
      name: 'greekSaladText',
      desc: '',
      args: [],
    );
  }

  /// `kcal`
  String get kcal {
    return Intl.message(
      'kcal',
      name: 'kcal',
      desc: '',
      args: [],
    );
  }

  /// `Salad of fresh vegetables`
  String get saladVegetablesText {
    return Intl.message(
      'Salad of fresh vegetables',
      name: 'saladVegetablesText',
      desc: '',
      args: [],
    );
  }

  /// `Additional Exercise`
  String get addExerciseText {
    return Intl.message(
      'Additional Exercise',
      name: 'addExerciseText',
      desc: '',
      args: [],
    );
  }

  /// `Exercises with Jumping Rope`
  String get jumpingRopeText {
    return Intl.message(
      'Exercises with Jumping Rope',
      name: 'jumpingRopeText',
      desc: '',
      args: [],
    );
  }

  /// `Exercises with Holding Jumping Rope `
  String get holdingJumpingText {
    return Intl.message(
      'Exercises with Holding Jumping Rope ',
      name: 'holdingJumpingText',
      desc: '',
      args: [],
    );
  }

  /// `Exercises with Sitting Dumbbells`
  String get sittingDumbbellsText {
    return Intl.message(
      'Exercises with Sitting Dumbbells',
      name: 'sittingDumbbellsText',
      desc: '',
      args: [],
    );
  }

  /// `Basic member`
  String get basicMemberText {
    return Intl.message(
      'Basic member',
      name: 'basicMemberText',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Plans`
  String get plan {
    return Intl.message(
      'Plans',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get training {
    return Intl.message(
      'Training',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message(
      'My Account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `My Favorites`
  String get myFavorite {
    return Intl.message(
      'My Favorites',
      name: 'myFavorite',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get appSetting {
    return Intl.message(
      'App Settings',
      name: 'appSetting',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contactSupport {
    return Intl.message(
      'Contact Support',
      name: 'contactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
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

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `year`
  String get year {
    return Intl.message(
      'year',
      name: 'year',
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

  /// `Goal`
  String get titleGoal {
    return Intl.message(
      'Goal',
      name: 'titleGoal',
      desc: '',
      args: [],
    );
  }

  /// `Macronutrient Goals`
  String get macronutrient {
    return Intl.message(
      'Macronutrient Goals',
      name: 'macronutrient',
      desc: '',
      args: [],
    );
  }

  /// `Protein`
  String get protein {
    return Intl.message(
      'Protein',
      name: 'protein',
      desc: '',
      args: [],
    );
  }

  /// `Carbs`
  String get carbs {
    return Intl.message(
      'Carbs',
      name: 'carbs',
      desc: '',
      args: [],
    );
  }

  /// `Fat`
  String get fat {
    return Intl.message(
      'Fat',
      name: 'fat',
      desc: '',
      args: [],
    );
  }

  /// `Grams per day`
  String get gramPer {
    return Intl.message(
      'Grams per day',
      name: 'gramPer',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Chest`
  String get chest {
    return Intl.message(
      'Chest',
      name: 'chest',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get levelTitle {
    return Intl.message(
      'Level',
      name: 'levelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Exercise Program`
  String get exerciseProgram {
    return Intl.message(
      'Exercise Program',
      name: 'exerciseProgram',
      desc: '',
      args: [],
    );
  }

  /// `{weekNumber} Weeks - {exerciseNumber} Exercises`
  String exerciseDetail(int weekNumber, int exerciseNumber) {
    return Intl.message(
      '$weekNumber Weeks - $exerciseNumber Exercises',
      name: 'exerciseDetail',
      desc: '',
      args: [weekNumber, exerciseNumber],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Full Exercise`
  String get fullExercise {
    return Intl.message(
      'Full Exercise',
      name: 'fullExercise',
      desc: '',
      args: [],
    );
  }

  /// `2.20462262`
  String get kgToLbs {
    return Intl.message(
      '2.20462262',
      name: 'kgToLbs',
      desc: '',
      args: [],
    );
  }

  /// `0.45359237`
  String get LbsToKg {
    return Intl.message(
      '0.45359237',
      name: 'LbsToKg',
      desc: '',
      args: [],
    );
  }

  /// `0.032808399`
  String get cmToFeet {
    return Intl.message(
      '0.032808399',
      name: 'cmToFeet',
      desc: '',
      args: [],
    );
  }

  /// `30.48`
  String get feetToCm {
    return Intl.message(
      '30.48',
      name: 'feetToCm',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredValue {
    return Intl.message(
      'This field is required',
      name: 'requiredValue',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get emailValid {
    return Intl.message(
      'Enter a valid email address',
      name: 'emailValid',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid password`
  String get passwordValid {
    return Intl.message(
      'Enter a valid password',
      name: 'passwordValid',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 digits long`
  String get lengthPassText {
    return Intl.message(
      'Password must be at least 6 digits long',
      name: 'lengthPassText',
      desc: '',
      args: [],
    );
  }

  /// `Password least uppercase and special character.`
  String get characterPassText {
    return Intl.message(
      'Password least uppercase and special character.',
      name: 'characterPassText',
      desc: '',
      args: [],
    );
  }

  /// `Well Done!`
  String get wellDone {
    return Intl.message(
      'Well Done!',
      name: 'wellDone',
      desc: '',
      args: [],
    );
  }

  /// `Oh snap!`
  String get ohSnap {
    return Intl.message(
      'Oh snap!',
      name: 'ohSnap',
      desc: '',
      args: [],
    );
  }

  /// `Login success!`
  String get messageSuccess {
    return Intl.message(
      'Login success!',
      name: 'messageSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Email or password is incorrect!`
  String get errorMessage {
    return Intl.message(
      'Email or password is incorrect!',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Log out of your account?`
  String get logOutTitle {
    return Intl.message(
      'Log out of your account?',
      name: 'logOutTitle',
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

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Perfect Body \n Doing `
  String get bodyText {
    return Intl.message(
      'Perfect Body \n Doing ',
      name: 'bodyText',
      desc: '',
      args: [],
    );
  }

  /// `Crossfit \n`
  String get crossfitText {
    return Intl.message(
      'Crossfit \n',
      name: 'crossfitText',
      desc: '',
      args: [],
    );
  }

  /// `Exercises`
  String get exercises {
    return Intl.message(
      'Exercises',
      name: 'exercises',
      desc: '',
      args: [],
    );
  }

  /// `Shot Strong \n`
  String get strongText {
    return Intl.message(
      'Shot Strong \n',
      name: 'strongText',
      desc: '',
      args: [],
    );
  }

  /// `Timeless \n`
  String get timelessText {
    return Intl.message(
      'Timeless \n',
      name: 'timelessText',
      desc: '',
      args: [],
    );
  }

  /// `Woman Training`
  String get womanText {
    return Intl.message(
      'Woman Training',
      name: 'womanText',
      desc: '',
      args: [],
    );
  }

  /// `Healthy Muscular \n`
  String get healthyText {
    return Intl.message(
      'Healthy Muscular \n',
      name: 'healthyText',
      desc: '',
      args: [],
    );
  }

  /// `Sportswoman \n`
  String get sportswomanText {
    return Intl.message(
      'Sportswoman \n',
      name: 'sportswomanText',
      desc: '',
      args: [],
    );
  }

  /// `Standing`
  String get standingText {
    return Intl.message(
      'Standing',
      name: 'standingText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<FAUiS> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<FAUiS> load(Locale locale) => FAUiS.load(locale);
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
