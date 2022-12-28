import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDZGgQE9cpP83RaYey7geEBp-DF_37xttM",
            authDomain: "kabapaycd.firebaseapp.com",
            projectId: "kabapaycd",
            storageBucket: "kabapaycd.appspot.com",
            messagingSenderId: "519309012038",
            appId: "1:519309012038:web:2f572b913b583f215d2e47",
            measurementId: "G-S6D8F1SY2M"));
  } else {
    await Firebase.initializeApp();
  }
}
