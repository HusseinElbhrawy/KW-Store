import 'package:flutter/material.dart';
import 'package:kw_store/config/localization/translation_extension.dart';

class AppStrings {
  static String backToHome(BuildContext context) => 'backToHome'.tr(context)!;

  static String paymentSuccessful(BuildContext context) =>
      'paymentSuccessful'.tr(context)!;

  static String thankYouForPurchase(BuildContext context) =>
      'thankYouForPurchase'.tr(context)!;
  static String yourOrder(BuildContext context) => 'yourOrder'.tr(context)!;

  AppStrings._internal();
  static final AppStrings _instance = AppStrings._internal();
  factory AppStrings() => _instance;

  static const appName = 'E Commerce';

  //! OnBoarding Screen
  static String shoppingNow(BuildContext context) => 'shoppingNow'.tr(context)!;
  static String offersAndDiscounts(BuildContext context) =>
      'offersAndDiscounts'.tr(context)!;
  static String secureAndEasyPayment(BuildContext context) =>
      'secureAndEasyPayment'.tr(context)!;
  static String loremText(BuildContext context) => 'loremText'.tr(context)!;

  //! Login Screen
  static String loginToYourAccount(BuildContext context) =>
      'loginToYourAccount'.tr(context)!;
  static String resetPassword(BuildContext context) =>
      'resetPassword'.tr(context)!;
  static String donNotHaveAnAccount(BuildContext context) =>
      'donNotHaveAnAccount'.tr(context)!;
  static String register(BuildContext context) => 'register'.tr(context)!;
  static String login(BuildContext context) => 'login'.tr(context)!;
  static String rememberMe(BuildContext context) => 'rememberMe'.tr(context)!;
  static String password(BuildContext context) => 'password'.tr(context)!;
  static String passwordValidationMessage(BuildContext context) =>
      'passwordValidationMessage'.tr(context)!;
  static String emailValidationMessage(BuildContext context) =>
      'emailValidationMessage'.tr(context)!;
  static String emailAddress(BuildContext context) =>
      'emailAddress'.tr(context)!;

  //! REGISTER SCREEN
  static String registerToStart(BuildContext context) =>
      'registerToStart'.tr(context)!;
  static String registerNameValidation(BuildContext context) =>
      'registerNameValidation'.tr(context)!;
  static String name(BuildContext context) => 'name'.tr(context)!;

  static String registerPhoneNumberValidation(BuildContext context) =>
      'registerPhoneNumberValidation'.tr(context)!;
  static String phoneNumber(BuildContext context) => 'phoneNumber'.tr(context)!;
  static String alreadyHaveAnAccount(BuildContext context) =>
      'alreadyHaveAnAccount'.tr(context)!;
  static String loginNow(BuildContext context) => 'loginNow'.tr(context)!;

  //! Layout Screen
  static String home(BuildContext context) => 'home'.tr(context)!;

  //! Home Screen
  static String categories(BuildContext context) => 'categories'.tr(context)!;
  static String products(BuildContext context) => 'products'.tr(context)!;
  static String search(BuildContext context) => 'search'.tr(context)!;
  static String retry(BuildContext context) => 'retry'.tr(context)!;
  static String oops(BuildContext context) => 'oops'.tr(context)!;
  static String noProductsFound(BuildContext context) =>
      'noProductsFound'.tr(context)!;

  //! Favorites Screen
  static String favorites(BuildContext context) => 'favorites'.tr(context)!;
  static String yourFavoritesIsEmpty(BuildContext context) =>
      'yourFavoritesIsEmpty'.tr(context)!;

  //! Cart Screen
  static String yourCartIsEmpty(BuildContext context) =>
      'yourCartIsEmpty'.tr(context)!;
  static String startShoppingNow(BuildContext context) =>
      'startShoppingNow'.tr(context)!;
  static String cart(BuildContext context) => 'cart'.tr(context)!;
  static String total(BuildContext context) => 'total'.tr(context)!;
  static String checkout(BuildContext context) => 'checkout'.tr(context)!;
  static String delete(BuildContext context) => 'delete'.tr(context)!;

  //! Products Overview Screen
  static String price(BuildContext context) => 'price'.tr(context)!;

  //! About Screen
  static String about(BuildContext context) => 'about'.tr(context)!;
  static String storeDetails(BuildContext context) =>
      "storeDetails".tr(context)!;
  static String thisAppDevelopedBy(BuildContext context) =>
      "thisAppDevelopedBy".tr(context)!;
  static String husseinElbhrawy(BuildContext context) =>
      "husseinElbhrawy".tr(context)!;
  static String contactMe(BuildContext context) => "contactMe".tr(context)!;
  static String error(BuildContext context) => "error".tr(context)!;
  static String whatsAppNotInstalled(BuildContext context) =>
      "whatsAppNotInstalled".tr(context)!;

  //! Profile Screen
  static String profile(BuildContext context) => 'profile'.tr(context)!;
  static String faqs(BuildContext context) => 'faqs'.tr(context)!;
  static String notification(BuildContext context) =>
      'notification'.tr(context)!;
  static String personalInfo(BuildContext context) =>
      'personalInfo'.tr(context)!;
  static String fullName(BuildContext context) => 'fullName'.tr(context)!;
  static String comingSoon(BuildContext context) => 'comingSoon'.tr(context)!;
  static String address(BuildContext context) => 'address'.tr(context)!;
  static String orders(BuildContext context) => 'orders'.tr(context)!;
  static String wishlist(BuildContext context) => 'wishlist'.tr(context)!;
  static String helpAndSupport(BuildContext context) =>
      'helpAndSupport'.tr(context)!;
  static String arabic(BuildContext context) => 'arabic'.tr(context)!;
  static String darkMode(BuildContext context) => 'darkMode'.tr(context)!;
  static String logout(BuildContext context) => 'logout'.tr(context)!;
  static String areYouSureYouWantLogOut(BuildContext context) =>
      'areYouSureYouWantLogOut'.tr(context)!;
  static String cancel(BuildContext context) => 'cancel'.tr(context)!;
  static String yesLogout(BuildContext context) => 'yesLogout'.tr(context)!;

  //! Map Screen
  static String save(BuildContext context) => 'save'.tr(context)!;
  static String addNotesForDelivery(BuildContext context) =>
      'addNotesForDelivery'.tr(context)!;
  static String notes(BuildContext context) => 'notes'.tr(context)!;
  static String fullAddressDetails(BuildContext context) =>
      'fullAddressDetails'.tr(context)!;
  static String addressDetails(BuildContext context) =>
      'addressDetails'.tr(context)!;
  static String state(BuildContext context) => 'state'.tr(context)!;
  static String city(BuildContext context) => 'city'.tr(context)!;
  static String placeName(BuildContext context) => 'placeName'.tr(context)!;
  static String addNewAddress(BuildContext context) =>
      'addNewAddress'.tr(context)!;

  //! Credit Card Screen
  static String pay(BuildContext context) => 'pay'.tr(context)!;

  static String creditCard(BuildContext context) => 'creditCard'.tr(context)!;

  static String cardNumber(BuildContext context) => 'cardNumber'.tr(context)!;

  static String cardHolderName(BuildContext context) =>
      'cardHolderName'.tr(context)!;

  static String expiryDate(BuildContext context) => 'expiryDate'.tr(context)!;

  static String cvv(BuildContext context) => 'cvv'.tr(context)!;

  //! Payment Method Screen
  static String paymentMethods(BuildContext context) =>
      'paymentMethods'.tr(context)!;

  static String payWithPaypal(BuildContext context) =>
      'payWithPaypal'.tr(context)!;

  static String mobileWallets(BuildContext context) =>
      'mobileWallets'.tr(context)!;

  static String cashOnDelivery(BuildContext context) =>
      'cashOnDelivery'.tr(context)!;

  static String otherPaymentMethods(BuildContext context) =>
      'otherPaymentMethods'.tr(context)!;

  //! Checkout Screen
  static String placeOrder(BuildContext context) => 'placeOrder'.tr(context)!;

  static String payment(BuildContext context) => 'payment'.tr(context)!;

  static String done(BuildContext context) => 'done'.tr(context)!;

  static String totalPrice(BuildContext context) => 'totalPrice'.tr(context)!;

  static String subTotal(BuildContext context) => 'subTotal'.tr(context)!;

  static String shipping(BuildContext context) => 'shipping'.tr(context)!;

  static String discount(BuildContext context) => 'discount'.tr(context)!;

  static String couponCode(BuildContext context) => 'couponCode'.tr(context)!;

  static String enterCouponCode(BuildContext context) =>
      'enterCouponCode'.tr(context)!;

  static String shippingAddress(BuildContext context) =>
      'shippingAddress'.tr(context)!;

  static String next(BuildContext context) => 'next'.tr(context)!;

  //! General
  static String errorHappen(BuildContext context) => 'errorHappen'.tr(context)!;
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String noRouteFound = 'noRouteFound';
}
