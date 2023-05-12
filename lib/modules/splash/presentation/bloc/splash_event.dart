part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class IsOnBoardingSkip extends SplashEvent {
  final BuildContext context;
  const IsOnBoardingSkip(this.context);

  @override
  List<Object?> get props => [context];
}

class IsUserLoggedEvent extends SplashEvent {
  final BuildContext context;

  const IsUserLoggedEvent(this.context);
  @override
  List<Object?> get props => [context];
}

class SkipOnBoardingEvent extends SplashEvent {
  final BuildContext context;
  const SkipOnBoardingEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class IsDarkModeEvent extends SplashEvent {
  final BuildContext context;
  const IsDarkModeEvent(this.context);

  @override
  List<Object?> get props => [context];
}

class ChangeThemeEvent extends SplashEvent {
  final bool isDarkMode;

  const ChangeThemeEvent(this.isDarkMode);
  // const ChangeThemeEvent(this.context);

  @override
  List<Object?> get props => [isDarkMode];
}

class GetCurrentLangEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}

class ChangeLangEvent extends SplashEvent {
  final BuildContext context;
  final bool isArabic;
  const ChangeLangEvent(this.isArabic, this.context);

  @override
  List<Object?> get props => [isArabic, context];
}
