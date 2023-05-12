import 'package:flutter_credit_card/credit_card_widget.dart';

import '../utils/enums.dart';

extension SelectPaymentMethod on PaymentMethod {
  CardType getCurrentPaymentMethod() {
    switch (this) {
      case PaymentMethod.visa:
        return CardType.visa;

      case PaymentMethod.mastercard:
        return CardType.mastercard;

      case PaymentMethod.mobileWallet:
      case PaymentMethod.paypal:
      case PaymentMethod.cashOnDelivery:
      case PaymentMethod.other:
        return CardType.otherBrand;
    }
  }
}
