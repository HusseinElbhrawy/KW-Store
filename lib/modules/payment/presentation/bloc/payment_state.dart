// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  const PaymentState({
    this.cardHolderName = '',
    this.cardNumber = '',
    this.cvvCode = '',
    this.expiryDate = '',
    this.showBackView = false,
    this.paymentMethod = CustomPaymentMethod.visa,
    this.isUserSelectedPaymentMethod = false,
    this.currentPaymentScreen = 0,
    this.activeStep = 0,
    this.authenticatedErrorMessage,
    this.authenticatedPaymentState = RequestState.initial,
    this.authenticatedPayment,
    this.orderRegistrationErrorMessage,
    this.orderRegistrationState = RequestState.initial,
    this.orderRegistration,
    this.paymentKeyRequestErrorMessage,
    this.paymentKeyRequestState = RequestState.initial,
    this.paymentKey,
    this.getRefCodeErrorMessage,
    this.getRefCodeState = RequestState.initial,
    this.refCode,
    this.orderDate,
  });
  final String cardHolderName;
  final String cardNumber;
  final String cvvCode;
  final String expiryDate;
  final bool showBackView;
  final CustomPaymentMethod paymentMethod;

  //! Payment
  final bool isUserSelectedPaymentMethod;
  final int currentPaymentScreen;
  final int activeStep;

  //! Authenticated Payment
  final String? authenticatedErrorMessage;
  final RequestState authenticatedPaymentState;
  final PaymentAuthentication? authenticatedPayment;

  //! Order Registration
  final String? orderRegistrationErrorMessage;
  final RequestState orderRegistrationState;
  final OrderRegistration? orderRegistration;

  //!Payment Key Request
  final String? paymentKeyRequestErrorMessage;
  final RequestState paymentKeyRequestState;
  final PaymentKey? paymentKey;

  //! Get Ref Code
  final String? getRefCodeErrorMessage;
  final RequestState getRefCodeState;
  final KioskDataPayment? refCode;

  //! Cart Order
  final String? orderDate;

  @override
  List<Object?> get props => [
        cardHolderName,
        cardNumber,
        cvvCode,
        expiryDate,
        showBackView,
        paymentMethod,
        isUserSelectedPaymentMethod,
        currentPaymentScreen,
        activeStep,
        authenticatedErrorMessage,
        authenticatedPaymentState,
        authenticatedPayment,
        orderRegistrationErrorMessage,
        orderRegistrationState,
        orderRegistration,
        paymentKeyRequestErrorMessage,
        paymentKeyRequestState,
        paymentKey,
        getRefCodeErrorMessage,
        getRefCodeState,
        refCode,
        orderDate,
      ];

  PaymentState copyWith({
    String? cardHolderName,
    String? cardNumber,
    String? cvvCode,
    String? expiryDate,
    bool? showBackView,
    CustomPaymentMethod? paymentMethod,
    bool? isUserSelectedPaymentMethod,
    int? currentPaymentScreen,
    int? activeStep,
    String? authenticatedErrorMessage,
    RequestState? authenticatedPaymentState,
    PaymentAuthentication? authenticatedPayment,
    String? orderRegistrationErrorMessage,
    RequestState? orderRegistrationState,
    OrderRegistration? orderRegistration,
    String? paymentKeyRequestErrorMessage,
    RequestState? paymentKeyRequestState,
    PaymentKey? paymentKey,
    String? getRefCodeErrorMessage,
    RequestState? getRefCodeState,
    KioskDataPayment? refCode,
    String? orderDate,
  }) {
    return PaymentState(
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      cvvCode: cvvCode ?? this.cvvCode,
      expiryDate: expiryDate ?? this.expiryDate,
      showBackView: showBackView ?? this.showBackView,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      isUserSelectedPaymentMethod:
          isUserSelectedPaymentMethod ?? this.isUserSelectedPaymentMethod,
      currentPaymentScreen: currentPaymentScreen ?? this.currentPaymentScreen,
      activeStep: activeStep ?? this.activeStep,
      authenticatedErrorMessage:
          authenticatedErrorMessage ?? this.authenticatedErrorMessage,
      authenticatedPaymentState:
          authenticatedPaymentState ?? this.authenticatedPaymentState,
      authenticatedPayment: authenticatedPayment ?? this.authenticatedPayment,
      orderRegistrationErrorMessage:
          orderRegistrationErrorMessage ?? this.orderRegistrationErrorMessage,
      orderRegistrationState:
          orderRegistrationState ?? this.orderRegistrationState,
      orderRegistration: orderRegistration ?? this.orderRegistration,
      paymentKeyRequestErrorMessage:
          paymentKeyRequestErrorMessage ?? this.paymentKeyRequestErrorMessage,
      paymentKeyRequestState:
          paymentKeyRequestState ?? this.paymentKeyRequestState,
      paymentKey: paymentKey ?? this.paymentKey,
      getRefCodeErrorMessage:
          getRefCodeErrorMessage ?? this.getRefCodeErrorMessage,
      getRefCodeState: getRefCodeState ?? this.getRefCodeState,
      refCode: refCode ?? this.refCode,
      orderDate: orderDate ?? this.orderDate,
    );
  }
}
