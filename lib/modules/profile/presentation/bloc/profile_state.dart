// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState({
    //! Get Profile Data
    this.profile,
    this.getProfileDataErrorMessage = '',
    this.getProfileDataRequestState = RequestState.initial,
    //! Update Profile Data
    this.profileData,
    this.updateProfileDataErrorMessage,
    this.updateProfileDataRequestState = RequestState.initial,
    //! Get Notification Data
    this.notifications,
    this.getNotificationDataErrorMessage = '',
    this.getNotificationDataRequestState = RequestState.initial,
    //! Get FAQs Data
    this.faqs,
    this.getFAQsDataErrorMessage = '',
    this.getFAQsDataRequestState = RequestState.initial,
    //! Get Current Location
    this.locationData,
    this.currentLocationData,
    this.getCurrentLocationErrorMessage = '',
    this.getCurrentLocationRequestState = RequestState.initial,
    this.placeMarks,
    //! Get Current Address
    this.currentAddress,
    this.getCurrentAddressErrorMessage = '',
    this.getCurrentAddressRequestState = RequestState.initial,
    //! Get Address Data
    this.address,
    this.getAddressErrorMessage = '',
    this.getAddressRequestState = RequestState.initial,
    //! Add New Address
    this.addNewAddressErrorMessage = '',
    this.addNewAddressRequestState = RequestState.initial,
    this.newAddress,
    //! Delete Address
    this.deleteAddressErrorMessage = '',
    this.deleteAddressRequestState = RequestState.initial,
    //! Update Address
    this.updateAddressErrorMessage = '',
    this.updateAddressRequestState = RequestState.initial,
    this.updatedAddress,
    //! Address Type
    this.addressType,
    //! Default Address
    this.defaultAddress,
    //! Default Address Key
    this.defaultAddressKey,
  });

  //! Get Profile Data
  final Profile? profile;
  final String getProfileDataErrorMessage;
  final RequestState getProfileDataRequestState;

  //! Update Profile Data
  final ProfileData? profileData;
  final String? updateProfileDataErrorMessage;
  final RequestState updateProfileDataRequestState;

  //! Get Notification Data
  final Notifications? notifications;
  final String getNotificationDataErrorMessage;
  final RequestState getNotificationDataRequestState;

  //! Get FAQs Data
  final FAQs? faqs;
  final String getFAQsDataErrorMessage;
  final RequestState getFAQsDataRequestState;

  //! Get Current Location
  final LatLng? locationData;
  final LatLng? currentLocationData;
  final String? getCurrentLocationErrorMessage;
  final RequestState getCurrentLocationRequestState;
  final String? placeMarks;

  //! Get Current Address
  final String? currentAddress;
  final String? getCurrentAddressErrorMessage;
  final RequestState getCurrentAddressRequestState;

  //! Get Address Data
  final List<Address>? address;
  final String getAddressErrorMessage;
  final RequestState getAddressRequestState;

  //! Add New Address
  final String? addNewAddressErrorMessage;
  final RequestState addNewAddressRequestState;
  final Address? newAddress;

  //! Delete Address
  final String? deleteAddressErrorMessage;
  final RequestState deleteAddressRequestState;

  //! Update Address
  final String? updateAddressErrorMessage;
  final RequestState updateAddressRequestState;
  final Address? updatedAddress;

  //! Address Type
  final String? addressType;

  //! Default Address
  final Address? defaultAddress;

  //! Default Address Key
  final String? defaultAddressKey;

  @override
  List<Object?> get props => [
        profile,
        getProfileDataErrorMessage,
        getProfileDataRequestState,
        profileData,
        updateProfileDataErrorMessage,
        updateProfileDataRequestState,
        notifications,
        getNotificationDataErrorMessage,
        getNotificationDataRequestState,
        faqs,
        getFAQsDataErrorMessage,
        getFAQsDataRequestState,
        locationData,
        currentLocationData,
        getCurrentLocationErrorMessage,
        getCurrentLocationRequestState,
        placeMarks,
        currentAddress,
        getCurrentAddressErrorMessage,
        getCurrentAddressRequestState,
        address,
        getAddressErrorMessage,
        getAddressRequestState,
        addNewAddressErrorMessage,
        addNewAddressRequestState,
        newAddress,
        deleteAddressErrorMessage,
        deleteAddressRequestState,
        updateAddressErrorMessage,
        updateAddressRequestState,
        updatedAddress,
        addressType,
        defaultAddress,
        defaultAddressKey,
      ];

  ProfileState copyWith({
    Profile? profile,
    String? getProfileDataErrorMessage,
    RequestState? getProfileDataRequestState,
    ProfileData? profileData,
    String? updateProfileDataErrorMessage,
    RequestState? updateProfileDataRequestState,
    Notifications? notifications,
    String? getNotificationDataErrorMessage,
    RequestState? getNotificationDataRequestState,
    FAQs? faqs,
    String? getFAQsDataErrorMessage,
    RequestState? getFAQsDataRequestState,
    LatLng? locationData,
    LatLng? currentLocationData,
    String? getCurrentLocationErrorMessage,
    RequestState? getCurrentLocationRequestState,
    String? placeMarks,
    String? currentAddress,
    String? getCurrentAddressErrorMessage,
    RequestState? getCurrentAddressRequestState,
    List<Address>? address,
    String? getAddressErrorMessage,
    RequestState? getAddressRequestState,
    String? addNewAddressErrorMessage,
    RequestState? addNewAddressRequestState,
    Address? newAddress,
    String? deleteAddressErrorMessage,
    RequestState? deleteAddressRequestState,
    String? updateAddressErrorMessage,
    RequestState? updateAddressRequestState,
    Address? updatedAddress,
    String? addressType,
    Address? defaultAddress,
    String? defaultAddressKey,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      getProfileDataErrorMessage:
          getProfileDataErrorMessage ?? this.getProfileDataErrorMessage,
      getProfileDataRequestState:
          getProfileDataRequestState ?? this.getProfileDataRequestState,
      profileData: profileData ?? this.profileData,
      updateProfileDataErrorMessage:
          updateProfileDataErrorMessage ?? this.updateProfileDataErrorMessage,
      updateProfileDataRequestState:
          updateProfileDataRequestState ?? this.updateProfileDataRequestState,
      notifications: notifications ?? this.notifications,
      getNotificationDataErrorMessage: getNotificationDataErrorMessage ??
          this.getNotificationDataErrorMessage,
      getNotificationDataRequestState: getNotificationDataRequestState ??
          this.getNotificationDataRequestState,
      faqs: faqs ?? this.faqs,
      getFAQsDataErrorMessage:
          getFAQsDataErrorMessage ?? this.getFAQsDataErrorMessage,
      getFAQsDataRequestState:
          getFAQsDataRequestState ?? this.getFAQsDataRequestState,
      locationData: locationData ?? this.locationData,
      currentLocationData: currentLocationData ?? this.currentLocationData,
      getCurrentLocationErrorMessage:
          getCurrentLocationErrorMessage ?? this.getCurrentLocationErrorMessage,
      getCurrentLocationRequestState:
          getCurrentLocationRequestState ?? this.getCurrentLocationRequestState,
      placeMarks: placeMarks ?? this.placeMarks,
      currentAddress: currentAddress ?? this.currentAddress,
      getCurrentAddressErrorMessage:
          getCurrentAddressErrorMessage ?? this.getCurrentAddressErrorMessage,
      getCurrentAddressRequestState:
          getCurrentAddressRequestState ?? this.getCurrentAddressRequestState,
      address: address ?? this.address,
      getAddressErrorMessage:
          getAddressErrorMessage ?? this.getAddressErrorMessage,
      getAddressRequestState:
          getAddressRequestState ?? this.getAddressRequestState,
      addNewAddressErrorMessage:
          addNewAddressErrorMessage ?? this.addNewAddressErrorMessage,
      addNewAddressRequestState:
          addNewAddressRequestState ?? this.addNewAddressRequestState,
      newAddress: newAddress ?? this.newAddress,
      deleteAddressErrorMessage:
          deleteAddressErrorMessage ?? this.deleteAddressErrorMessage,
      deleteAddressRequestState:
          deleteAddressRequestState ?? this.deleteAddressRequestState,
      updateAddressErrorMessage:
          updateAddressErrorMessage ?? this.updateAddressErrorMessage,
      updateAddressRequestState:
          updateAddressRequestState ?? this.updateAddressRequestState,
      updatedAddress: updatedAddress ?? this.updatedAddress,
      addressType: addressType ?? this.addressType,
      defaultAddress: defaultAddress ?? this.defaultAddress,
      defaultAddressKey: defaultAddressKey ?? this.defaultAddressKey,
    );
  }
}
