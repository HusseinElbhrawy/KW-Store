// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Notifications extends Equatable {
  final bool status;
  final String? message;
  final NotificationData? data;
  const Notifications({
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

class NotificationData extends Equatable {
  final int total;
  final List<NotificationItem> data;
  const NotificationData({
    required this.total,
    required this.data,
  });

  @override
  List<Object?> get props => [
        total,
        data,
      ];
}

class NotificationItem extends Equatable {
  final int id;
  final String title;
  final String message;
  const NotificationItem({
    required this.id,
    required this.title,
    required this.message,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        message,
      ];
}
