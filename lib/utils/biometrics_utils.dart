import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';

import '../flutter_flow/internationalization.dart';

class BiometricsUtils {
  static Future<bool> validateBiometric(BuildContext context) async {
    final _localAuth = LocalAuthentication();
    bool _isBiometricSupported = await _localAuth.isDeviceSupported();
    if (_isBiometricSupported) {
      var isAuthorized = await _localAuth.authenticate(
          localizedReason: 'Please authenticate to continue',);
      if (isAuthorized) {
        return true;
      }
      return false;
    }
    return false;
  }
}