part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileDataEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateProfileDataEvent extends ProfileEvent {
  final UpdateProfileParams profileData;
  const UpdateProfileDataEvent({required this.profileData});
  @override
  List<Object?> get props => [profileData];
}

class GetNotificationDataEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class GetFAQsDataEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class GetCurrentLocationEvent extends ProfileEvent {
  const GetCurrentLocationEvent();
  @override
  List<Object?> get props => [];
}

class GetTheAddressOfLocationEvent extends ProfileEvent {
  final LatLng locationData;
  const GetTheAddressOfLocationEvent({
    required this.locationData,
  });
  @override
  List<Object?> get props => [
        locationData,
      ];
}

class AssignNewAddressEvent extends ProfileEvent {
  final BuildContext context;
  final LatLng locationData;
  const AssignNewAddressEvent(
      {required this.locationData, required this.context});
  @override
  List<Object?> get props => [locationData, context];
}

class AddNewAddressEvent extends ProfileEvent {
  final Address address;
  const AddNewAddressEvent({required this.address});
  @override
  List<Object?> get props => [address];
}

class DeleteAddressEvent extends ProfileEvent {
  final Address address;
  const DeleteAddressEvent({required this.address});
  @override
  List<Object?> get props => [address];
}

class GetAddressesEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateAddressEvent extends ProfileEvent {
  final Address address;
  const UpdateAddressEvent({required this.address});
  @override
  List<Object?> get props => [address];
}

class AssignAddressType extends ProfileEvent {
  final String addressType;
  const AssignAddressType({this.addressType = 'Home 🏠'});
  @override
  List<Object?> get props => [addressType];
}

class SetDefaultAddressEvent extends ProfileEvent {
  final Address address;
  const SetDefaultAddressEvent({required this.address});
  @override
  List<Object?> get props => [address];
}

class GetDefaultAddressEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
