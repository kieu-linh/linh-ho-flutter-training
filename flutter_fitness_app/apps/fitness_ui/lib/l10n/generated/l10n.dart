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

  /// `Chúng tôi huấn luyện cơ thể của bạn \n trở nên tuyệt vời và khỏe mạnh.`
  String get splashDescription {
    return Intl.message(
      'Chúng tôi huấn luyện cơ thể của bạn \n trở nên tuyệt vời và khỏe mạnh.',
      name: 'splashDescription',
      desc: '',
      args: [],
    );
  }

  /// `BẮT ĐẦU NGAY`
  String get buttonStartText {
    return Intl.message(
      'BẮT ĐẦU NGAY',
      name: 'buttonStartText',
      desc: '',
      args: [],
    );
  }

  /// `Bỏ qua`
  String get skipPageText {
    return Intl.message(
      'Bỏ qua',
      name: 'skipPageText',
      desc: '',
      args: [],
    );
  }

  /// `TIẾP THEO`
  String get nextPageText {
    return Intl.message(
      'TIẾP THEO',
      name: 'nextPageText',
      desc: '',
      args: [],
    );
  }

  /// `Chào mừng bạn đến với Pro Fitness!`
  String get fitnessTitle {
    return Intl.message(
      'Chào mừng bạn đến với Pro Fitness!',
      name: 'fitnessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xin chào, đăng nhập để \ntiếp tục!`
  String get signInText {
    return Intl.message(
      'Xin chào, đăng nhập để \ntiếp tục!',
      name: 'signInText',
      desc: '',
      args: [],
    );
  }

  /// `Địa chỉ Email`
  String get EmailHintText {
    return Intl.message(
      'Địa chỉ Email',
      name: 'EmailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get passwordHintText {
    return Intl.message(
      'Mật khẩu',
      name: 'passwordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get forgotPasswordText {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'forgotPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get loginText {
    return Intl.message(
      'Đăng nhập',
      name: 'loginText',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc Đăng nhập với`
  String get loginWithText {
    return Intl.message(
      'Hoặc Đăng nhập với',
      name: 'loginWithText',
      desc: '',
      args: [],
    );
  }

  /// `Kết nối với Google`
  String get googleText {
    return Intl.message(
      'Kết nối với Google',
      name: 'googleText',
      desc: '',
      args: [],
    );
  }

  /// `Kết nối với Facebook`
  String get facebookText {
    return Intl.message(
      'Kết nối với Facebook',
      name: 'facebookText',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký!`
  String get registerText {
    return Intl.message(
      'Đăng ký!',
      name: 'registerText',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chưa có tài khoản? `
  String get signInDescription {
    return Intl.message(
      'Bạn chưa có tài khoản? ',
      name: 'signInDescription',
      desc: '',
      args: [],
    );
  }

  /// `Chọn Yêu thích của bạn`
  String get yourFavoriteText {
    return Intl.message(
      'Chọn Yêu thích của bạn',
      name: 'yourFavoriteText',
      desc: '',
      args: [],
    );
  }

  /// `CÁC BƯỚC TIẾP THEO`
  String get nextStepText {
    return Intl.message(
      'CÁC BƯỚC TIẾP THEO',
      name: 'nextStepText',
      desc: '',
      args: [],
    );
  }

  /// `Hoàn tất Bước`
  String get finishStepText {
    return Intl.message(
      'Hoàn tất Bước',
      name: 'finishStepText',
      desc: '',
      args: [],
    );
  }

  /// `Bắt đầu!`
  String get getStartedText {
    return Intl.message(
      'Bắt đầu!',
      name: 'getStartedText',
      desc: '',
      args: [],
    );
  }

  /// `Bạn bao nhiêu tuổi?`
  String get yourOldText {
    return Intl.message(
      'Bạn bao nhiêu tuổi?',
      name: 'yourOldText',
      desc: '',
      args: [],
    );
  }

  /// `Bước {currentStep} trong {numberOfSteps}`
  String stepPageText(int currentStep, int numberOfSteps) {
    return Intl.message(
      'Bước $currentStep trong $numberOfSteps',
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

  /// `Bạn nặng bao nhiêu?`
  String get weightTitle {
    return Intl.message(
      'Bạn nặng bao nhiêu?',
      name: 'weightTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mục tiêu cân nặng của bạn là gì?`
  String get goalWeightTitle {
    return Intl.message(
      'Mục tiêu cân nặng của bạn là gì?',
      name: 'goalWeightTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bạn cao bao nhiêu?`
  String get heightTitle {
    return Intl.message(
      'Bạn cao bao nhiêu?',
      name: 'heightTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cấp độ tập luyện của bạn là gì?`
  String get levelText {
    return Intl.message(
      'Cấp độ tập luyện của bạn là gì?',
      name: 'levelText',
      desc: '',
      args: [],
    );
  }

  /// `Mục tiêu của bạn là gì`
  String get goalText {
    return Intl.message(
      'Mục tiêu của bạn là gì',
      name: 'goalText',
      desc: '',
      args: [],
    );
  }

  /// `Hãy bắt đầu`
  String get startText {
    return Intl.message(
      'Hãy bắt đầu',
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

  /// `Mới bắt đầu`
  String get beginner {
    return Intl.message(
      'Mới bắt đầu',
      name: 'beginner',
      desc: '',
      args: [],
    );
  }

  /// `Trung bình`
  String get intermediate {
    return Intl.message(
      'Trung bình',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Nâng cao`
  String get advanced {
    return Intl.message(
      'Nâng cao',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Giảm cân`
  String get weightLoss {
    return Intl.message(
      'Giảm cân',
      name: 'weightLoss',
      desc: '',
      args: [],
    );
  }

  /// `Tăng cơ`
  String get gainMuscle {
    return Intl.message(
      'Tăng cơ',
      name: 'gainMuscle',
      desc: '',
      args: [],
    );
  }

  /// `Nâng cao sức khỏe`
  String get improveFitness {
    return Intl.message(
      'Nâng cao sức khỏe',
      name: 'improveFitness',
      desc: '',
      args: [],
    );
  }

  /// `Đoạn văn tiêu chuẩn Lorem Ipsum \n được sử dụng từ những năm 1500 được tái tạo dưới đây \n cho những ai quan tâm.`
  String get startDescription {
    return Intl.message(
      'Đoạn văn tiêu chuẩn Lorem Ipsum \n được sử dụng từ những năm 1500 được tái tạo dưới đây \n cho những ai quan tâm.',
      name: 'startDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tạo dáng cho cơ thể `
  String get firstStartText {
    return Intl.message(
      'Tạo dáng cho cơ thể ',
      name: 'firstStartText',
      desc: '',
      args: [],
    );
  }

  /// `lý tưởng của bạn, `
  String get secondStartText {
    return Intl.message(
      'lý tưởng của bạn, ',
      name: 'secondStartText',
      desc: '',
      args: [],
    );
  }

  /// `giải phóng bản thân \n thật sự của bạn, biến đổi cuộc sống của bạn.`
  String get thirdStartText {
    return Intl.message(
      'giải phóng bản thân \n thật sự của bạn, biến đổi cuộc sống của bạn.',
      name: 'thirdStartText',
      desc: '',
      args: [],
    );
  }

  /// `Xin chào, Buổi sáng tốt lành`
  String get morningTitle {
    return Intl.message(
      'Xin chào, Buổi sáng tốt lành',
      name: 'morningTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xin chào, Buổi chiều tốt lành`
  String get afternoonTitle {
    return Intl.message(
      'Xin chào, Buổi chiều tốt lành',
      name: 'afternoonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Xin chào, Buổi tối tốt lành`
  String get eveningTitle {
    return Intl.message(
      'Xin chào, Buổi tối tốt lành',
      name: 'eveningTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tìm kiếm`
  String get searchText {
    return Intl.message(
      'Tìm kiếm',
      name: 'searchText',
      desc: '',
      args: [],
    );
  }

  /// `Phụ nữ trẻ đang tập luyện \n giãn cơ`
  String get cardTitle {
    return Intl.message(
      'Phụ nữ trẻ đang tập luyện \n giãn cơ',
      name: 'cardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bắt đầu tập`
  String get buttonCardText {
    return Intl.message(
      'Bắt đầu tập',
      name: 'buttonCardText',
      desc: '',
      args: [],
    );
  }

  /// `Chọn mục tiêu của bạn`
  String get selectGoalText {
    return Intl.message(
      'Chọn mục tiêu của bạn',
      name: 'selectGoalText',
      desc: '',
      args: [],
    );
  }

  /// `Giảm cân`
  String get looseWeightText {
    return Intl.message(
      'Giảm cân',
      name: 'looseWeightText',
      desc: '',
      args: [],
    );
  }

  /// `Tăng cân`
  String get gainWeightText {
    return Intl.message(
      'Tăng cân',
      name: 'gainWeightText',
      desc: '',
      args: [],
    );
  }

  /// `Xây dựng cơ bắp`
  String get bodyBuildingText {
    return Intl.message(
      'Xây dựng cơ bắp',
      name: 'bodyBuildingText',
      desc: '',
      args: [],
    );
  }

  /// `Khỏe mạnh`
  String get healthy {
    return Intl.message(
      'Khỏe mạnh',
      name: 'healthy',
      desc: '',
      args: [],
    );
  }

  /// `Thể loại`
  String get category {
    return Intl.message(
      'Thể loại',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Xem tất cả`
  String get seeAll {
    return Intl.message(
      'Xem tất cả',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Phòng tập`
  String get gym {
    return Intl.message(
      'Phòng tập',
      name: 'gym',
      desc: '',
      args: [],
    );
  }

  /// `Thể dục cardio`
  String get cardio {
    return Intl.message(
      'Thể dục cardio',
      name: 'cardio',
      desc: '',
      args: [],
    );
  }

  /// `Giãn cơ`
  String get stretch {
    return Intl.message(
      'Giãn cơ',
      name: 'stretch',
      desc: '',
      args: [],
    );
  }

  /// `Toàn bộ cơ thể`
  String get fullBody {
    return Intl.message(
      'Toàn bộ cơ thể',
      name: 'fullBody',
      desc: '',
      args: [],
    );
  }

  /// `Chân`
  String get legs {
    return Intl.message(
      'Chân',
      name: 'legs',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get home {
    return Intl.message(
      'Trang chủ',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Kế hoạch dinh dưỡng`
  String get mealPlans {
    return Intl.message(
      'Kế hoạch dinh dưỡng',
      name: 'mealPlans',
      desc: '',
      args: [],
    );
  }

  /// `Bài tập`
  String get exercise {
    return Intl.message(
      'Bài tập',
      name: 'exercise',
      desc: '',
      args: [],
    );
  }

  /// `Hồ sơ`
  String get profile {
    return Intl.message(
      'Hồ sơ',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Bài tập phổ biến`
  String get popularExerciseDescription {
    return Intl.message(
      'Bài tập phổ biến',
      name: 'popularExerciseDescription',
      desc: '',
      args: [],
    );
  }

  /// `Hình phụ nữ giãn cơ tay`
  String get stretchingArmText {
    return Intl.message(
      'Hình phụ nữ giãn cơ tay',
      name: 'stretchingArmText',
      desc: '',
      args: [],
    );
  }

  /// `phút`
  String get min {
    return Intl.message(
      'phút',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Vận động viên tập luyện một màu`
  String get athleteDescription {
    return Intl.message(
      'Vận động viên tập luyện một màu',
      name: 'athleteDescription',
      desc: '',
      args: [],
    );
  }

  /// `Salad Hy Lạp với rau sống, hành tây xanh,`
  String get greekSaladText {
    return Intl.message(
      'Salad Hy Lạp với rau sống, hành tây xanh,',
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

  /// `Salad rau sống`
  String get saladVegetablesText {
    return Intl.message(
      'Salad rau sống',
      name: 'saladVegetablesText',
      desc: '',
      args: [],
    );
  }

  /// `Thêm Bài tập`
  String get addExerciseText {
    return Intl.message(
      'Thêm Bài tập',
      name: 'addExerciseText',
      desc: '',
      args: [],
    );
  }

  /// `Bài tập nhảy dây`
  String get jumpingRopeText {
    return Intl.message(
      'Bài tập nhảy dây',
      name: 'jumpingRopeText',
      desc: '',
      args: [],
    );
  }

  /// `Bài tập nhảy dây kết hợp`
  String get holdingJumpingText {
    return Intl.message(
      'Bài tập nhảy dây kết hợp',
      name: 'holdingJumpingText',
      desc: '',
      args: [],
    );
  }

  /// `Bài tập với tạ ngồi`
  String get sittingDumbbellsText {
    return Intl.message(
      'Bài tập với tạ ngồi',
      name: 'sittingDumbbellsText',
      desc: '',
      args: [],
    );
  }

  /// `Thành viên cơ bản`
  String get basicMemberText {
    return Intl.message(
      'Thành viên cơ bản',
      name: 'basicMemberText',
      desc: '',
      args: [],
    );
  }

  /// `Bảng điều khiển`
  String get dashboard {
    return Intl.message(
      'Bảng điều khiển',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Kế hoạch`
  String get plan {
    return Intl.message(
      'Kế hoạch',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `Huấn luyện`
  String get training {
    return Intl.message(
      'Huấn luyện',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Thể loại`
  String get categories {
    return Intl.message(
      'Thể loại',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản của tôi`
  String get myAccount {
    return Intl.message(
      'Tài khoản của tôi',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `Yêu thích của tôi`
  String get myFavorite {
    return Intl.message(
      'Yêu thích của tôi',
      name: 'myFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt ứng dụng`
  String get appSetting {
    return Intl.message(
      'Cài đặt ứng dụng',
      name: 'appSetting',
      desc: '',
      args: [],
    );
  }

  /// `Liên hệ Hỗ trợ`
  String get contactSupport {
    return Intl.message(
      'Liên hệ Hỗ trợ',
      name: 'contactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get signOut {
    return Intl.message(
      'Đăng xuất',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Cân nặng`
  String get weight {
    return Intl.message(
      'Cân nặng',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Chiều cao`
  String get height {
    return Intl.message(
      'Chiều cao',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `năm`
  String get year {
    return Intl.message(
      'năm',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Tuổi`
  String get age {
    return Intl.message(
      'Tuổi',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Mục tiêu`
  String get titleGoal {
    return Intl.message(
      'Mục tiêu',
      name: 'titleGoal',
      desc: '',
      args: [],
    );
  }

  /// `Mục tiêu dinh dưỡng chính`
  String get macronutrient {
    return Intl.message(
      'Mục tiêu dinh dưỡng chính',
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

  /// `Carbohydrate`
  String get carbs {
    return Intl.message(
      'Carbohydrate',
      name: 'carbs',
      desc: '',
      args: [],
    );
  }

  /// `Chất béo`
  String get fat {
    return Intl.message(
      'Chất béo',
      name: 'fat',
      desc: '',
      args: [],
    );
  }

  /// `Gram mỗi ngày`
  String get gramPer {
    return Intl.message(
      'Gram mỗi ngày',
      name: 'gramPer',
      desc: '',
      args: [],
    );
  }

  /// `Quay lại`
  String get back {
    return Intl.message(
      'Quay lại',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Ngực`
  String get chest {
    return Intl.message(
      'Ngực',
      name: 'chest',
      desc: '',
      args: [],
    );
  }

  /// `Cấp độ`
  String get levelTitle {
    return Intl.message(
      'Cấp độ',
      name: 'levelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lịch trình`
  String get schedule {
    return Intl.message(
      'Lịch trình',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Chương trình tập luyện`
  String get exerciseProgram {
    return Intl.message(
      'Chương trình tập luyện',
      name: 'exerciseProgram',
      desc: '',
      args: [],
    );
  }

  /// `{weekNumber} Tuần - {exerciseNumber} Bài tập`
  String exerciseDetail(int weekNumber, int exerciseNumber) {
    return Intl.message(
      '$weekNumber Tuần - $exerciseNumber Bài tập',
      name: 'exerciseDetail',
      desc: '',
      args: [weekNumber, exerciseNumber],
    );
  }

  /// `Bắt đầu ngay`
  String get startNow {
    return Intl.message(
      'Bắt đầu ngay',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Toàn bộ Bài tập`
  String get fullExercise {
    return Intl.message(
      'Toàn bộ Bài tập',
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

  /// `Trường này là bắt buộc`
  String get requiredValue {
    return Intl.message(
      'Trường này là bắt buộc',
      name: 'requiredValue',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập một địa chỉ email hợp lệ`
  String get emailValid {
    return Intl.message(
      'Vui lòng nhập một địa chỉ email hợp lệ',
      name: 'emailValid',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mật khẩu hợp lệ`
  String get passwordValid {
    return Intl.message(
      'Vui lòng nhập mật khẩu hợp lệ',
      name: 'passwordValid',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu phải có ít nhất 6 ký tự`
  String get lengthPassText {
    return Intl.message(
      'Mật khẩu phải có ít nhất 6 ký tự',
      name: 'lengthPassText',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu phải có chữ hoa và ký tự đặc biệt ít nhất.`
  String get characterPassText {
    return Intl.message(
      'Mật khẩu phải có chữ hoa và ký tự đặc biệt ít nhất.',
      name: 'characterPassText',
      desc: '',
      args: [],
    );
  }

  /// `Tốt lắm!`
  String get wellDone {
    return Intl.message(
      'Tốt lắm!',
      name: 'wellDone',
      desc: '',
      args: [],
    );
  }

  /// `Ồ!`
  String get ohSnap {
    return Intl.message(
      'Ồ!',
      name: 'ohSnap',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập thành công!`
  String get messageSuccess {
    return Intl.message(
      'Đăng nhập thành công!',
      name: 'messageSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Email hoặc mật khẩu không chính xác!`
  String get errorMessage {
    return Intl.message(
      'Email hoặc mật khẩu không chính xác!',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất khỏi tài khoản của bạn?`
  String get logOutTitle {
    return Intl.message(
      'Đăng xuất khỏi tài khoản của bạn?',
      name: 'logOutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hủy`
  String get cancel {
    return Intl.message(
      'Hủy',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get logOut {
    return Intl.message(
      'Đăng xuất',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Cơ thể hoàn hảo \n đang thực hiện `
  String get bodyText {
    return Intl.message(
      'Cơ thể hoàn hảo \n đang thực hiện ',
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

  /// `Bài tập`
  String get exercises {
    return Intl.message(
      'Bài tập',
      name: 'exercises',
      desc: '',
      args: [],
    );
  }

  /// `Mạnh mẽ \n`
  String get strongText {
    return Intl.message(
      'Mạnh mẽ \n',
      name: 'strongText',
      desc: '',
      args: [],
    );
  }

  /// `Bất kỳ lúc nào \n`
  String get timelessText {
    return Intl.message(
      'Bất kỳ lúc nào \n',
      name: 'timelessText',
      desc: '',
      args: [],
    );
  }

  /// `Phụ nữ tập luyện`
  String get womanText {
    return Intl.message(
      'Phụ nữ tập luyện',
      name: 'womanText',
      desc: '',
      args: [],
    );
  }

  /// `Sức khỏe cơ bắp \n`
  String get healthyText {
    return Intl.message(
      'Sức khỏe cơ bắp \n',
      name: 'healthyText',
      desc: '',
      args: [],
    );
  }

  /// `Người phụ nữ thể thao \n`
  String get sportswomanText {
    return Intl.message(
      'Người phụ nữ thể thao \n',
      name: 'sportswomanText',
      desc: '',
      args: [],
    );
  }

  /// `Đứng`
  String get standingText {
    return Intl.message(
      'Đứng',
      name: 'standingText',
      desc: '',
      args: [],
    );
  }

  /// `TẠO TÀI KHOẢN`
  String get createAccountTitle {
    return Intl.message(
      'TẠO TÀI KHOẢN',
      name: 'createAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập thông tin của bạn để \ntiếp tục `
  String get signUpDescription {
    return Intl.message(
      'Vui lòng nhập thông tin của bạn để \ntiếp tục ',
      name: 'signUpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Họ và tên`
  String get fullNameText {
    return Intl.message(
      'Họ và tên',
      name: 'fullNameText',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu`
  String get confirmPassText {
    return Intl.message(
      'Xác nhận mật khẩu',
      name: 'confirmPassText',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc Đăng ký với`
  String get registerWithText {
    return Intl.message(
      'Hoặc Đăng ký với',
      name: 'registerWithText',
      desc: '',
      args: [],
    );
  }

  /// `Đã có tài khoản?`
  String get haveAccountText {
    return Intl.message(
      'Đã có tài khoản?',
      name: 'haveAccountText',
      desc: '',
      args: [],
    );
  }

  /// ` Đăng nhập`
  String get loginButtonText {
    return Intl.message(
      ' Đăng nhập',
      name: 'loginButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản đã tồn tại!`
  String get accountExist {
    return Intl.message(
      'Tài khoản đã tồn tại!',
      name: 'accountExist',
      desc: '',
      args: [],
    );
  }

  /// `Tạo tài khoản thành công!`
  String get createAccount {
    return Intl.message(
      'Tạo tài khoản thành công!',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Bạn muốn đăng xuất?`
  String get logOutText {
    return Intl.message(
      'Bạn muốn đăng xuất?',
      name: 'logOutText',
      desc: '',
      args: [],
    );
  }

  /// `Cân nặng phải nằm trong khoảng từ 10 đến 200`
  String get roleWeight {
    return Intl.message(
      'Cân nặng phải nằm trong khoảng từ 10 đến 200',
      name: 'roleWeight',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số`
  String get enterNumber {
    return Intl.message(
      'Vui lòng nhập số',
      name: 'enterNumber',
      desc: '',
      args: [],
    );
  }

  /// `Chiều cao phải nằm trong khoảng từ 100 đến 200`
  String get roleHeight {
    return Intl.message(
      'Chiều cao phải nằm trong khoảng từ 100 đến 200',
      name: 'roleHeight',
      desc: '',
      args: [],
    );
  }

  /// `Tuổi phải nằm trong khoảng từ 6 đến 90`
  String get roleAge {
    return Intl.message(
      'Tuổi phải nằm trong khoảng từ 6 đến 90',
      name: 'roleAge',
      desc: '',
      args: [],
    );
  }

  /// `CÀI ĐẶT ỨNG DỤNG`
  String get setting {
    return Intl.message(
      'CÀI ĐẶT ỨNG DỤNG',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Nhắc nhở`
  String get reminder {
    return Intl.message(
      'Nhắc nhở',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi mật khẩu`
  String get changePass {
    return Intl.message(
      'Thay đổi mật khẩu',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `Sức khỏe Apple`
  String get apple {
    return Intl.message(
      'Sức khỏe Apple',
      name: 'apple',
      desc: '',
      args: [],
    );
  }

  /// `Chế độ Tối`
  String get darkMode {
    return Intl.message(
      'Chế độ Tối',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Ngôn ngữ`
  String get language {
    return Intl.message(
      'Ngôn ngữ',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng Anh`
  String get english {
    return Intl.message(
      'Tiếng Anh',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `NÂNG CẤP PREMIUM`
  String get upgrade {
    return Intl.message(
      'NÂNG CẤP PREMIUM',
      name: 'upgrade',
      desc: '',
      args: [],
    );
  }

  /// `QUÊN MẬT KHẨU`
  String get forgotPass {
    return Intl.message(
      'QUÊN MẬT KHẨU',
      name: 'forgotPass',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập email của bạn dưới đây để nhận \nmã đặt lại mật khẩu của bạn.`
  String get descriptionForgotPass {
    return Intl.message(
      'Vui lòng nhập email của bạn dưới đây để nhận \nmã đặt lại mật khẩu của bạn.',
      name: 'descriptionForgotPass',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `ĐẶT LẠI MẬT KHẨU`
  String get resetPass {
    return Intl.message(
      'ĐẶT LẠI MẬT KHẨU',
      name: 'resetPass',
      desc: '',
      args: [],
    );
  }

  /// `XÁC MINH TÀI KHOẢN`
  String get verifyAccount {
    return Intl.message(
      'XÁC MINH TÀI KHOẢN',
      name: 'verifyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Xác minh tài khoản của bạn bằng cách nhập mã xác minh chúng tôi đã gửi đến`
  String get verifyDescription {
    return Intl.message(
      'Xác minh tài khoản của bạn bằng cách nhập mã xác minh chúng tôi đã gửi đến',
      name: 'verifyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật thành công!`
  String get updateSuccess {
    return Intl.message(
      'Cập nhật thành công!',
      name: 'updateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `CHỈNH SỬA HỒ SƠ`
  String get editProfile {
    return Intl.message(
      'CHỈNH SỬA HỒ SƠ',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Giới tính`
  String get gender {
    return Intl.message(
      'Giới tính',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `{kcal} kcal`
  String kcalText(int kcal) {
    return Intl.message(
      '$kcal kcal',
      name: 'kcalText',
      desc: '',
      args: [kcal],
    );
  }

  /// `{min} phút`
  String minText(int min) {
    return Intl.message(
      '$min phút',
      name: 'minText',
      desc: '',
      args: [min],
    );
  }

  /// `KẾ HOẠCH BỮA ĂN`
  String get mealPlan {
    return Intl.message(
      'KẾ HOẠCH BỮA ĂN',
      name: 'mealPlan',
      desc: '',
      args: [],
    );
  }

  /// `LỊCH TRÌNH TẬP LUYỆN`
  String get scheduleText {
    return Intl.message(
      'LỊCH TRÌNH TẬP LUYỆN',
      name: 'scheduleText',
      desc: '',
      args: [],
    );
  }

  /// `Ngày`
  String get date {
    return Intl.message(
      'Ngày',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian`
  String get time {
    return Intl.message(
      'Thời gian',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Đặt nhắc nhở`
  String get setReminder {
    return Intl.message(
      'Đặt nhắc nhở',
      name: 'setReminder',
      desc: '',
      args: [],
    );
  }

  /// `Nhắc nhở vào`
  String get reminderOn {
    return Intl.message(
      'Nhắc nhở vào',
      name: 'reminderOn',
      desc: '',
      args: [],
    );
  }

  /// `HOÀN TẤT`
  String get done {
    return Intl.message(
      'HOÀN TẤT',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get notification {
    return Intl.message(
      'Thông báo',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Sẵn sàng để bắt đầu! Đến lúc tập luyện.`
  String get textNotify {
    return Intl.message(
      'Sẵn sàng để bắt đầu! Đến lúc tập luyện.',
      name: 'textNotify',
      desc: '',
      args: [],
    );
  }

  /// `Đặt nhắc nhở thành công`
  String get reminderSuccess {
    return Intl.message(
      'Đặt nhắc nhở thành công',
      name: 'reminderSuccess',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<FAUiS> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
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
