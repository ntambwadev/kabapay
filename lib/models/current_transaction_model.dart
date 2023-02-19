import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kabapay/models/payment_instrument_model.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'package:kabapay/models/user_model.dart';

import 'BaseTransactionModel.dart';
import 'token_model.dart';

class CurrentTransactionModel extends BaseTransactionModel  {
  CurrentTransactionModel({String? id, String? userId, String? amountUSD, String? amountToken,
    TransactionType? type, TokenModel? token, String? userAddress, String? recipientAddress,
    PaymentInstrumentModel? paymentInstrument,})
      : super(id: id, userId: userId, amountUSD: amountUSD, amountToken: amountToken,
      type: type, token: token, userAddress: userAddress, recipientAddress: recipientAddress,
      paymentInstrument: paymentInstrument,);

  void addUserId(String userId) {
    super.userId = userId;
  }

  void selectTxType(TransactionType type) {
    super. type = type;
    notifyListeners();
  }

  void selectToken(TokenModel token, UserModel? userModel) {
    super.token = token;
    if (userModel != null) {
      super.userAddress = userModel.address;
      super.userId = userModel.uid;
    }
    notifyListeners();
  }

  void addAmount(String amountUSD, String tokenAmount) {
    super.amountUSD = amountUSD;
    String currentPrice = '${token?.tokenMetadata.currentPrice ?? 0}';
    super.amountToken = tokenAmount;
        // (double.parse(currentPrice) * double.parse(amountUSD)).toString();
    notifyListeners();
  }

  void addPaymentInstrument(PaymentInstrumentModel paymentInstrumentModel) {
    super.paymentInstrument = paymentInstrumentModel;
    notifyListeners();
  }

  void addRecipientAddress(String? recipientAddress) {
    super.recipientAddress = recipientAddress ?? "";
    notifyListeners();
  }
}