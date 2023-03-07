//create a singleton class name FirebaseApi to handle all the firebase operations
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class FirebaseApi {
  static Future<http.Response> updateUserTokenBalances(UserModel? user) {
    try {
      if (user == null) {
        return Future.error('User is null');
      }
      debugPrint('updateUserTokenBalances CURRENT USER ID: ${user.uid}');
      return http.post(
        Uri.parse('https://apikaba-updateusertokenbalances-hsvesecgcq-uc.a.run.app'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userAddress': user.address,
          'userId': user.uid
        }),
      );
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
