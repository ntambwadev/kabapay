import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kabapay/models/transaction_model.dart';
import 'dart:async';

import 'package:kabapay/models/user_model.dart';
import '../auth/auth_util.dart';

class FirestoreService {
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

  /// Query a subcollection
  Stream<List<TransactionModel>> streamTransactions() {
    try {
      var ref = _firestoreDb
          .collection('transactions')
          .where('userId', isEqualTo: currentUserUid);
      return ref.snapshots().map((list) =>
          list.docs.map((doc) => TransactionModel.fromFirestore(doc)).toList());
    } catch (error) {
      print("UNE ERREUR");
      print(error);
      return Stream.empty();
    }
  }

  /// Write data
  Future<void> createTransaction() {
    return _firestoreDb
        .collection('transactions')
        .doc(currentUserUid).set({ /* some data */ });
  }

}