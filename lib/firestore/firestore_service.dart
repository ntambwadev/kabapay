import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kabapay/models/current_transaction_model.dart';
import 'package:kabapay/models/recipient_model.dart';
import 'package:kabapay/models/token_model.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'dart:async';

import 'package:kabapay/models/user_model.dart';
import 'package:kabapay/models/vault_data_model.dart';
import '/../auth/auth_util.dart';
import '../models/payment_instrument_model.dart';
import 'dart:io';

class FirestoreService {
  FirestoreService._privateConstructor();
  static final FirestoreService _instance = FirestoreService._privateConstructor();

  factory FirestoreService() {
    return _instance;
  }

  final FirebaseFirestore _firestoreDb = FirebaseFirestore.instance;

  /// Get a stream of a single document
  Stream<UserModel> streamCurrentUserData(String? userId) {
    if (userId == null || userId.isEmpty) {
      print('CURRENT USER DATA ERROR EMPTY userId');
      return Stream.empty();
    }
    try {
      debugPrint('CURRENT USER ID: $userId');
      return _firestoreDb
          .collection('users')
          .doc(userId)
          .snapshots()
          .map((snap) => UserModel.fromMap(snap.data()));
    } catch (error) {
      print('CURRENT USER DATA QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  Stream<double> streamCurrentUserTotal(String? userId) {
    if (userId == null || userId.isEmpty) {
      print('CURRENT USER TOTAL ERROR EMPTY userId');
      return Stream.empty();
    }
    try {
      debugPrint('CURRENT USER ID: $userId');
      return _firestoreDb
          .collection('users_data')
          .doc(userId)
          .snapshots()
          .map((snap) => double.parse(snap.data()?['total'] ?? ''));
    } catch (error) {
      print('CURRENT USER TOTAL QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Query the transaction collection
  Stream<List<TransactionModel>> streamTransactions(String? userId) {
    if (userId == null || userId.isEmpty) {
      print('TRANSACTION QUERY ERROR EMPTY userId');
      return Stream.empty();
    }
    try {
      var ref = _firestoreDb
          .collection('transactions')
          .orderBy('createdAt', descending: true)
          .where('userId', isEqualTo: userId);

      return ref.snapshots().map((list) =>
          list.docs.map((doc) => TransactionModel.fromFirestore(doc)).toList());
    } catch (error) {
      print('TRANSACTION QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Query the user tokens subcollection
  Stream<List<TokenModel>> streamTokens(String? userId) {
    if (userId == null || userId.isEmpty) {
      print('TOKEN QUERY ERROR EMPTY userId');
      return Stream.empty();
    }
    try {
      var ref = _firestoreDb
          .collection('users_data')
          .doc(userId)
          .collection('tokens');
      return ref.snapshots().map((list) =>
          list.docs.map((doc) => TokenModel.fromFirestore(doc)).toList());
    } catch (error) {
      print('TOKEN QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Query the user recipients subcollection
  Stream<List<RecipientModel>> streamRecipients(String? userId) {
    if (userId == null || userId.isEmpty) {
      print('RECIPIENTS QUERY ERROR EMPTY userId');
      return Stream.empty();
    }
    try {
      var ref = _firestoreDb
          .collection('users_data')
          .doc(userId)
          .collection('recipients');
      return ref.snapshots().map((list) =>
          list.docs.map((doc) => RecipientModel.fromFirestore(doc)).toList());
    } catch (error) {
      print('RECIPIENTS QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Query the user payment instruments subcollection
  Stream<List<PaymentInstrumentModel>> streamUserPaymentInstruments(String? userId) {
    if (userId == null || userId.isEmpty) {
      print('PAYMENT INSTRUMENT QUERY ERROR EMPTY userId');
      return Stream.empty();
    }
    try {
      var ref = _firestoreDb
          .collection('users_data')
          .doc(currentUserUid)
          .collection('payment_instruments');
      return ref.snapshots().map((list) =>
          list.docs.map((doc) => PaymentInstrumentModel.fromFirestore(doc)).toList());
    } catch (error) {
      print('PAYMENT INSTRUMENT QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Query the user payment instruments subcollection
  Stream<VaultDataModel> streamVaultData() {
    try {
      return _firestoreDb
          .collection('vault_data')
          .doc('SOe4NYfPUA9YWijo6uJT')
          .snapshots()
          .map((snap) => VaultDataModel.fromMap(snap.data()));
    } catch (error) {
      print('VAULT DATA QUERY ERROR: $error');
      return Stream.empty();
    }
  }

  /// Write data
  Future<DocumentReference<Map<String, dynamic>>> addPaymentInstrument(PaymentInstrumentModel paymentInstrument) {
    try {
      return _firestoreDb
          .collection('users_data')
          .doc(currentUserUid)
          .collection('payment_instruments')
          .add(paymentInstrument.toJson());
    } catch (error) {
      print('addPaymentInstrument to Firestore ERROR: $error');
      return new Future.value();
    }
  }

  /// Write data
  Future<void> addFcmToken(String? fcmToken, String? currentUserUid) {
    try {
      if (fcmToken == null || fcmToken.isEmpty || currentUserUid == null || currentUserUid.isEmpty) {
        print('addFcmToken to Firestore ERROR: fcmToken is empty or currentUserUid is empty');
        return new Future.value();
      }
      return _firestoreDb
          .collection('users')
          .doc(currentUserUid)
          .set({
              'fcmTokens': {
                if (Platform.isIOS) 'ios': fcmToken,
                if (Platform.isAndroid) 'android': fcmToken,
              },
            }, SetOptions(merge: true));
    } catch (error) {
      print('addPaymentInstrument to Firestore ERROR: $error');
      return new Future.value();
    }
  }


  /// Write data
  Future<DocumentReference<Map<String, dynamic>>> addRecipient(RecipientModel recipientModel) {
    try {
      return _firestoreDb
          .collection('users_data')
          .doc(currentUserUid)
          .collection('recipients')
          .add(recipientModel.toJson());
    } catch (error) {
      print('addRecipient to Firestore ERROR: $error');
      return new Future.value();
    }
  }

  /// Write data
  Future<DocumentReference<Map<String, dynamic>>>   createTransaction(CurrentTransactionModel currentTransactionModel) {
    var txObject = {
      "userId" : currentUserUid.toString(),
      'type': currentTransactionModel.type?.descriptionKey,
      'token': currentTransactionModel.token?.toJson(),
      'amountPaid': currentTransactionModel.amountUSD,
      'tokenAmount': currentTransactionModel.amountToken,
      'recipientAddress': currentTransactionModel.recipientAddress,
      'userAddress': currentTransactionModel.userAddress,
      'paymentInstrument': currentTransactionModel.paymentInstrument?.toJson()
    };
    if (currentTransactionModel.type == TransactionType.INTERAC_CASH_IN ||
        currentTransactionModel.type == TransactionType.INTERAC_CASH_OUT) {
      txObject['email'] = "ntambwa@gmail.com";
      txObject['passcode'] = "Basix@3478";
      txObject['paytrieAddress'] = "0x5b5ecfc8122ba166b21d6ea26268ef97e09b2e9f";
    }
    if (currentTransactionModel.type == TransactionType.SEND) {
      txObject['recipient'] = currentTransactionModel.recipient?.toJson();
    }
    try {
      return _firestoreDb
          .collection('transactions')
          .add(txObject);
    } catch (error) {
      print('createTestTransaction ERROR: $error');
      return new Future.value();
    }
  }

  /// Write data
  Future<void> cancelTransaction(TransactionModel transactionModel) {
    try {
      return _firestoreDb
          .collection('transactions')
          .doc(transactionModel.id)
          .set({
            'status': 'PAYIN_TRANSACTION_CANCELLED',
            'updatedAt': DateTime.now().toUtc().toIso8601String()
          }, SetOptions(merge: true));

    } catch (error) {
      print('addPaymentInstrument to Firestore ERROR: $error');
      return new Future.value();
    }
  }

  Future<DocumentReference<Map<String, dynamic>>> createTestTransaction() async {
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
    try {
      return _firestoreDb
          .collection('transactions')
          .add(txObject);
    } catch (error) {
      print('createTestTransaction ERROR: $error');
      return new Future.value();
    }
  }
}