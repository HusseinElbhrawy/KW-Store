const String imagePath = 'assets/images';
const String svgPath = 'assets/svg';
const String lottiePath = 'assets/lottie';

class AppImagesAssets {
  AppImagesAssets._internal();
  static final AppImagesAssets _instance = AppImagesAssets._internal();
  factory AppImagesAssets() => _instance;

  static const appLogo = '$imagePath/slider1.png';
  static const onBoarding1 = '$imagePath/on_boarding_1.png';
  static const onBoarding2 = '$imagePath/on_boarding_2.png';
  static const onBoarding3 = '$imagePath/on_boarding_3.png';
  static const comingSoon = '$imagePath/coming_soon.png';
}

class AppSvgAssets {
  AppSvgAssets._internal();
  static final AppSvgAssets _instance = AppSvgAssets._internal();
  factory AppSvgAssets() => _instance;

  static const appLogo = '$svgPath/logo.svg';
  static const paypal = '$svgPath/paypal.svg';
  static const visa = '$svgPath/visa.svg';
  static const mastercard = '$svgPath/mastercard.svg';
}

class AppLottieAssets {
  AppLottieAssets._internal();
  static final AppLottieAssets _instance = AppLottieAssets._internal();
  factory AppLottieAssets() => _instance;

  static const empty = '$lottiePath/empty_box.json';
  static const paymentSuccess = '$lottiePath/payment_success.json';
}
