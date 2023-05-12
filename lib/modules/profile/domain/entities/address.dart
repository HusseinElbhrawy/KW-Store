// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 0)
class Address extends HiveObject {
  @HiveField(0)
  final String street;
  @HiveField(1)
  final String region;
  @HiveField(2)
  final String state;
  @HiveField(3)
  final String fullAddress;
  @HiveField(4)
  final String note;
  @HiveField(5)
  final double latitude;
  @HiveField(6)
  final double longitude;
  @HiveField(7)
  final String type;

  Address({
    required this.street,
    required this.region,
    required this.state,
    required this.fullAddress,
    required this.note,
    required this.latitude,
    required this.longitude,
    required this.type,
  });
}
