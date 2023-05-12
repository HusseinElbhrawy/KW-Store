class EndPoint {
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static const String login = 'login';
  static const String register = 'register';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String categories = 'categories';
  static const String cart = 'carts';
  static const String favorites = 'favorites';
  static const String updateProfile = 'update-profile';
  static const String notifications = 'notifications';
  static const String faqs = 'faqs';

  static const String paymentBaseUrl = 'https://accept.paymob.com/api/';
  static const String paymentAuthentication = 'auth/tokens';
  static const String paymentOrderRegistration = 'ecommerce/orders';
  static const String paymentKey = 'acceptance/payment_keys';
  // static const String paymentRefCode = 'acceptance/payments/pay';
  static const String paymentRefCode =
      'https://accept.paymob.com/api/acceptance/payments/pay';

  static String selectedBaseUrl = baseUrl;
}
