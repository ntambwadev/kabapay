import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentInstrumentModel {
  final String id;
  final String type;
  final String title;
  final String subtitle;
  final String imageUrl;

  PaymentInstrumentModel({
    required this.id,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.imageUrl});

  factory PaymentInstrumentModel.fromMap(Map<String, dynamic> json) {
    return PaymentInstrumentModel(
      id: json['id'] ?? '',
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      imageUrl: json['subtitle'] ?? '',
    );
  }

  factory PaymentInstrumentModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return PaymentInstrumentModel(
      id: data['id'] ?? '',
      type: data['type'] ?? '',
      title: data['title'] ?? '',
      subtitle: data['subtitle'] ?? '',
      imageUrl: data['subtitle'] ?? '',
    );
  }
}