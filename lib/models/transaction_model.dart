import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kabapay/models/BaseTransactionModel.dart';
import 'package:kabapay/models/payment_instrument_model.dart';
import 'package:kabapay/models/recipient_model.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'EventData.dart';
import 'token_model.dart';

class TransactionModel extends BaseTransactionModel {
  final String? createdAt;
  final TransactionStatus? status;

  TransactionModel({String? id, String? userId, String? amountUSD, String? amountToken,
    TransactionType? type, TokenModel? token, String? userAddress, String? recipientAddress,
    PaymentInstrumentModel? paymentInstrument, RecipientModel? recipient, List<EventData>? events, this.createdAt, this.status,})
      : super(id: id, userId: userId, amountUSD: amountUSD, amountToken: amountToken,
      type: type, token: token, userAddress: userAddress, recipientAddress: recipientAddress,
      paymentInstrument: paymentInstrument, events: events, recipient: recipient);

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    debugPrint('data: ${data}');
    List<EventData> events = List.empty(growable: true);
    if (data["events"] != null) {
      data["events"].entries.forEach(
            (entry) => events.add(EventData.fromMap(entry.value)));
    }
    return TransactionModel(
      id: data['id'] as String?,
      userId: data['userId'] as String?,
      amountUSD: data['amountPaid'] as String?,
      amountToken: data['tokenAmount'] as String?,
      type: TransactionType.fromValue(data['type'] ?? 'buy'),
      token: TokenModel.fromMap(data['token']),
      userAddress: data['userAddress'] as String?,
      recipientAddress: data['recipientAddress'] as String?,
      paymentInstrument: data['paymentInstrument'] != null
          ? PaymentInstrumentModel.fromMap(data['paymentInstrument'] as Map<String, dynamic>) : null,
      createdAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(data['createdAt'])),
      status: TransactionStatus.fromValue(data['status'] ?? ''),
      recipient: RecipientModel.fromMap(data['recipient'] as Map<String, dynamic>?),
      events: events,
    );
  }
}

enum TransactionStatus {
  PAYIN_WAITING_FOR_USER_PAYMENT('PAYIN_WAITING_FOR_USER_PAYMENT'),
  PAYIN_RECEIVED_USER_PAYMENT('PAYIN_RECEIVED_USER_PAYMENT'),
  PAYIN_CRYPTO_TRANSFER_PROCESSING('PAYIN_CRYPTO_TRANSFER_PROCESSING'),
  PAYIN_CRYPTO_TRANSFER_COMPLETED('PAYIN_CRYPTO_TRANSFER_COMPLETED'),
  PAYIN_CRYPTO_TRANSFER_FAILED('PAYIN_CRYPTO_TRANSFER_FAILED'),

  PAYOUT_CRYPTO_TRANSFER_CREATED('PAYOUT_CRYPTO_TRANSFER_CREATED'),
  PAYOUT_CRYPTO_TRANSFER_PROCESSING('PAYOUT_CRYPTO_TRANSFER_PROCESSING'),
  PAYOUT_CRYPTO_TRANSFER_SUCCEEDED('PAYOUT_CRYPTO_TRANSFER_SUCCEEDED'),
  PAYOUT_CRYPTO_TRANSFER_FAILED('PAYOUT_CRYPTO_TRANSFER_FAILED'),

  PAYOUT_MOMO_TRANSFER_PROCESSING('PAYOUT_MOMO_TRANSFER_PROCESSING'),
  PAYOUT_MOMO_TRANSFER_SUCCEEDED('PAYOUT_MOMO_TRANSFER_SUCCEEDED'),
  PAYOUT_MOMO_TRANSFER_FAILED('PAYOUT_MOMO_TRANSFER_FAILED'),

  PAYOUT_INTERAC_PAYTRIE_TRANSFER_CREATED('PAYOUT_INTERAC_PAYTRIE_TRANSFER_CREATED'),
  PAYOUT_INTERAC_TRANSFER_PROCESSING('PAYOUT_INTERAC_TRANSFER_PROCESSING'),
  PAYOUT_INTERAC_TRANSFER_SUCCEEDED('PAYOUT_INTERAC_TRANSFER_SUCCEEDED'),
  PAYOUT_INTERAC_TRANSFER_FAILED('PAYOUT_INTERAC_TRANSFER_FAILED');

  const TransactionStatus(this.value);
  final String value;

  factory TransactionStatus.fromValue(String value) {
    return values.firstWhere((e) => e.value == value);
  }
}

extension TransactionStatusExtension on TransactionStatus {
  String get descriptionKey {
    switch (this) {
      case TransactionStatus.PAYIN_WAITING_FOR_USER_PAYMENT:
        return 'status_pending_payment';
      case TransactionStatus.PAYIN_RECEIVED_USER_PAYMENT:
        return 'status_payment_received';
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_SUCCEEDED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_PROCESSING:
        return 'status_processing';
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_COMPLETED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_SUCCEEDED:
      case TransactionStatus.PAYOUT_INTERAC_TRANSFER_SUCCEEDED:
        return 'status_completed';
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_INTERAC_TRANSFER_FAILED:
        return 'status_failed';
      default:
        return "";
    }
  }

  int get index {
    switch (this) {
      case TransactionStatus.PAYIN_WAITING_FOR_USER_PAYMENT:
        return 0;
      case TransactionStatus.PAYIN_RECEIVED_USER_PAYMENT:
        return 1;
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_SUCCEEDED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_PROCESSING:
        return 2;
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_COMPLETED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_SUCCEEDED:
      case TransactionStatus.PAYOUT_INTERAC_TRANSFER_SUCCEEDED:
        return 3;
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_INTERAC_TRANSFER_FAILED:
        return 4;
      default:
        return -1;
    }
  }

  Color get color {
    switch (this) {
      case TransactionStatus.PAYIN_WAITING_FOR_USER_PAYMENT:
      case TransactionStatus.PAYIN_RECEIVED_USER_PAYMENT:
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_PROCESSING:
      case TransactionStatus.PAYOUT_CRYPTO_TRANSFER_SUCCEEDED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_PROCESSING:
        return Colors.deepOrangeAccent;
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_COMPLETED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_SUCCEEDED:
      case TransactionStatus.PAYOUT_INTERAC_TRANSFER_SUCCEEDED:
        return Colors.green;
      case TransactionStatus.PAYIN_CRYPTO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_MOMO_TRANSFER_FAILED:
      case TransactionStatus.PAYOUT_INTERAC_TRANSFER_FAILED:
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