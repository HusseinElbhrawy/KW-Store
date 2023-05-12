import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final bool? status;
  final String? message;
  final ProfileData? data;

  const Profile({
    required this.status,
    this.message,
    this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class ProfileData extends Equatable {
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? token;

  const ProfileData({
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
  });
  @override
  List<Object?> get props => [
        name,
        email,
        phone,
        image,
        token,
      ];
}
