import 'package:equatable/equatable.dart';

class KioskDataPayment extends Equatable {
  const KioskDataPayment({required this.billReference});

  final int billReference;

  @override
  List<Object?> get props => [billReference];
}
