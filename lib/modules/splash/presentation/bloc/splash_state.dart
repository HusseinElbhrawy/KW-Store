// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.isUserLoggedInState = RequestState.initial,
    this.getUserNameState = RequestState.initial,
    this.isUserLoggedInErrorMessage = '',
    this.isDarkMode = false,
    this.currentLang = 'en',
  });
  final RequestState isUserLoggedInState;
  final RequestState getUserNameState;
  final String isUserLoggedInErrorMessage;

  final bool isDarkMode;
  final String currentLang;

  @override
  List<Object?> get props => [
        isUserLoggedInState,
        getUserNameState,
        isUserLoggedInErrorMessage,
        isDarkMode,
        currentLang,
      ];

  SplashState copyWith({
    RequestState? isUserLoggedInState,
    RequestState? getUserNameState,
    String? isUserLoggedInErrorMessage,
    bool? isDarkMode,
    String? currentLang,
  }) {
    return SplashState(
      isUserLoggedInState: isUserLoggedInState ?? this.isUserLoggedInState,
      getUserNameState: getUserNameState ?? this.getUserNameState,
      isUserLoggedInErrorMessage:
          isUserLoggedInErrorMessage ?? this.isUserLoggedInErrorMessage,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      currentLang: currentLang ?? this.currentLang,
    );
  }
}
