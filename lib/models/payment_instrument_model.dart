import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentInstrumentModel {
  final String id;
  final PayementInstrumentType type;
  final String organizationName;
  final String productName;
  final String accountNumber;
  final String imageUrl;

  PaymentInstrumentModel({
    required this.id,
    required this.type,
    required this.organizationName,
    required this.productName,
    required this.accountNumber,
    required this.imageUrl});

  factory PaymentInstrumentModel.fromMap(Map<String, dynamic> json) {
    return PaymentInstrumentModel(
      id: json['id'] ?? '',
      type: PayementInstrumentType.fromValue(json['type'] ?? ''),
      organizationName: json['organizationName'] ?? '',
      productName: json['productName'] ?? '',
      accountNumber: json['accountNumber'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  factory PaymentInstrumentModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return PaymentInstrumentModel(
      id: data['id'] ?? '',
      type: PayementInstrumentType.fromValue(data['type'] ?? ''),
      organizationName: data['organizationName'] ?? '',
      productName: data['productName'] ?? '',
      accountNumber: data['accountNumber'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.value,
    'organizationName': organizationName,
    'productName': productName,
    'accountNumber': accountNumber,
    'imageUrl': imageUrl,
  };
}

enum PayementInstrumentType {
  MOMO('momo'),
  BANK_CONGO('bank_congo'),
  INTERAC('interac');

  const PayementInstrumentType(this.value);
  final String value;

  factory PayementInstrumentType.fromValue(String value) {
    return values.firstWhere((e) => e.value == value);
  }
}

enum MomoTelecomOption {
  AIRTEL('airtel'),
  ORANGE('orange'),
  VODACOM('vodacom');

  const MomoTelecomOption(this.value);
  final String value;

  factory MomoTelecomOption.fromValue(String value) {
    return values.firstWhere((e) => e.value == value);
  }
}