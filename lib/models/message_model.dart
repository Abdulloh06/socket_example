import 'package:flutter/foundation.dart';

@immutable
class MessageModel {
  final int id;
  final String name;
  final String userId;
  final String message;
  final String date;

  const MessageModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.date,
    required this.message,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      userId: json['userId'] ?? "",
      name: json['personName'] ?? "",
      message: json['message'] ?? "",
      date: json['date'] ?? "",
    );
  }
}