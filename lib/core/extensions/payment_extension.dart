import 'package:flutter_credit_card/credit_card_widget.dart';

import '../utils/enums.dart';

extension SelectPaymentMethod on CustomPaymentMethod {
  CardType getCurrentPaymentMethod() {
    switch (this) {
      case CustomPaymentMethod.visa:
        return CardType.visa;

      case CustomPaymentMethod.mastercard:
        return CardType.mastercard;

      case CustomPaymentMethod.mobileWallet:
      case CustomPaymentMethod.paypal:
      case CustomPaymentMethod.cashOnDelivery:
      case CustomPaymentMethod.other:
        return CardType.otherBrand;
    }
  }
}
