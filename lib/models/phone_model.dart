import 'package:cloud_firestore/cloud_firestore.dart';

class PhoneModel {
  final String number;
  final String telecom;
  final String mobileMoney;

  PhoneModel({
    required this.number,
    required this.telecom,
    required this.mobileMoney});

  factory PhoneModel.fromMap(Map<String, dynamic> json) {
    return PhoneModel(
      number: json['number'] ?? '',
      telecom: json['telecom'] ?? '',
      mobileMoney: json['mobileMoney'] ?? '',
    );
  }

  factory PhoneModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return PhoneModel(
      number: data['number'] ?? '',
      telecom: data['telecom'] ?? '',
      mobileMoney: data['mobileMoney'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'number': number,
    'telecom': telecom,
    'mobileMoney': mobileMoney,
  };
}