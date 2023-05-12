// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kw_store/app/injector.dart';
import 'package:kw_store/core/utils/constant.dart';
import 'package:kw_store/core/utils/enums.dart';
import 'package:kw_store/modules/profile/domain/entities/address.dart';
import 'package:kw_store/modules/profile/domain/entities/faqs.dart';
import 'package:kw_store/modules/profile/domain/usecases/delete_new_address_use_case.dart';
import 'package:kw_store/modules/profile/domain/usecases/get_faqs_use_case.dart';
import 'package:kw_store/modules/profile/domain/usecases/get_notification_use_case.dart';
import 'package:kw_store/modules/profile/domain/usecases/get_user_address_use_case.dart';
import 'package:kw_store/modules/profile/domain/usecases/save_new_address_use_case.dart';
import 'package:kw_store/modules/profile/domain/usecases/update_profile_use_case.dart';
import 'package:kw_store/modules/profile/domain/usecases/update_user_address_use_case.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/database/i_local_data_base.dart';
import '../../../../core/usecase/params/params.dart';
import '../../domain/entities/notification.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/get_profile_data_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final GetNotificationUseCase _getNotificationDataUseCase;
  final GetFaqsUseCase _getFAQsDataUseCase;
  final SaveNewAddressUseCase _saveNewAddressUseCase;
  final DeleteNewAddressUseCase _deleteAddressUseCase;
  final UpdateUserAddressUseCase _updateUserAddressUseCase;
  final GetUserAddressUseCase _getUserAddressUseCase;

  ProfileBloc(
    this._getProfileDataUseCase,
    this._updateProfileUseCase,
    this._getNotificationDataUseCase,
    this._getFAQsDataUseCase,
    this._saveNewAddressUseCase,
    this._deleteAddressUseCase,
    this._updateUserAddressUseCase,
    this._getUserAddressUseCase,
  ) : super(const ProfileState()) {
    on<GetProfileDataEvent>((event, emit) {
      return _getProfileData();
    });

    on<UpdateProfileDataEvent>((event, emit) {
      return _updateProfileData(event.profileData);
    });

    on<GetNotificationDataEvent>((event, emit) {
      return _getNotificationData();
    });

    on<GetFAQsDataEvent>((event, emit) {
      return _getFAQsData();
    });

    on<GetCurrentLocationEvent>((event, emit) {
      return _getCurrentLocation();
    });

    on<GetTheAddressOfLocationEvent>((event, emit) {
      return _getTheAddressOfLocation(
        event.locationData.latitude,
        event.locationData.longitude,
      );
    });

    on<AssignNewAddressEvent>((event, emit) {
      return _assignNewLocation(event.locationData);
    });

    on<AddNewAddressEvent>((event, emit) {
      return _addNewAddress(event.address);
    });

    on<DeleteAddressEvent>((event, emit) {
      return _deleteAddress(event.address);
    });

    on<UpdateAddressEvent>((event, emit) {
      return _updateAddress(event.address);
    });

    on<GetAddressesEvent>((event, emit) {
      return _getUserAddress();
    });

    on<AssignAddressType>((event, emit) {
      return _assignAddressType(event.addressType);
    });

    on<SetDefaultAddressEvent>((event, emit) {
      return _setDefaultAddress(event.address);
    });

    on<GetDefaultAddressEvent>((event, emit) {
      return _getDefaultAddress();
    });
  }

  void _getProfileData() async {
    emit(state.copyWith(getProfileDataRequestState: RequestState.loading));

    final response = await _getProfileDataUseCase(NoParams());

    emit(
      response.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            getProfileDataRequestState: RequestState.error,
            getProfileDataErrorMessage: failure.message.toString(),
          );
        },
        (profile) {
          return state.copyWith(
            getProfileDataRequestState: RequestState.loaded,
            profile: profile,
          );
        },
      ),
    );
  }

  void _updateProfileData(UpdateProfileParams profile) async {
    emit(state.copyWith(updateProfileDataRequestState: RequestState.loading));

    final response = await _updateProfileUseCase(profile);

    emit(
      response.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            updateProfileDataRequestState: RequestState.error,
            updateProfileDataErrorMessage: failure.message.toString(),
          );
        },
        (profile) {
          return state.copyWith(
            updateProfileDataRequestState: RequestState.loaded,
            profile: profile,
          );
        },
      ),
    );
  }

  void _getNotificationData() async {
    emit(state.copyWith(getNotificationDataRequestState: RequestState.loading));

    final response = await _getNotificationDataUseCase(NoParams());

    emit(
      response.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            getNotificationDataRequestState: RequestState.error,
            getNotificationDataErrorMessage: failure.message.toString(),
          );
        },
        (notification) {
          return state.copyWith(
            getNotificationDataRequestState: RequestState.loaded,
            notifications: notification,
          );
        },
      ),
    );
  }

  void _getFAQsData() async {
    emit(state.copyWith(getFAQsDataRequestState: RequestState.loading));

    final response = await _getFAQsDataUseCase(NoParams());

    emit(
      response.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            getFAQsDataRequestState: RequestState.error,
            getFAQsDataErrorMessage: failure.message.toString(),
          );
        },
        (faqs) {
          return state.copyWith(
            getFAQsDataRequestState: RequestState.loaded,
            faqs: faqs,
          );
        },
      ),
    );
  }

  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _addressDetailsController =
      TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  TextEditingController get placeController => _placeController;
  TextEditingController get cityController => _cityController;
  TextEditingController get stateController => _stateController;
  TextEditingController get addressDetailsController =>
      _addressDetailsController;
  TextEditingController get notesController => _notesController;

  final ILocalDataBase _localDataBase = serviceLocator<ILocalDataBase>();

  void setPlaceController(String value) {
    _placeController.text = value;
  }

  void setCityController(String value) {
    _cityController.text = value;
  }

  void setStateController(String value) {
    _stateController.text = value;
  }

  void setAddressDetailsController(String value) {
    _addressDetailsController.text = value;
  }

  void setNotesController(String value) {
    _notesController.text = value;
  }

  Future<void> _getCurrentLocation() async {
    emit(state.copyWith(getCurrentLocationRequestState: RequestState.loading));

    try {
      PermissionStatus status = await Permission.location.request();
      if (status != PermissionStatus.granted) {
        emit(
          state.copyWith(
            getCurrentLocationRequestState: RequestState.error,
            getCurrentLocationErrorMessage: 'Permission denied',
          ),
        );
      } else {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation,
        );
        add(
          GetTheAddressOfLocationEvent(
            locationData: LatLng(position.latitude, position.longitude),
          ),
        );

        emit(
          state.copyWith(
            currentLocationData: LatLng(position.latitude, position.longitude),
            locationData: LatLng(position.latitude, position.longitude),
            getCurrentLocationRequestState: RequestState.loaded,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          getCurrentLocationRequestState: RequestState.error,
          getCurrentLocationErrorMessage: e.toString(),
        ),
      );
    }
  }

  void _getTheAddressOfLocation(double latitude, double longitude) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(
            state.copyWith(
              getCurrentAddressRequestState: RequestState.error,
              getCurrentAddressErrorMessage: 'Permission denied',
            ),
          );
        }

        if (permission == LocationPermission.deniedForever) {
          emit(
            state.copyWith(
              getCurrentAddressRequestState: RequestState.error,
              getCurrentAddressErrorMessage: 'Permission denied',
            ),
          );
        }
      }

      final service = await Geolocator.isLocationServiceEnabled();
      if (!service) {
        await Geolocator.openLocationSettings();

        emit(state.copyWith(
          getCurrentLocationRequestState: RequestState.error,
          getCurrentLocationErrorMessage: 'Permission denied',
        ));
      } else {
        // var placeMarks = await placemarkFromCoordinates(
        //   latitude,
        //   longitude,
        //   localeIdentifier: 'en',
        // );

        var placeMarks =
            await GeocodingPlatform.instance.placemarkFromCoordinates(
          latitude,
          longitude,
          localeIdentifier: 'en',
        );
        _setInfoOfPlace(placeMarks);

        emit(
          state.copyWith(placeMarks: placeMarks.first.toString()),
        );
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
        getCurrentAddressRequestState: RequestState.error,
        getCurrentAddressErrorMessage: e.toString(),
      ));
    }
  }

  void _setInfoOfPlace(List<Placemark> placeMarks) {
    setAddressDetailsController(
      '${placeMarks.first.name!}, ${placeMarks.first.locality} , ${placeMarks.first.administrativeArea} , ${placeMarks.first.country}',
    );
    setCityController(placeMarks.first.locality!);

    setPlaceController(placeMarks.first.name!);

    setStateController(placeMarks.first.administrativeArea!);
  }

  void _assignNewLocation(LatLng location) {
    emit(
      state.copyWith(locationData: location),
    );

    add(GetTheAddressOfLocationEvent(locationData: location));
  }

  void _addNewAddress(Address address) async {
    emit(state.copyWith(addNewAddressRequestState: RequestState.loading));

    final result = await _saveNewAddressUseCase(address);

    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            addNewAddressRequestState: RequestState.error,
            addNewAddressErrorMessage: failure.message.toString(),
          );
        },
        (success) {
          _clearControllers();
          return state.copyWith(
            addNewAddressRequestState: RequestState.loaded,
          );
        },
      ),
    );
  }

  void _getUserAddress() async {
    emit(state.copyWith(getAddressRequestState: RequestState.loading));

    final response = await _getUserAddressUseCase(NoParams());

    emit(
      response.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            getAddressRequestState: RequestState.error,
            getAddressErrorMessage: failure.message.toString(),
          );
        },
        (address) {
          if (address.isNotEmpty) {
            add(GetDefaultAddressEvent());
          }
          return state.copyWith(
            getAddressRequestState: RequestState.loaded,
            address: address,
          );
        },
      ),
    );
  }

  void _updateAddress(Address address) async {
    emit(state.copyWith(updateAddressRequestState: RequestState.loading));

    final response = await _updateUserAddressUseCase(address);

    emit(
      response.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            updateAddressRequestState: RequestState.error,
            updateAddressErrorMessage: failure.message.toString(),
          );
        },
        (address) {
          return state.copyWith(
            updateAddressRequestState: RequestState.loaded,
          );
        },
      ),
    );
  }

  void _deleteAddress(Address address) async {
    emit(state.copyWith(deleteAddressRequestState: RequestState.loading));

    final response = await _deleteAddressUseCase(address);

    emit(
      response.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            deleteAddressRequestState: RequestState.error,
            deleteAddressErrorMessage: failure.message.toString(),
          );
        },
        (response) {
          add(GetAddressesEvent());
          if (address.key.toString() == state.defaultAddress!.key.toString()) {
            _localDataBase.deleteValue(AppConstant.defaultAddress).then(
                  (value) {},
                );

            if (state.address!.length != 1) {
              var newAddress = state.address!
                  .where((element) => element.key != address.key)
                  .toList();
              emit(state.copyWith(defaultAddress: newAddress.first));
            }
          }

          return state.copyWith(
            deleteAddressRequestState: RequestState.loaded,
          );
        },
      ),
    );
  }

  void _assignAddressType(String type) {
    emit(state.copyWith(addressType: type));
  }

  void _setDefaultAddress(Address address) async {
    final ILocalDataBase localDataBase = serviceLocator<ILocalDataBase>();
    await localDataBase.set(AppConstant.defaultAddress, address.key.toString());

    emit(state.copyWith(defaultAddress: address));
    log('Default address is ${state.defaultAddress!.fullAddress}');
  }

  void _getDefaultAddress() async {
    String? defaultAddress =
        await _localDataBase.get(AppConstant.defaultAddress);
    if (defaultAddress != null) {
      log('Default address is $defaultAddress');

      emit(
        state.copyWith(
          defaultAddress: state.address!.firstWhere(
            (element) => element.key.toString() == defaultAddress,
          ),
        ),
      );
    } else {
      log('Default address is null');
      emit(state.copyWith(defaultAddress: null));
    }
  }

  void _clearControllers() {
    _placeController.clear();
    _cityController.clear();
    _stateController.clear();
    _addressDetailsController.clear();
    _notesController.clear();
  }

  @override
  Future<void> close() {
    isClosed ? log('ProfileBloc already closed') : log('ProfileBloc closed');
    _placeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _addressDetailsController.dispose();
    _notesController.dispose();

    return super.close();
  }
}
