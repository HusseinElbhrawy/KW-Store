// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.status,
    super.message,
    super.data,
  });

  ProfileModel copyWith({
    bool? status,
    String? message,
    ProfileModelData? data,
  }) {
    return ProfileModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? ProfileModelData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProfileModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class ProfileModelData extends ProfileData {
  const ProfileModelData({
    super.name,
    super.email,
    super.phone,
    super.image,
    super.token,
  });

  ProfileModelData copyWith({
    String? name,
    String? email,
    String? phone,
    String? image,
    String? token,
  }) {
    return ProfileModelData(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token,
    };
  }

  factory ProfileModelData.fromMap(Map<String, dynamic> map) {
    return ProfileModelData(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModelData.fromJson(String source) =>
      ProfileModelData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileModelData(name: $name, email: $email, phone: $phone, image: $image, token: $token)';
  }

  @override
  bool operator ==(covariant ProfileModelData other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.image == image &&
        other.token == token;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        image.hashCode ^
        token.hashCode;
  }
}
