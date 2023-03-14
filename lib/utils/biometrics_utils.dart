import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:uqudosdk_flutter/UqudoIdPlugin.dart';
import 'package:uqudosdk_flutter/uqudosdk_flutter.dart';

import '../flutter_flow/internationalization.dart';

class BiometricsUtils {
  static bool isFirstLaunchDone = false;
  static Future<bool> validateBiometric(BuildContext context) async {
    final _localAuth = LocalAuthentication();
    bool _isBiometricSupported = await _localAuth.isDeviceSupported();
    if (_isBiometricSupported) {
      var isAuthenticated = await _localAuth.authenticate(
          localizedReason:
          FFLocalizations.of(context).getText('51ozp1v6',),);
      if (isAuthenticated) {
        return true;
      }
      return false;
    }
    return true;
  }

  static Future<bool> isBiometricKYCAvailable() async {
    var isReadingSupported = await UqudoIdPlugin.isReadingSupported(DocumentType.COD_VOTER_ID);
    debugPrint("isReadingSupported: $isReadingSupported");
    var isFacialRecognitionSupported = await UqudoIdPlugin.isFacialRecognitionSupported(DocumentType.COD_VOTER_ID);
    debugPrint("isFacialRecognitionSupported: $isFacialRecognitionSupported");
    return isReadingSupported && isFacialRecognitionSupported;
  }

  static Future<String> startPassportKYCProcess() async {
    // [DocumentType.PASSPORT, DocumentType.COD_VOTER_ID, DocumentType.COD_DL];
    String result;
    try {
      var token = "your token";
      var doc = new DocumentBuilder()
          .setDocumentType(DocumentType.PASSPORT)
          .enableReading()
          .build();
      var enrollObject = new EnrollmentBuilder()
          .setToken(token)
          .add(doc)
          .setAppearanceMode(AppearanceMode.SYSTEM)
          .build();
      result = await UqudoIdPlugin.enroll(enrollObject);
      debugPrint("startPassportKYCProcess result: $result");
      return result;
    } on PlatformException catch (exception) {
      result = exception.code;
      // {"code":"USER_CANCEL","message":"User canceled the Enrollment process","task":"SCAN"}
      debugPrint("startFaceSessionKYCProcess error code: $result");
      return result;
    }
  }

  static Future<String> startDriverLicenseKYCProcess() async {
    // [DocumentType.PASSPORT, DocumentType.COD_VOTER_ID, DocumentType.COD_DL];
    String result;
    try {
      var token = "your token";
      var doc = new DocumentBuilder()
          .setDocumentType(DocumentType.COD_DL)
          .enableReading()
          .build();
      var enrollObject = new EnrollmentBuilder()
          .setToken(token)
          .add(doc)
          .setAppearanceMode(AppearanceMode.SYSTEM)
          .build();
      result = await UqudoIdPlugin.enroll(enrollObject);
      debugPrint("startPassportKYCProcess result: $result");
      return result;
    } on PlatformException catch (exception) {
      result = exception.code;
      // {"code":"USER_CANCEL","message":"User canceled the Enrollment process","task":"SCAN"}
      debugPrint("startFaceSessionKYCProcess error code: $result");
      return result;
    }
  }

  static Future<String> startVoterIdKYCProcess() async {
    // [DocumentType.PASSPORT, DocumentType.COD_VOTER_ID, DocumentType.COD_DL];
    String result;
    try {
      var token = "your token";
      var doc = new DocumentBuilder()
          .setDocumentType(DocumentType.COD_VOTER_ID)
          .enableReading()
          .build();
      var enrollObject = new EnrollmentBuilder()
          .setToken(token)
          .add(doc)
          .setAppearanceMode(AppearanceMode.SYSTEM)
          .build();
      result = await UqudoIdPlugin.enroll(enrollObject);
      debugPrint("startPassportKYCProcess result: $result");
      return result;
    } on PlatformException catch (exception) {
      result = exception.code;
      // {"code":"USER_CANCEL","message":"User canceled the Enrollment process","task":"SCAN"}
      debugPrint("startFaceSessionKYCProcess error code: $result");
      return result;
    }
  }

  static Future<String> startFaceSessionKYCProcess() async {
    String result;
    var token = "<please put your token here>";
    try {
      var faceSessionConfiguration = new FaceSessionConfigurationBuilder()
          .setToken(token)
          .setSessionId("<your session identifier>")
          .setAppearanceMode(AppearanceMode.SYSTEM)
          .build();
      result = await UqudoIdPlugin.faceSession(faceSessionConfiguration);
      debugPrint("startFaceSessionKYCProcess result: $result");
      return result;
    } catch (error) {
      debugPrint("startFaceSessionKYCProcess error: $error");
      result = error.toString();
      return result;
    }
  }
}