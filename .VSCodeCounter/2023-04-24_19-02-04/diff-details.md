# Diff Details

Date : 2023-04-24 19:02:04

Directory d:\\Programming\\Projects\\Flutter Projects\\Work\\Active\\kw_store

Total : 60 files,  2431 codes, 19 comments, 263 blanks, all 2713 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [android/app/src/main/AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml) | XML | 5 | 0 | 2 | 7 |
| [assets/svg/mastercard.svg](/assets/svg/mastercard.svg) | XML | 2 | 0 | 0 | 2 |
| [assets/svg/paypal.svg](/assets/svg/paypal.svg) | XML | 26 | 1 | 10 | 37 |
| [assets/svg/visa.svg](/assets/svg/visa.svg) | XML | 2 | 0 | 0 | 2 |
| [lib/app/app.dart](/lib/app/app.dart) | Dart | 1 | 0 | -1 | 0 |
| [lib/app/injector.dart](/lib/app/injector.dart) | Dart | 32 | -1 | 1 | 32 |
| [lib/config/router/app_routes.dart](/lib/config/router/app_routes.dart) | Dart | 41 | 0 | 2 | 43 |
| [lib/core/database/local_data_base_with_flutter_secure_storage.dart](/lib/core/database/local_data_base_with_flutter_secure_storage.dart) | Dart | -22 | 0 | -7 | -29 |
| [lib/core/database/local_data_base_with_hive.dart](/lib/core/database/local_data_base_with_hive.dart) | Dart | 30 | 0 | 7 | 37 |
| [lib/core/database/local_data_base_with_shared_pref.dart](/lib/core/database/local_data_base_with_shared_pref.dart) | Dart | -34 | 0 | -7 | -41 |
| [lib/core/database/secure_local_storage.dart](/lib/core/database/secure_local_storage.dart) | Dart | 0 | -6 | -1 | -7 |
| [lib/core/database/shared_preference.dart](/lib/core/database/shared_preference.dart) | Dart | 0 | -6 | -1 | -7 |
| [lib/core/usecase/params/params.dart](/lib/core/usecase/params/params.dart) | Dart | 11 | 0 | 3 | 14 |
| [lib/core/utils/app_assets.dart](/lib/core/utils/app_assets.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/core/utils/app_strings.dart](/lib/core/utils/app_strings.dart) | Dart | 20 | 3 | 10 | 33 |
| [lib/core/utils/constant.dart](/lib/core/utils/constant.dart) | Dart | 3 | 0 | 2 | 5 |
| [lib/core/utils/enums.dart](/lib/core/utils/enums.dart) | Dart | 8 | 0 | 1 | 9 |
| [lib/core/utils/fonts_manager.dart](/lib/core/utils/fonts_manager.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/core/utils/utils.dart](/lib/core/utils/utils.dart) | Dart | 89 | 0 | 6 | 95 |
| [lib/main.dart](/lib/main.dart) | Dart | 0 | -7 | 2 | -5 |
| [lib/modules/auth/data/datasources/auth_local_data_source.dart](/lib/modules/auth/data/datasources/auth_local_data_source.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/modules/payment/presentation/bloc/payment_bloc.dart](/lib/modules/payment/presentation/bloc/payment_bloc.dart) | Dart | 54 | 1 | 13 | 68 |
| [lib/modules/payment/presentation/bloc/payment_event.dart](/lib/modules/payment/presentation/bloc/payment_event.dart) | Dart | 28 | 0 | 10 | 38 |
| [lib/modules/payment/presentation/bloc/payment_state.dart](/lib/modules/payment/presentation/bloc/payment_state.dart) | Dart | 43 | 1 | 4 | 48 |
| [lib/modules/payment/presentation/screens/checkout_screen.dart](/lib/modules/payment/presentation/screens/checkout_screen.dart) | Dart | 448 | 6 | 9 | 463 |
| [lib/modules/payment/presentation/screens/credit_card_screen.dart](/lib/modules/payment/presentation/screens/credit_card_screen.dart) | Dart | 50 | 1 | 5 | 56 |
| [lib/modules/payment/presentation/screens/payment_method_screen.dart](/lib/modules/payment/presentation/screens/payment_method_screen.dart) | Dart | 45 | 1 | 6 | 52 |
| [lib/modules/payment/presentation/widgets/credit card/card_cvv_widget.dart](/lib/modules/payment/presentation/widgets/credit%20card/card_cvv_widget.dart) | Dart | 40 | 0 | 4 | 44 |
| [lib/modules/payment/presentation/widgets/credit card/card_expiry_date_widget.dart](/lib/modules/payment/presentation/widgets/credit%20card/card_expiry_date_widget.dart) | Dart | 41 | 0 | 4 | 45 |
| [lib/modules/payment/presentation/widgets/credit card/card_holder_name_widget.dart](/lib/modules/payment/presentation/widgets/credit%20card/card_holder_name_widget.dart) | Dart | 30 | 0 | 4 | 34 |
| [lib/modules/payment/presentation/widgets/credit card/card_number_widget.dart](/lib/modules/payment/presentation/widgets/credit%20card/card_number_widget.dart) | Dart | 34 | 0 | 4 | 38 |
| [lib/modules/payment/presentation/widgets/credit card/credit_card_pay_button_widget.dart](/lib/modules/payment/presentation/widgets/credit%20card/credit_card_pay_button_widget.dart) | Dart | 27 | 0 | 4 | 31 |
| [lib/modules/payment/presentation/widgets/credit card/custom_credit_card_widget.dart](/lib/modules/payment/presentation/widgets/credit%20card/custom_credit_card_widget.dart) | Dart | 29 | 1 | 4 | 34 |
| [lib/modules/payment/presentation/widgets/payment method/pay_with_cash_on_delivery_widget.dart](/lib/modules/payment/presentation/widgets/payment%20method/pay_with_cash_on_delivery_widget.dart) | Dart | 47 | 0 | 4 | 51 |
| [lib/modules/payment/presentation/widgets/payment method/pay_with_master_card_widget.dart](/lib/modules/payment/presentation/widgets/payment%20method/pay_with_master_card_widget.dart) | Dart | 26 | 1 | 5 | 32 |
| [lib/modules/payment/presentation/widgets/payment method/pay_with_mobile_wallet_widget.dart](/lib/modules/payment/presentation/widgets/payment%20method/pay_with_mobile_wallet_widget.dart) | Dart | 47 | 0 | 4 | 51 |
| [lib/modules/payment/presentation/widgets/payment method/pay_with_other_methods_widget.dart](/lib/modules/payment/presentation/widgets/payment%20method/pay_with_other_methods_widget.dart) | Dart | 47 | 0 | 4 | 51 |
| [lib/modules/payment/presentation/widgets/payment method/pay_with_paypal_card_widget.dart](/lib/modules/payment/presentation/widgets/payment%20method/pay_with_paypal_card_widget.dart) | Dart | 24 | 0 | 4 | 28 |
| [lib/modules/payment/presentation/widgets/payment method/pay_with_visa_card_widget.dart](/lib/modules/payment/presentation/widgets/payment%20method/pay_with_visa_card_widget.dart) | Dart | 26 | 0 | 4 | 30 |
| [lib/modules/payment/presentation/widgets/payment method/payment_method_item_widget.dart](/lib/modules/payment/presentation/widgets/payment%20method/payment_method_item_widget.dart) | Dart | 63 | 0 | 3 | 66 |
| [lib/modules/profile/data/datasources/profile_local_data_source.dart](/lib/modules/profile/data/datasources/profile_local_data_source.dart) | Dart | 32 | 5 | 10 | 47 |
| [lib/modules/profile/data/datasources/profile_remote_data_source.dart](/lib/modules/profile/data/datasources/profile_remote_data_source.dart) | Dart | 0 | -5 | 0 | -5 |
| [lib/modules/profile/data/repositories/profile_repository_implementation.dart](/lib/modules/profile/data/repositories/profile_repository_implementation.dart) | Dart | 49 | 0 | 4 | 53 |
| [lib/modules/profile/domain/entities/address.dart](/lib/modules/profile/domain/entities/address.dart) | Dart | 31 | 1 | 4 | 36 |
| [lib/modules/profile/domain/repositories/profile_repository.dart](/lib/modules/profile/domain/repositories/profile_repository.dart) | Dart | 5 | 4 | 4 | 13 |
| [lib/modules/profile/domain/usecases/delete_new_address_use_case.dart](/lib/modules/profile/domain/usecases/delete_new_address_use_case.dart) | Dart | 13 | 0 | 5 | 18 |
| [lib/modules/profile/domain/usecases/get_user_address_use_case.dart](/lib/modules/profile/domain/usecases/get_user_address_use_case.dart) | Dart | 14 | 0 | 5 | 19 |
| [lib/modules/profile/domain/usecases/save_new_address_use_case.dart](/lib/modules/profile/domain/usecases/save_new_address_use_case.dart) | Dart | 13 | 0 | 5 | 18 |
| [lib/modules/profile/domain/usecases/update_user_address_use_case.dart](/lib/modules/profile/domain/usecases/update_user_address_use_case.dart) | Dart | 13 | 0 | 5 | 18 |
| [lib/modules/profile/presentation/bloc/profile_bloc.dart](/lib/modules/profile/presentation/bloc/profile_bloc.dart) | Dart | 316 | 0 | 52 | 368 |
| [lib/modules/profile/presentation/bloc/profile_event.dart](/lib/modules/profile/presentation/bloc/profile_event.dart) | Dart | 54 | 0 | 10 | 64 |
| [lib/modules/profile/presentation/bloc/profile_state.dart](/lib/modules/profile/presentation/bloc/profile_state.dart) | Dart | 122 | 18 | 9 | 149 |
| [lib/modules/profile/presentation/screens/add_new_address_screen.dart](/lib/modules/profile/presentation/screens/add_new_address_screen.dart) | Dart | 52 | 0 | 0 | 52 |
| [lib/modules/profile/presentation/screens/address_screen.dart](/lib/modules/profile/presentation/screens/address_screen.dart) | Dart | 49 | 2 | 0 | 51 |
| [lib/modules/profile/presentation/widgets/add new address/address_information_widget.dart](/lib/modules/profile/presentation/widgets/add%20new%20address/address_information_widget.dart) | Dart | 89 | 0 | 4 | 93 |
| [lib/modules/profile/presentation/widgets/add new address/custom_map_widget.dart](/lib/modules/profile/presentation/widgets/add%20new%20address/custom_map_widget.dart) | Dart | 117 | 0 | 10 | 127 |
| [lib/modules/profile/presentation/widgets/add new address/save_new_address_button_widget.dart](/lib/modules/profile/presentation/widgets/add%20new%20address/save_new_address_button_widget.dart) | Dart | 71 | 0 | 6 | 77 |
| [lib/modules/splash/data/datasources/splash_local_data_source.dart](/lib/modules/splash/data/datasources/splash_local_data_source.dart) | Dart | -2 | 0 | -1 | -3 |
| [lib/modules/splash/presentation/bloc/splash_bloc.dart](/lib/modules/splash/presentation/bloc/splash_bloc.dart) | Dart | 8 | 0 | 0 | 8 |
| [pubspec.yaml](/pubspec.yaml) | YAML | 17 | -2 | 3 | 18 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details