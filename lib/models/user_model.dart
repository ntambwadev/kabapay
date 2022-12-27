import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../auth/auth_util.dart';

class UserModel with ChangeNotifier {
  final String uid;
  final String address;
  final String phoneNumber;
  final String email;
  final String fcmToken;
  UserModel({required this.uid, required this.address, required this.phoneNumber, required this.email, required this.fcmToken});

  factory UserModel.fromMap(Map? data) {
    data = data ?? { };
    return UserModel(
      uid: data['uid'] ?? '',
      address: data['address'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      fcmToken: data['fcmToken'] ?? '',
    );
  }
}