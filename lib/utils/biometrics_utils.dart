import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';

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
}