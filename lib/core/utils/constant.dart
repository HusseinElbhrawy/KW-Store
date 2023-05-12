import 'package:flutter/material.dart';

import 'dimensions.dart';

class AppConstant {
  static const facebookLink = 'https://www.facebook.com/HusseinElbhrawy';
  static const whatsappUrl = "whatsapp://send?phone=+201069233929";
  static const linkedInLink =
      'https://www.linkedin.com/in/hussein-elbhrawy-0737631b1/';
  static const githubLink = 'https://github.com/HusseinElbhrawy';
  static const websiteLink = 'https://husseinelbhrawy.tk';

  static const String defaultAddress = 'defaultAddress';

  static String kDarkMode = 'DARK_MODE';

  const AppConstant._();
  static const AppConstant _instance = AppConstant._();
  factory AppConstant() => _instance;

  static Widget horizontalDivider() => const Divider(color: Colors.transparent);
  static Widget verticalDivider() =>
      const VerticalDivider(color: Colors.transparent);

  static int get splashTime => 2;
  static double defaultPadding(BuildContext context) {
    return AppDimensions.width30(context) * 1.2;
  }

  static Size defaultButtonSize(BuildContext context) {
    return Size.fromHeight(
      AppDimensions.height45(context),
    );
  }

  static const String kProfileKey = 'profile';
  static const String kUserUID = 'UID';
  static const String kOnBoarding = 'ONBOARDING';

  static const String comingSoonImageLink =
      'https://th.bing.com/th/id/R.f50205f294eb04607ab618dc7b7e90c1?rik=FCauvz4EfBY3fw&pid=ImgRaw&r=0';

  static const int kDefaultAnimationDuration = 400;

  static List<String> kErrorImage = [
    'assets/svg/error/error_1.svg',
    'assets/svg/error/error_2.svg',
    'assets/svg/error/error_3.svg',
    'assets/svg/error/error_4.svg',
    'assets/svg/error/error_5.svg',
    'assets/svg/error/error_6.svg',
  ];

  static const String generalDatabaseName = 'local_data_base';
  static const String addressDatabase = 'address_database';

  static const paymentApiKey =
      'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnVZVzFsSWpvaU1UWTFNak13TURJNE5TNHpNekkxTWpjaUxDSndjbTltYVd4bFgzQnJJam94TnpNeE1qRXNJbU5zWVhOeklqb2lUV1Z5WTJoaGJuUWlmUS5ud0dlQUdzbHZhRHRRLTRuSkZiR2JPY3RnSkNjVkc1QUplR2IwejJYem55ZVBTWmpwbnNPR21KVzNfV0NSZFEtLUQ0dlBaekdWVF9ENzE4VVFqTzVxUQ==';
}
