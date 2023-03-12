import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../auth/auth_util.dart';

class RecipientModel with ChangeNotifier {
  final String? uid;
  final String fullName;
  final String phoneNumber;
  final String walletAddress;
  final String? username;
  RecipientModel({this.uid, required this.fullName, required this.phoneNumber, required this.walletAddress, this.username});

  factory RecipientModel.fromMap(Map? data) {
    data = data ?? { };
    return RecipientModel(
      uid: data['uid'] as String?,
      fullName: data['fullName'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      walletAddress: data['walletAddress'] ?? '',
      username: data['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'fullName': fullName,
    'phoneNumber': phoneNumber,
    'walletAddress': walletAddress,
    'username': username,
  };
}