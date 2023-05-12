// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.loginState = RequestState.loaded,
    this.registerState = RequestState.loaded,
    this.loginErrorMessage = '',
    this.registerErrorMessage = '',
    this.isRememberMeChecked = true,
    this.isPassword = true,
  });
  final RequestState loginState;
  final String loginErrorMessage;
  final RequestState registerState;
  final String registerErrorMessage;
  final bool isRememberMeChecked;
  final bool isPassword;

  @override
  List<Object?> get props => [
        loginState,
        registerState,
        loginErrorMessage,
        registerErrorMessage,
        isRememberMeChecked,
        isPassword,
      ];

  AuthState copyWith({
    RequestState? loginState,
    String? loginErrorMessage,
    RequestState? registerState,
    String? registerErrorMessage,
    bool? isRememberMeChecked,
    bool? isPassword,
  }) {
    return AuthState(
      loginState: loginState ?? this.loginState,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      registerState: registerState ?? this.registerState,
      registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
      isRememberMeChecked: isRememberMeChecked ?? this.isRememberMeChecked,
      isPassword: isPassword ?? this.isPassword,
    );
  }
}
