import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kabapay/models/payment_instrument_model.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'package:kabapay/models/user_model.dart';

import 'token_model.dart';

class CurrentTransactionModel extends ChangeNotifier {
  String? _userId;
  String? _amountUSD;
  String? _amountToken;
  TransactionType? _type;
  TokenModel? _token;
  String? _userAddress;
  String? _recipientAddress;
  PaymentInstrumentModel? _paymentInstrument;

  String? get userId => _userId;
  String? get amountUSD => _amountUSD;
  String? get amountToken => _amountToken;
  TransactionType? get type => _type;
  TokenModel? get token => _token;
  String? get userAddress => _userAddress;
  String? get recipientAddress => _recipientAddress;
  PaymentInstrumentModel? get paymentInstrument => _paymentInstrument;

  void addUserId(String userId) {
    _userId = userId;
  }

  void selectTxType(TransactionType type) {
    _type = type;
    notifyListeners();
  }

  void selectToken(TokenModel token, UserModel? userModel) {
    _token = token;
    if (userModel != null) {
      _userAddress = userModel.address;
      _userId = userModel.uid;
    }
    notifyListeners();
  }

  void addAmount(String amountUSD, String tokenAmount) {
    _amountUSD = amountUSD;
    String currentPrice = '${token?.tokenMetadata.currentPrice ?? 0}';
    _amountToken = tokenAmount;
        // (double.parse(currentPrice) * double.parse(amountUSD)).toString();
    notifyListeners();
  }

  void addPaymentInstrument(PaymentInstrumentModel paymentInstrumentModel) {
    _paymentInstrument = paymentInstrumentModel;
    notifyListeners();
  }

  void addRecipientAddress(String? recipientAddress) {
    _recipientAddress = recipientAddress ?? "";
    notifyListeners();
  }
}