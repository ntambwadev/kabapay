import 'package:flutter/cupertino.dart';
import 'package:kabapay/models/payment_instrument_model.dart';
import 'package:kabapay/models/recipient_model.dart';
import 'package:kabapay/models/token_model.dart';
import 'package:kabapay/models/transaction_model.dart';

import 'EventData.dart';

class BaseTransactionModel extends ChangeNotifier {
  String? id;
  String? userId;
  String? amountUSD;
  String? amountToken;
  TransactionType? type;
  TokenModel? token;
  String? userAddress;
  String? recipientAddress;
  RecipientModel? recipient;
  PaymentInstrumentModel? paymentInstrument;
  List<EventData>? events;

  BaseTransactionModel({required this.id, required this.userId, required this.amountUSD,
    required this.amountToken, required this.type, required this.token,
    required this.userAddress, required this.recipientAddress,
    required this.paymentInstrument, required this.events, this.recipient});
}