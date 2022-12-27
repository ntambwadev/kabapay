import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kabapay/models/phone_model.dart';

import 'token_model.dart';

class TransactionModel {
  final String id;
  final String userId;
  final String amountPaid;
  final String tokenAmount;
  final String type;
  // final TokenModel token;
  final String userAddress;
  final String recipientAddress;
  final PhoneModel phone;

  TransactionModel({required this.id, required this.userId,
    required this.amountPaid, required this.tokenAmount,
    required this.type, required this.userAddress,
    required this.recipientAddress, required this.phone});

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {

    Map data = doc.data() as Map;
    // debugPrint(data.toString());
    // debugPrint(data['phone'].toString());
    return TransactionModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      amountPaid: data['amountPaid'] ?? '',
      tokenAmount: data['tokenAmount'] ?? '',
      type: data['type'] ?? '',
      // token: TokenModel.fromMap(data['token']),
      userAddress: data['userAddress'] ?? '',
      recipientAddress: data['recipientAddress'] ?? '',
      phone: PhoneModel.fromMap(data['phone'] as Map<String, dynamic>),
    );
  }
}