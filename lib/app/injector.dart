import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kw_store/modules/splash/domain/usecases/is_dark_mode_use_case.dart';
import 'package:path_provider/path_provider.dart';

import '../core/api/api_consumer.dart';
import '../core/api/app_interceptor.dart';
import '../core/api/dio_consumer.dart';
import '../core/api/payment_interceptor.dart';
import '../core/database/i_local_data_base.dart';
import '../core/database/local_data_base_with_hive.dart';
import '../core/network/network.dart';
import '../core/utils/constant.dart';
import '../modules/auth/data/datasources/auth_local_data_source.dart';
import '../modules/auth/data/datasources/auth_remote_data_source.dart';
import '../modules/auth/data/repositories/auth_repository_implementation.dart';
import '../modules/auth/domain/repositories/auth_repository.dart';
import '../modules/auth/domain/usecases/log_out_use_case.dart';
import '../modules/auth/domain/usecases/login_with_email_and_password_use_case.dart';
import '../modules/auth/domain/usecases/register_with_email_and_password.dart';
import '../modules/auth/presentation/bloc/auth_bloc.dart';
import '../modules/home/data/datasources/home_local_data_source.dart';
import '../modules/home/data/datasources/home_remote_data_source.dart';
import '../modules/home/data/repositories/home_repository_implementation.dart';
import '../modules/home/domain/repositories/home_repository.dart';
import '../modules/home/domain/usecases/add_or_remove_favorites_use_case.dart';
import '../modules/home/domain/usecases/add_or_remove_from_cart_use_case.dart';
import '../modules/home/domain/usecases/get_all_favorites_use_case.dart';
import '../modules/home/domain/usecases/get_cart_use_case.dart';
import '../modules/home/domain/usecases/get_categories_data_use_case.dart';
import '../modules/home/domain/usecases/get_home_data_use_case.dart';
import '../modules/home/domain/usecases/get_specific_category_use_case.dart';
import '../modules/home/presentation/bloc/home_bloc.dart';
import '../modules/payment/data/datasources/payment_remote_data_source.dart';
import '../modules/payment/data/repositories/payment_repository_implementation.dart';
import '../modules/payment/domain/repositories/payment_repository.dart';
import '../modules/payment/domain/usecases/authentication_payment_use_case.dart';
import '../modules/payment/domain/usecases/ger_ref_code_use_case.dart';
import '../modules/payment/domain/usecases/get_payment_key_use_case.dart';
import '../modules/payment/domain/usecases/order_registration_use_case.dart';
import '../modules/payment/presentation/bloc/payment_bloc.dart';
import '../modules/profile/data/datasources/profile_local_data_source.dart';
import '../modules/profile/data/datasources/profile_remote_data_source.dart';
import '../modules/profile/data/repositories/profile_repository_implementation.dart';
import '../modules/profile/domain/entities/address.dart';
import '../modules/profile/domain/repositories/profile_repository.dart';
import '../modules/profile/domain/usecases/delete_new_address_use_case.dart';
import '../modules/profile/domain/usecases/get_faqs_use_case.dart';
import '../modules/profile/domain/usecases/get_notification_use_case.dart';
import '../modules/profile/domain/usecases/get_profile_data_use_case.dart';
import '../modules/profile/domain/usecases/get_user_address_use_case.dart';
import '../modules/profile/domain/usecases/save_new_address_use_case.dart';
import '../modules/profile/domain/usecases/update_profile_use_case.dart';
import '../modules/profile/domain/usecases/update_user_address_use_case.dart';
import '../modules/profile/presentation/bloc/profile_bloc.dart';
import '../modules/splash/data/datasources/splash_local_data_source.dart';
import '../modules/splash/data/repositories/splash_repository_implementation.dart';
import '../modules/splash/domain/repositories/splash_repository.dart';
import '../modules/splash/domain/usecases/get_user_id_use_case.dart';
import '../modules/splash/domain/usecases/is_logged_use_case.dart';
import '../modules/splash/domain/usecases/is_on_boarding_skipped_use_case.dart';
import '../modules/splash/domain/usecases/skip_on_boarding_use_case.dart';
import '../modules/splash/presentation/bloc/splash_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  //! Bloc
  await _setUpBloc();
  //! useCase
  await _setUpUsecases();
  //! Repo
  await _setUpRepository();
  //! DataSource
  await _setUpDatasource();
  //! Utils
  await _setUpUtils();
  //!External
  await _setUpExternal();
}

Future<void> _setUpBloc() async {
  serviceLocator.registerFactory(
    () => SplashBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => HomeBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => ProfileBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => PaymentBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
}

Future<void> _setUpUsecases() async {
  serviceLocator.registerLazySingleton(
    () => LoginWithEmailAndPasswordUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => RegisterWithEmailAndPasswordUsecase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetHomeDataUseCase(homeRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetUserIdUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => IsLoggedUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => LogOutUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => IsOnBoardingSkippedUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SkipOnBoardingUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetProfileDataUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetCategoriesDataUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => AddOrRemoveFavoritesUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => AddOrRemoveFromCartUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetCartUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetAllFavoritesUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetSpecificCategoryUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => UpdateProfileUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetNotificationUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetFaqsUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SaveNewAddressUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetUserAddressUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => DeleteNewAddressUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => UpdateUserAddressUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => AuthenticationPaymentUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GerRefCodeUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetPaymentKeyUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => OrderRegistrationUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => IsDarkModeUseCase(serviceLocator()),
  );
}

Future<void> _setUpRepository() async {
  serviceLocator.registerLazySingleton<SplashRepository>(
    () => SplashRepositoryImplementation(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImplementation(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImplementation(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImplementation(serviceLocator()),
  );
}

Future<void> _setUpDatasource() async {
  serviceLocator.registerLazySingleton<SplashLocalDataSource>(
    () => SplashLocalDataSourceImplementation(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementationWithApi(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImplementation(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImplementation(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImplementation(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImplementation(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImplementation(
      serviceLocator(),
    ),
  );
}

Future<void> _setUpUtils() async {
  serviceLocator.registerLazySingleton<NetworkInformation>(
    () => NetworkInformationImplementation(
      internetConnectionChecker: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ILocalDataBase>(
    () => HiveLocalDataBaseImplementation(),
  );
}

Future<void> _setUpExternal() async {
  final path = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(path.path);
  Hive.registerAdapter(AddressAdapter());
  await Hive.openBox<Address>(AppConstant.addressDatabase);
  await Hive.openBox(
    AppConstant.generalDatabaseName,
    compactionStrategy: (entries, deletedEntries) => deletedEntries > 10,
  );

  serviceLocator.registerLazySingleton<HiveInterface>(() => Hive);

  serviceLocator.registerLazySingleton(() => AppInterceptor());
  serviceLocator.registerLazySingleton(() => PaymentInterceptor());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: false,
      requestHeader: true,
      error: true,
      responseBody: true,
      responseHeader: false,
    ),
  );
  serviceLocator.registerLazySingleton(() => Dio());

  serviceLocator.registerLazySingleton(
    () => DioConsumer(
      dio: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());

  serviceLocator.registerLazySingleton(() => const FlutterSecureStorage());
}
