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
  // final BuildContext context;
  // const ChangeThemeEvent(this.context);

  @override
  List<Object?> get props => [isDarkMode];
}
