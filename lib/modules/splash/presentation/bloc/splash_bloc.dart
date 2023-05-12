// ignore_for_file: invalid_use_of_visible_for_testing_member, use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/app/injector.dart';
import 'package:kw_store/core/database/i_local_data_base.dart';
import 'package:kw_store/core/utils/media_query_values.dart';
import 'package:kw_store/modules/splash/domain/usecases/is_dark_mode_use_case.dart';

import '../../../../config/localization/app_localizations.dart';
import '../../../../config/router/app_routes.dart';
import '../../../../core/usecase/params/params.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../domain/usecases/get_user_id_use_case.dart';
import '../../domain/usecases/is_logged_use_case.dart';
import '../../domain/usecases/is_on_boarding_skipped_use_case.dart';
import '../../domain/usecases/skip_on_boarding_use_case.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IsLoggedUseCase _isUserLoggedUseCase;
  final GetUserIdUseCase _getUserIdUseCase;
  final IsOnBoardingSkippedUseCase _isBoardingSkippedUseCase;
  final SkipOnBoardingUseCase _skipOnBoardingUseCase;
  final IsDarkModeUseCase _isDarkModeUseCase;

  late Timer _timer;

  SplashBloc(
    this._getUserIdUseCase,
    this._isUserLoggedUseCase,
    this._isBoardingSkippedUseCase,
    this._skipOnBoardingUseCase,
    this._isDarkModeUseCase,
  ) : super(const SplashState()) {
    on<IsOnBoardingSkip>((event, emit) {
      _isOnBoardingSkip(event.context);
    });

    on<SkipOnBoardingEvent>(
      (event, emit) => _skipOnBoarding(event.context),
    );

    on<IsUserLoggedEvent>(
      (event, emit) => _isUserLogged(event.context),
    );

    on<IsDarkModeEvent>(
      (event, emit) => _getCurrentThemeMode(),
    );
    on<ChangeThemeEvent>((event, emit) => _changeThemeMode(event.isDarkMode));
    on<GetCurrentLangEvent>((event, emit) => _getCurrentLang());
    on<ChangeLangEvent>(
        (event, emit) => _changeLang(event.isArabic, event.context));
  }

  void _isOnBoardingSkip(BuildContext context) async {
    final isOnBoardingResult = await _isBoardingSkippedUseCase(NoParams());
    final isUserLogged = await _isUserLogged(context);

    isOnBoardingResult.fold(
      (failure) {
        log('_isOnBoardingSkip $failure');
        _timer = Timer(
          Duration(seconds: AppConstant.splashTime),
          () {
            context.navigateToWithReplacementAndClearStack(
              Routes.onboardingRoute,
            );
          },
        );
      },
      (isSkipped) {
        _timer = Timer(
          Duration(seconds: AppConstant.splashTime),
          () {
            if (isSkipped) {
              if (isUserLogged) {
                context.navigateToWithReplacementAndClearStack(
                  Routes.layoutRoute,
                );
              } else {
                context.navigateToWithReplacementAndClearStack(
                  Routes.loginRoute,
                );
              }
            } else {
              context.navigateToWithReplacementAndClearStack(
                Routes.onboardingRoute,
              );
            }
          },
        );
      },
    );
  }

  Future<bool> _isUserLogged(BuildContext context) async {
    final result = await _isUserLoggedUseCase(NoParams());

    return result.fold(
      (failure) {
        log('_isUserLogged $failure');
        return false;
      },
      (isLogged) {
        log('_isUserLogged $isLogged');
        return isLogged;
      },
    );
  }

  void _skipOnBoarding(BuildContext context) async {
    final result = await _skipOnBoardingUseCase(NoParams());

    result.fold(
      (failure) {
        log(failure.toString());
      },
      (isSkipped) {
        log('_skipOnBoarding $isSkipped');
        context.navigateToWithReplacementAndClearStack(Routes.loginRoute);
      },
    );
  }

  // void _isDarkMode(BuildContext context) async {
  //   final result = await _isDarkModeUseCase(NoParams());

  //   result.fold(
  //     (failure) {
  //       log(failure.toString());
  //     },
  //     (isDarkMode) {
  //       log('_isDarkMode $isDarkMode');
  //       // context.setThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  //       emit(state.copyWith(isDarkMode: isDarkMode));
  //     },
  //   );
  // }

  void _getCurrentThemeMode() async {
    var currentThemeMode =
        await serviceLocator<ILocalDataBase>().get(AppConstant.kDarkMode);
    emit(state.copyWith(isDarkMode: currentThemeMode));
  }

  void _changeThemeMode(bool value) async {
    emit(state.copyWith());
    await serviceLocator<ILocalDataBase>().set(
      AppConstant.kDarkMode,
      value,
    );

    emit(state.copyWith(isDarkMode: value));
  }

  void _getCurrentLang() async {
    var currentLang =
        await serviceLocator<ILocalDataBase>().get(AppConstant.kLang);
    emit(state.copyWith(currentLang: currentLang == true ? 'ar' : 'en'));
  }

  void _changeLang(bool value, BuildContext context) async {
    await serviceLocator<ILocalDataBase>().set(
      AppConstant.kLang,
      value,
    );
    if (AppLocalizations.of(context)!.isEnLocale) {
      // change To Arabic
      emit(state.copyWith(currentLang: 'ar'));
    } else {
      emit(state.copyWith(currentLang: 'en'));
      // change To English
    }
    emit(state.copyWith(currentLang: value ? 'ar' : 'en'));

    log('currentLang ${state.currentLang}', name: 'SplashBloc');
    serviceLocator<HomeBloc>().state.getCartDataData!.data.props.clear();
    serviceLocator<HomeBloc>().state.getFavoriteDataData!.data.data.clear();
    serviceLocator<HomeBloc>()
      ..add(GetHomeDataEvent())
      ..add(GetCategoriesDataEvent())
      ..add(GetFavoriteDataEvent())
      ..add(GetCartDataEvent())
      ..add(GetTotalPriceEvent());
  }

  @override
  Future<void> close() async {
    _timer.cancel();

    return super.close();
  }
}
