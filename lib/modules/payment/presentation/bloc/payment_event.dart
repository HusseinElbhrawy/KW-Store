part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class UpdateCardHolderNameEvent extends PaymentEvent {
  const UpdateCardHolderNameEvent(this.cardHolderName);
  final String cardHolderName;
}

class UpdateCardNumberEvent extends PaymentEvent {
  const UpdateCardNumberEvent(this.cardNumber);
  final String cardNumber;
}

class UpdateCvvCodeEvent extends PaymentEvent {
  const UpdateCvvCodeEvent(this.cvvCode);
  final String cvvCode;
}

class UpdateExpiryDateEvent extends PaymentEvent {
  const UpdateExpiryDateEvent(this.expiryDate);
  final String expiryDate;
}

class ShowCreditCardBackViewEvent extends PaymentEvent {}

class ShowCreditCardFrontViewEvent extends PaymentEvent {}

class ChoosePaymentMethodEvent extends PaymentEvent {
  const ChoosePaymentMethodEvent(this.paymentMethod);
  final PaymentMethod paymentMethod;
}

class GoToNextStepEvent extends PaymentEvent {
  const GoToNextStepEvent(this.activeStep);
  final int activeStep;
}

class PaymentAuthenticationEvent extends PaymentEvent {}

class OrderRegistrationEvent extends PaymentEvent {}

class PaymentKeyRequestEvent extends PaymentEvent {}

class GetRefCodeEvent extends PaymentEvent {}
