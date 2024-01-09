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
  String get firstTitleSplash {
    return Intl.message(
      'PRO ',
      name: 'firstTitleSplash',
      desc: '',
      args: [],
    );
  }

  /// `FITNESS`
  String get secondTitleSplash {
    return Intl.message(
      'FITNESS',
      name: 'secondTitleSplash',
      desc: '',
      args: [],
    );
  }

  /// `We train your body to be \n great and fit.`
  String get descriptionSplash {
    return Intl.message(
      'We train your body to be \n great and fit.',
      name: 'descriptionSplash',
      desc: '',
      args: [],
    );
  }

  /// `LET'S START`
  String get btnLetStart {
    return Intl.message(
      'LET\'S START',
      name: 'btnLetStart',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipPage {
    return Intl.message(
      'Skip',
      name: 'skipPage',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get nextPage {
    return Intl.message(
      'NEXT',
      name: 'nextPage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Pro Fitness!`
  String get displayLarge {
    return Intl.message(
      'Welcome to Pro Fitness!',
      name: 'displayLarge',
      desc: '',
      args: [],
    );
  }

  /// `Hello there, sign in to \ncontinue!`
  String get displayMedium {
    return Intl.message(
      'Hello there, sign in to \ncontinue!',
      name: 'displayMedium',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get hintTextEmail {
    return Intl.message(
      'Email Address',
      name: 'hintTextEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get hintTextPassword {
    return Intl.message(
      'Password',
      name: 'hintTextPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get btnLoginIn {
    return Intl.message(
      'Login',
      name: 'btnLoginIn',
      desc: '',
      args: [],
    );
  }

  /// `Or Login with`
  String get btnLoginWith {
    return Intl.message(
      'Or Login with',
      name: 'btnLoginWith',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Google`
  String get btnGoogle {
    return Intl.message(
      'Connect with Google',
      name: 'btnGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Connect with Facebook`
  String get btnFacebook {
    return Intl.message(
      'Connect with Facebook',
      name: 'btnFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Register!`
  String get btnRegister {
    return Intl.message(
      'Register!',
      name: 'btnRegister',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get descriptionSignIn {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'descriptionSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Favorite`
  String get yourFavorite {
    return Intl.message(
      'Select Your Favorite',
      name: 'yourFavorite',
      desc: '',
      args: [],
    );
  }

  /// `NEXT STEPS`
  String get btnNextStep {
    return Intl.message(
      'NEXT STEPS',
      name: 'btnNextStep',
      desc: '',
      args: [],
    );
  }

  /// `Finish Steps`
  String get finishStep {
    return Intl.message(
      'Finish Steps',
      name: 'finishStep',
      desc: '',
      args: [],
    );
  }

  /// `Get Started!`
  String get getStarted {
    return Intl.message(
      'Get Started!',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `How old are you?`
  String get yourOld {
    return Intl.message(
      'How old are you?',
      name: 'yourOld',
      desc: '',
      args: [],
    );
  }

  /// `Step {currentStep} of {numberOfSteps}`
  String stepPage(int currentStep, int numberOfSteps) {
    return Intl.message(
      'Step $currentStep of $numberOfSteps',
      name: 'stepPage',
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
  String get goalWeight {
    return Intl.message(
      'What\'s your goal weight?',
      name: 'goalWeight',
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
  String get level {
    return Intl.message(
      'What\'s your fitness level?',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `What's your goal`
  String get goal {
    return Intl.message(
      'What\'s your goal',
      name: 'goal',
      desc: '',
      args: [],
    );
  }

  /// `Let's get started`
  String get start {
    return Intl.message(
      'Let\'s get started',
      name: 'start',
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
  String get textStart {
    return Intl.message(
      'The standard chunk of Lorem Ipsum \n used since the 1500s is reproduced below \n for those interested.',
      name: 'textStart',
      desc: '',
      args: [],
    );
  }

  /// `Sculpt your `
  String get textFirstStart {
    return Intl.message(
      'Sculpt your ',
      name: 'textFirstStart',
      desc: '',
      args: [],
    );
  }

  /// `ideal body, `
  String get textSecondStart {
    return Intl.message(
      'ideal body, ',
      name: 'textSecondStart',
      desc: '',
      args: [],
    );
  }

  /// `free your \n true self, transform your life.`
  String get textThirdStart {
    return Intl.message(
      'free your \n true self, transform your life.',
      name: 'textThirdStart',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Good Morning`
  String get morning {
    return Intl.message(
      'Hello, Good Morning',
      name: 'morning',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Good Afternoon`
  String get afternoon {
    return Intl.message(
      'Hello, Good Afternoon',
      name: 'afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Hello, Good Evening`
  String get evening {
    return Intl.message(
      'Hello, Good Evening',
      name: 'evening',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Fit Young Woman Doing Battle Stretch Training`
  String get titleCard {
    return Intl.message(
      'Fit Young Woman Doing Battle Stretch Training',
      name: 'titleCard',
      desc: '',
      args: [],
    );
  }

  /// `Start Exercise`
  String get textButtonCard {
    return Intl.message(
      'Start Exercise',
      name: 'textButtonCard',
      desc: '',
      args: [],
    );
  }

  /// `Select your Goal`
  String get selectGoal {
    return Intl.message(
      'Select your Goal',
      name: 'selectGoal',
      desc: '',
      args: [],
    );
  }

  /// `Loose Weight`
  String get looseWeight {
    return Intl.message(
      'Loose Weight',
      name: 'looseWeight',
      desc: '',
      args: [],
    );
  }

  /// `Gain Weight`
  String get gainWeight {
    return Intl.message(
      'Gain Weight',
      name: 'gainWeight',
      desc: '',
      args: [],
    );
  }

  /// `Body Building`
  String get bodyBuilding {
    return Intl.message(
      'Body Building',
      name: 'bodyBuilding',
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
  String get descriptionPopularExercise {
    return Intl.message(
      'Popular Exercise',
      name: 'descriptionPopularExercise',
      desc: '',
      args: [],
    );
  }

  /// `Full Shot Woman Stretching Arm`
  String get stretchingArm {
    return Intl.message(
      'Full Shot Woman Stretching Arm',
      name: 'stretchingArm',
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
  String get descriptionAthlete {
    return Intl.message(
      'Athlete Practicing Monochrome',
      name: 'descriptionAthlete',
      desc: '',
      args: [],
    );
  }

  /// `Greek salad with lettuce, green onion,`
  String get greekSalad {
    return Intl.message(
      'Greek salad with lettuce, green onion,',
      name: 'greekSalad',
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
  String get saladVegetables {
    return Intl.message(
      'Salad of fresh vegetables',
      name: 'saladVegetables',
      desc: '',
      args: [],
    );
  }

  /// `Additional Exercise`
  String get addExercise {
    return Intl.message(
      'Additional Exercise',
      name: 'addExercise',
      desc: '',
      args: [],
    );
  }

  /// `Exercises with Jumping Rope`
  String get jumpingRope {
    return Intl.message(
      'Exercises with Jumping Rope',
      name: 'jumpingRope',
      desc: '',
      args: [],
    );
  }

  /// `Exercises with Holding Jumping Rope `
  String get holdingJumping {
    return Intl.message(
      'Exercises with Holding Jumping Rope ',
      name: 'holdingJumping',
      desc: '',
      args: [],
    );
  }

  /// `Exercises with Sitting Dumbbells`
  String get sittingDumbbells {
    return Intl.message(
      'Exercises with Sitting Dumbbells',
      name: 'sittingDumbbells',
      desc: '',
      args: [],
    );
  }

  /// `Basic member`
  String get basicMember {
    return Intl.message(
      'Basic member',
      name: 'basicMember',
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
