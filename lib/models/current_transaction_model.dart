import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kabapay/models/payment_instrument_model.dart';
import 'package:kabapay/models/recipient_model.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'package:kabapay/models/user_model.dart';
import 'package:kabapay/models/vault_data_model.dart';

import 'BaseTransactionModel.dart';
import 'EventData.dart';
import 'token_model.dart';

class CurrentTransactionModel extends BaseTransactionModel  {
  CurrentTransactionModel({String? id, String? userId, String? amountUSD, String? amountToken,
    TransactionType? type, TokenModel? token, String? userAddress, String? recipientAddress,
    PaymentInstrumentModel? paymentInstrument, List<EventData>? events, RecipientModel? recipient,})
      : super(id: id, userId: userId, amountUSD: amountUSD, amountToken: amountToken,
      type: type, token: token, userAddress: userAddress, recipientAddress: recipientAddress,
      paymentInstrument: paymentInstrument, events: events, recipient: recipient);

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
    super.amountToken = tokenAmount;
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

  void addRecipientInfo(String? recipientAddress, String? recipientName, String? recipientPhone) {
    super.recipient = RecipientModel(
      walletAddress: recipientAddress ?? "",
      fullName: recipientName ?? "",
      phoneNumber: recipientPhone ?? "",
    );
    notifyListeners();
  }

  void addRecipient(RecipientModel? recipientModel) {
    super.recipient = recipientModel;
    notifyListeners();
  }

}