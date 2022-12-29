import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kabapay/models/phone_model.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'token_model.dart';

class TransactionModel {
  final String id;
  final String userId;
  final String amountPaid;
  final String tokenAmount;
  final TransactionType type;
  final TokenModel token;
  final String userAddress;
  final String recipientAddress;
  final PhoneModel phone;
  final String createdAt;
  final TransactionStatus status;

  TransactionModel({required this.id, required this.userId,
    required this.amountPaid, required this.tokenAmount,
    required this.type, required this.token, required this.userAddress,
    required this.recipientAddress, required this.phone, required this.createdAt,
    required this.status});

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return TransactionModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      amountPaid: data['amountPaid'] ?? '',
      tokenAmount: data['tokenAmount'] ?? '',
      type: TransactionType.fromValue(data['type']),
      token: TokenModel.fromMap(data['token']),
      userAddress: data['userAddress'] ?? '',
      recipientAddress: data['recipientAddress'] ?? '',
      phone: PhoneModel.fromMap(data['phone'] as Map<String, dynamic>),
      createdAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(data['createdAt'])),
      status: TransactionStatus.fromValue(data['status'] ?? ''),
    );
  }
}

enum TransactionStatus {
  WAITING_FOR_USER_PAYMENT('WAITING_FOR_USER_PAYMENT'),
  RECEIVED_USER_PAYMENT('RECEIVED_USER_PAYMENT'),
  CRYPTO_TRANSFER_PROCESSING('CRYPTO_TRANSFER_PROCESSING'),
  CRYPTO_TRANSFER_COMPLETED('CRYPTO_TRANSFER_COMPLETED'),
  CRYPTO_TRANSFER_FAILED('CRYPTO_TRANSFER_FAILED'),
  PAYOUT_CRYPTO_TRANSFER_PROCESSING('PAYOUT_CRYPTO_TRANSFER_PROCESSING'),
  PAYOUT_CRYPTO_TRANSFER_SUCCEDED('PAYOUT_CRYPTO_TRANSFER_SUCCEDED'),
  PAYOUT_CRYPTO_TRANSFER_FAILED('PAYOUT_CRYPTO_TRANSFER_FAILED'),
  PAYOUT_MOMO_TRANSFER_PROCESSING('PAYOUT_MOMO_TRANSFER_PROCESSING'),
  PAYOUT_MOMO_TRANSFER_SUCCEDEED('PAYOUT_MOMO_TRANSFER_SUCCEDEED'),
  PAYOUT_MOMO_TRANSFER_FAILED('PAYOUT_MOMO_TRANSFER_FAILED');

  const TransactionStatus(this.value);
  final String value;

  factory TransactionStatus.fromValue(String value) {
    return values.firstWhere((e) => e.value == value);
  }
}

extension TransactionStatusExtension on TransactionStatus {
  String get descriptionKey {
    switch (this) {
      case TransactionStatus.WAITING_FOR_USER_PAYMENT:
        return 'status_pending_payment';
      case TransactionStatus.WAITING_FOR_USER_PAYMENT:
        return 'status_payment_received';
      case TransactionStatus.CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_SUCCEDED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_PROCESSING:
        return 'status_processing';
      case TransactionStatus.CRYPTO_TRANSFER_COMPLETED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_SUCCEDEED:
        return 'status_completed';
      case TransactionStatus.CRYPTO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_FAILED:
        return 'status_failed';
      default:
        return "";
    }
  }

  int get index {
    switch (this) {
      case TransactionStatus.WAITING_FOR_USER_PAYMENT:
        return 0;
      case TransactionStatus.WAITING_FOR_USER_PAYMENT:
        return 1;
      case TransactionStatus.CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_SUCCEDED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_PROCESSING:
        return 2;
      case TransactionStatus.CRYPTO_TRANSFER_COMPLETED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_SUCCEDEED:
        return 3;
      case TransactionStatus.CRYPTO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_FAILED:
        return 4;
      default:
        return -1;
    }
  }

  Color get color {
    switch (this) {
      case TransactionStatus.WAITING_FOR_USER_PAYMENT:
      case TransactionStatus.WAITING_FOR_USER_PAYMENT:
      case TransactionStatus.CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_SUCCEDED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_PROCESSING:
        return Colors.deepOrangeAccent;
      case TransactionStatus.CRYPTO_TRANSFER_COMPLETED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_SUCCEDEED:
        return Colors.green;
      case TransactionStatus.CRYPTO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_FAILED:
        return Colors.red;
      default:
        return Colors.red;
    }
  }
}

enum TransactionType {
  BUY('buy'),
  SEND('send'),
  RECEIVED('received'),
  PAY_OUT('payout'),
  INTERAC_CASH_OUT('interac_cash_out'),
  INTERAC_CASH_IN('interac_cash_in');

  const TransactionType(this.value);
  final String value;

  factory TransactionType.fromValue(String value) {
    return values.firstWhere((e) => e.value == value);
  }
}

extension TransactionTypeExtension on TransactionType {
  String get descriptionKey {
    switch (this) {
      case TransactionType.BUY:
        return 'buy';
      case TransactionType.SEND:
        return 'send';
      case TransactionType.RECEIVED:
        return 'received';
      case TransactionType.PAY_OUT:
        return 'payout';
      case TransactionType.INTERAC_CASH_OUT:
        return 'interac_cash_out';
      case TransactionType.INTERAC_CASH_IN:
        return 'interac_cash_in';
      default:
        return "";
    }
  }
}