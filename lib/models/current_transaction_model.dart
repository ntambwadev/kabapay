import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kabapay/models/phone_model.dart';
import 'package:kabapay/models/user_model.dart';

import 'token_model.dart';

class CurrentTransactionModel extends ChangeNotifier {
  String? _userId;
  String? _amountUSD;
  String? _amountToken;
  String? _type;
  TokenModel? _token;
  String? _userAddress;
  String? _recipientAddress;
  PhoneModel? _phone;

  String? get userId => _userId;
  String? get amountUSD => _amountUSD;
  String? get amountToken => _amountToken;
  String? get type => _type;
  TokenModel? get token => _token;
  String? get userAddress => _userAddress;
  String? get recipientAddress => _recipientAddress;
  PhoneModel? get phone => _phone;

  void addUserId(String userId) {
    _userId = userId;
  }

  void selectTxType(String type) {
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

  void addPhone(PhoneModel phoneModel) {
    _phone = phoneModel;
    notifyListeners();
  }

  void addRecipientAddress(String recipientAddress) {
    _recipientAddress = recipientAddress;
    notifyListeners();
  }
}