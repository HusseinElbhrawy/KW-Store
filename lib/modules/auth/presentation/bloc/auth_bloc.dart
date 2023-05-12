// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/modules/auth/domain/usecases/register_with_email_and_password.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/usecases/login_with_email_and_password_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  final RegisterWithEmailAndPasswordUsecase registerWithEmailAndPasswordUsecase;

  AuthBloc(
    this.loginWithEmailAndPasswordUseCase,
    this.registerWithEmailAndPasswordUsecase,
  ) : super(const AuthState()) {
    on<AuthEvent>((event, emit) {});
    on<LoginWithEmailAndPasswordEvent>((event, emit) {
      return _loginWithEmailAndPassword(
          event.email, event.password, event.context);
    });
    on<RegisterWithEmailAndPasswordEvent>((event, emit) {
      return _registerWithEmailAndPassword(
          event.email, event.password, event.phone, event.name, event.context);
    });
    on<RememberMeEvent>((event, emit) {
      return _rememberMe(event.isCheck);
    });

    on<ChangePasswordVisibilityEvent>(
        (event, emit) => _changePasswordVisibility());
  }

  void _loginWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    emit(state.copyWith(loginState: RequestState.loading));

    final result = await loginWithEmailAndPasswordUseCase(
      LoginParams(
        email,
        password,
        isRememberMe: state.isRememberMeChecked,
      ),
    );

    log(state.isRememberMeChecked.toString());

    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            loginState: RequestState.error,
            loginErrorMessage: failure.message.toString(),
          );
        },
        (response) {
          log(response.toString());
          Navigator.pushReplacementNamed(context, Routes.layoutRoute);
          return state.copyWith(loginState: RequestState.loaded);
        },
      ),
    );
  }

  void _registerWithEmailAndPassword(
    String email,
    String password,
    String phone,
    String name,
    BuildContext context,
  ) async {
    final registerParams = RegisterParams(
      email: email,
      name: name,
      password: password,
      phone: phone,
    );

    emit(state.copyWith(registerState: RequestState.loading));

    final result = await registerWithEmailAndPasswordUsecase(registerParams);
    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            registerState: RequestState.error,
            registerErrorMessage: failure.message.toString(),
          );
        },
        (response) {
          log(response.toString());
          Navigator.pushReplacementNamed(context, Routes.layoutRoute);

          return state.copyWith(registerState: RequestState.loaded);
        },
      ),
    );
  }

  void _rememberMe(bool value) {
    emit(state.copyWith(isRememberMeChecked: value));
  }

  void _changePasswordVisibility() {
    final value = state.isPassword;
    emit(
      state.copyWith(isPassword: !value),
    );
  }
}
