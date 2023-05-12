// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/entities/notification.dart';

class NotificationsModel extends Notifications {
  const NotificationsModel({
    required super.status,
    super.data,
    super.message,
  });

  NotificationsModel copyWith({
    bool? status,
    String? message,
    NotificationDataModel? data,
  }) {
    return NotificationsModel(
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

  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      status: map['status'] ?? false,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? NotificationDataModel.fromMap(map['data'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationsModel.fromJson(String source) =>
      NotificationsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NotificationsModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant NotificationsModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class NotificationDataModel extends NotificationData {
  const NotificationDataModel({
    required super.total,
    required super.data,
  });

  NotificationDataModel copyWith({
    int? total,
    List<NotificationItemModel>? data,
  }) {
    return NotificationDataModel(
      total: total ?? this.total,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'data': data.map((x) => x).toList(),
    };
  }

  factory NotificationDataModel.fromMap(Map<String, dynamic> map) {
    return NotificationDataModel(
      total: map['total'] as int,
      data: List<NotificationItemModel>.from(
        (map['data'] as List).map<NotificationItemModel>(
          (x) => NotificationItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      // data: List<NotificationItemModel>.from(
      //   (map['data'] as List).map<NotificationItemModel>(
      //     (x) => NotificationItemModel.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationDataModel.fromJson(String source) =>
      NotificationDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NotificationDataModel(total: $total, data: $data)';

  @override
  bool operator ==(covariant NotificationDataModel other) {
    if (identical(this, other)) return true;

    return other.total == total && listEquals(other.data, data);
  }

  @override
  int get hashCode => total.hashCode ^ data.hashCode;
}

class NotificationItemModel extends NotificationItem {
  const NotificationItemModel({
    required super.id,
    required super.title,
    required super.message,
  });

  NotificationItemModel copyWith({
    int? id,
    String? title,
    String? message,
  }) {
    return NotificationItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'message': message,
    };
  }

  factory NotificationItemModel.fromMap(Map<String, dynamic> map) {
    return NotificationItemModel(
      id: map['id'] as int,
      title: map['title'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationItemModel.fromJson(String source) =>
      NotificationItemModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NotificationInnerDataModel(id: $id, title: $title, message: $message)';

  @override
  bool operator ==(covariant NotificationItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.message == message;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ message.hashCode;
}
