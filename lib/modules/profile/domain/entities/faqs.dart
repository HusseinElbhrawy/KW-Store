import 'package:equatable/equatable.dart';

class FAQs extends Equatable {
  final bool status;
  final String? message;
  final List<FAQsData>? data;

  const FAQs({
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

class FAQsData extends Equatable {
  final int id;
  final String question;
  final String answer;

  const FAQsData({
    required this.id,
    required this.question,
    required this.answer,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        answer,
      ];
}
