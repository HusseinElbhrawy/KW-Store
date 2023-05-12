// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../domain/entities/faqs.dart';

class FaqsModel extends FAQs {
  const FaqsModel({
    required super.status,
    super.data,
    super.message,
  });

  FaqsModel copyWith({
    bool? status,
    String? message,
    List<FaqsDataModel>? data,
  }) {
    return FaqsModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data!.map((x) => x).toList(),
    };
  }

  factory FaqsModel.fromMap(Map<String, dynamic> map) {
    return FaqsModel(
      status: map['status'] as bool,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<FaqsDataModel>.from(
              (map['data']['data'] as List).map<FaqsDataModel?>(
                (x) => FaqsDataModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqsModel.fromJson(String source) =>
      FaqsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FaqsModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant FaqsModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class FaqsDataModel extends FAQsData {
  const FaqsDataModel({
    required super.id,
    required super.question,
    required super.answer,
  });

  FaqsDataModel copyWith({
    int? id,
    String? question,
    String? answer,
  }) {
    return FaqsDataModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'answer': answer,
    };
  }

  factory FaqsDataModel.fromMap(Map<String, dynamic> map) {
    return FaqsDataModel(
      id: map['id'] as int,
      question: map['question'] as String,
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqsDataModel.fromJson(String source) =>
      FaqsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FaqsDataModel(id: $id, question: $question, answer: $answer)';

  @override
  bool operator ==(covariant FaqsDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.answer == answer;
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ answer.hashCode;
}
