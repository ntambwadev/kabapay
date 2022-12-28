import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kabapay/models/current_transaction_model.dart';
import 'package:kabapay/models/token_model.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'dart:async';

import 'package:kabapay/models/user_model.dart';
import '../auth/auth_util.dart';
import '../models/payment_instrument_model.dart';
import '../models/phone_model.dart';

class FirestoreService {
  FirestoreService._privateConstructor();
  static final FirestoreService _instance = FirestoreService._privateConstructor();

  factory FirestoreService() {
    return _instance;
  }

  final FirebaseFirestore _firestoreDb = FirebaseFirestore.instance;

  /// Get a stream of a single document
  Stream<UserModel> streamCurrentUserData(String id) {
    debugPrint('CURRENT USER ID: $id');
    return _firestoreDb
        .collection('users')
        .doc(id)
        .snapshots()
        .map((snap) => UserModel.fromMap(snap.data()));
  }

  /// Query the transaction collection
  Stream<List<TransactionModel>> streamTransactions() {
    try {
      var ref = _firestoreDb
          .collection('transactions')
          .orderBy('createdAt', descending: true)
          .where('userId', isEqualTo: currentUserUid);

      return ref.snapshots().map((list) =>
          list.docs.map((doc) => TransactionModel.fromFirestore(doc)).toList());
    } catch (error) {
      print('TRANSACTION QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Query the user tokens subcollection
  Stream<List<TokenModel>> streamTokens() {
    try {
      var ref = _firestoreDb
          .collection('users_data')
          .doc(currentUserUid)
          .collection('tokens');
      return ref.snapshots().map((list) =>
          list.docs.map((doc) => TokenModel.fromFirestore(doc)).toList());
    } catch (error) {
      print('TOKEN QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Query the user payment instruments subcollection
  Stream<List<PaymentInstrumentModel>> streamPaymentInstruments() {
    try {
      var ref = _firestoreDb
          .collection('users_data')
          .doc(currentUserUid)
          .collection('payment_instruments');
      return ref.snapshots().map((list) =>
          list.docs.map((doc) => PaymentInstrumentModel.fromFirestore(doc)).toList());
    } catch (error) {
      print('TOKEN QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Write data
  Future<void> createTransaction(CurrentTransactionModel currentTransactionModel) {
    var txObject = {
      "userId" : currentUserUid.toString(),
      'type': currentTransactionModel.type,
      'token': currentTransactionModel.token?.toJson(),
      'amountPaid': currentTransactionModel.amountUSD,
      'tokenAmount': currentTransactionModel.amountToken,
      'recipientAddress': currentTransactionModel.recipientAddress,
    };
    return _firestoreDb
        .collection('transactions')
        .doc(currentUserUid).set(txObject);
  }

  Future<void> createTestTransaction() {
    var txObject = {
      "userId" : currentUserUid.toString(),
      'type': 'buy',
      "amountPaid": "1",
      "tokenAmount": "1",
      "token": {
        "id": "binance-usd",
        "symbol": "busd",
        "amountToken": "1",
        "amountUSD": "1",
        "tokenMetadata": {
          "id": "binance-usd",
          "name": "busd",
          "chain": "BEP20",
          "currentPrice": 1.00,
          "symbol": "busd",
          "image": "image",
          "priceChangePercent24h": 0.0872,
        },
      },
      "userAddress": "0xEfE27e06aCc099e55c239ad2e9574E66D75372b5",
      "recipientAddress": "0xEfE27e06aCc099e55c239ad2e9574E66D75372b5",
      "phone": {
        "number": "+243992457388",
        "telecom": "Airtel",
        "mobileMoney": "Airtel mMoney"
      }
    };
    return _firestoreDb
        .collection('transactions')
        .doc(currentUserUid).set(txObject);
  }
}