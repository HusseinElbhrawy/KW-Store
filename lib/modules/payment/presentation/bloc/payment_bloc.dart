// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';
import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kw_store/core/usecase/params/params.dart';
import 'package:kw_store/modules/home/presentation/bloc/home_bloc.dart';
import 'package:kw_store/modules/payment/domain/entities/kiosk_payment.dart';
import 'package:kw_store/modules/payment/domain/entities/order_registration.dart';
import 'package:kw_store/modules/payment/domain/entities/payment_authentication.dart';
import 'package:kw_store/modules/payment/domain/entities/payment_key.dart';
import 'package:kw_store/modules/payment/domain/usecases/authentication_payment_use_case.dart';
import 'package:kw_store/modules/payment/domain/usecases/ger_ref_code_use_case.dart';
import 'package:kw_store/modules/payment/domain/usecases/get_payment_key_use_case.dart';
import 'package:kw_store/modules/payment/domain/usecases/order_registration_use_case.dart';
import 'package:kw_store/modules/profile/presentation/bloc/profile_bloc.dart';

import '../../../../core/utils/enums.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final AuthenticationPaymentUseCase authenticationPaymentUseCase;
  final GerRefCodeUseCase gerRefCodeUseCase;
  final GetPaymentKeyUseCase getPaymentKeyUseCase;
  final OrderRegistrationUseCase orderRegistrationUseCase;
  final ProfileBloc profileBloc;
  final HomeBloc homeBloc;

  PaymentBloc(
    this.authenticationPaymentUseCase,
    this.gerRefCodeUseCase,
    this.getPaymentKeyUseCase,
    this.orderRegistrationUseCase,
    this.profileBloc,
    this.homeBloc,
  ) : super(const PaymentState()) {
    on<UpdateCardHolderNameEvent>((event, emit) {
      _updateCardHolderName(event.cardHolderName);
    });
    on<UpdateCardNumberEvent>((event, emit) {
      _updateCardNumber(event.cardNumber);
    });
    on<UpdateCvvCodeEvent>((event, emit) {
      _updateCvvCode(event.cvvCode);
    });
    on<UpdateExpiryDateEvent>((event, emit) {
      _updateExpiryDate(event.expiryDate);
    });
    on<ShowCreditCardBackViewEvent>((event, emit) {
      _showCreditCardBackView();
    });
    on<ShowCreditCardFrontViewEvent>((event, emit) {
      _showCreditCardFrontView();
    });
    on<ChoosePaymentMethodEvent>((event, emit) {
      _choosePaymentMethod(event.paymentMethod);
    });

    on<GoToNextStepEvent>((event, emit) {
      _goToNextStep(event.activeStep);
    });

    on<PaymentAuthenticationEvent>((event, emit) => _authenticationRequest());

    on<OrderRegistrationEvent>((event, emit) => _orderRegistration());

    on<PaymentKeyRequestEvent>((event, emit) => _getPaymentKey());

    on<GetRefCodeEvent>((event, emit) => _getRefCode());
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  void _updateCardHolderName(String value) {
    emit(state.copyWith(cardHolderName: value));
  }

  void _updateCardNumber(String value) {
    emit(state.copyWith(cardNumber: value));
  }

  void _updateCvvCode(String value) {
    emit(state.copyWith(cvvCode: value));
  }

  void _updateExpiryDate(String value) {
    emit(state.copyWith(expiryDate: value));
  }

  void _showCreditCardBackView() {
    emit(state.copyWith(showBackView: true));
  }

  void _showCreditCardFrontView() {
    emit(state.copyWith(showBackView: false));
  }

  void _choosePaymentMethod(PaymentMethod paymentMethod) {
    emit(state.copyWith(paymentMethod: paymentMethod));
  }

  void _goToNextStep(int activeStep) {
    emit(state.copyWith(activeStep: activeStep));
  }

  String orderId = (math.Random().nextInt(900000) + 100000).toString();
  String dateTime = DateFormat.yMMMMEEEEd().format(DateTime.now()).toString();

  void _authenticationRequest() async {
    emit(state.copyWith(authenticatedPaymentState: RequestState.loading));

    final result = await authenticationPaymentUseCase(NoParams());

    emit(
      result.fold(
        (failure) {
          return state.copyWith(
            authenticatedPaymentState: RequestState.error,
            authenticatedErrorMessage: failure.message,
          );
        },
        (response) {
          log(response.token.toString());

          return state.copyWith(
            authenticatedPaymentState: RequestState.loaded,
            authenticatedPayment: response,
          );
        },
      ),
    );
  }

  void _orderRegistration() async {
    emit(state.copyWith(orderRegistrationState: RequestState.loading));

    final List<Item> items =
        List.of(homeBloc.state.getCartDataData!.data.products.map(
      (item) {
        return Item(
          name: item.product.name,
          amountCents: (item.product.price.toInt() * 1000).toString(),
          quantity: item.quantity.toInt(),
          description: item.product.description,
        );
      },
    )).toList();

    final params = OrderRegistrationParams(
      authToken: state.authenticatedPayment!.token,
      delivery: false,
      amountCents: homeBloc.state.totalPrice.toInt() * 1000,
      currency: 'EGP',
      terminalId: 23772,
      items: items,
      shippingData: ShippingDataParams(
        email: profileBloc.state.profile!.data!.email!,
        firstName: profileBloc.state.profile!.data!.name!.split(' ')[0],
        lastName: profileBloc.state.profile!.data!.name!.split(' ')[1],
        phoneNumber: profileBloc.state.profile!.data!.phone!,
        street: profileBloc.state.defaultAddress?.street ?? '',
        city: profileBloc.state.defaultAddress?.region ?? '',
        country: profileBloc.state.defaultAddress?.fullAddress ?? '',
        state: profileBloc.state.defaultAddress?.state ?? '',
      ),
    );

    final result = await orderRegistrationUseCase(params);

    emit(
      result.fold(
        (failure) {
          return state.copyWith(
            orderRegistrationState: RequestState.error,
            orderRegistrationErrorMessage: failure.message,
          );
        },
        (response) {
          // add(PaymentKeyRequestEvent());
          // _getPaymentKey();
          // add(PaymentKeyRequestEvent());
          return state.copyWith(
            orderRegistrationState: RequestState.loaded,
            orderRegistration: response,
          );
        },
      ),
    );
  }

  void _getPaymentKey() async {
    emit(state.copyWith(paymentKeyRequestState: RequestState.loading));
    final billingData = BillingData(
      // apartment: '1',
      // email: 'hussein@gmail.com',
      // floor: '42',
      // firstName: 'Hussein',
      // lastName: 'Hussein',
      // street: 'Street',
      // building: '8028',
      // city: 'City',
      // country: 'Country',
      // state: 'State',
      // phone: '01000000000',
      // postalCode: '01898',
      // shippingMethod: 'PKG',
      firstName: profileBloc.state.profile!.data!.name!,
      lastName: profileBloc.state.profile!.data!.name!,
      apartment: '1',
      email: profileBloc.state.profile!.data!.email!,
      floor: '42',
      street: profileBloc.state.defaultAddress?.street ?? 'Street',
      building: '8028',
      phone: profileBloc.state.profile!.data!.phone!,
      shippingMethod: 'PKG',
      postalCode: '01898',
      city: profileBloc.state.defaultAddress?.region ?? 'City',
      country: profileBloc.state.defaultAddress?.fullAddress ?? 'Country',
      state: profileBloc.state.defaultAddress?.state ?? 'State',
    );

    final params = PaymentKeyRequestParams(
      authToken: state.authenticatedPayment!.token,
      // amountCents: (homeBloc.state.totalPrice.toInt() * 1000).toString(),

      amountCents: '10000',
      expiration: 3600,
      orderId: orderId,
      billingData: billingData,
      currency: 'EGP',
      integrationId: 2030245,
      lockOrderWhenPaid: "false",
      // amountCents: '10000',
      // expiration: 3600,
      // orderId: orderId,
      // billingData: billingData,
      // currency: 'EGP',
      // integrationId: 2030245,
      // lockOrderWhenPaid: "false",
    );

    final result = await getPaymentKeyUseCase(params);

    emit(
      result.fold(
        (failure) {
          log(
            'PaymentKey: ${failure.message}',
            name: 'PaymentKey',
          );
          return state.copyWith(
            paymentKeyRequestState: RequestState.error,
            paymentKeyRequestErrorMessage: failure.message,
          );
        },
        (response) {
          log(
            'PaymentKey: ${response.token}',
            name: 'PaymentKey',
          );
          return state.copyWith(
            paymentKeyRequestState: RequestState.loaded,
            paymentKey: response,
          );
        },
      ),
    );
  }

  void _getRefCode() async {
    emit(state.copyWith(getRefCodeState: RequestState.loading));

    final result = await gerRefCodeUseCase(state.paymentKey!.token);

    emit(
      result.fold(
        (failure) {
          return state.copyWith(
            getRefCodeState: RequestState.error,
            getRefCodeErrorMessage: failure.message,
          );
        },
        (response) {
          log(response.toString(), name: 'RefCode', error: 'RefCode');
          return state.copyWith(
            getRefCodeState: RequestState.loaded,
            refCode: response,
          );
        },
      ),
    );
  }
}
