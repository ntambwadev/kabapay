import '/auth/auth_util.dart';
import '/components/nav_back_button/nav_back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SmsVerificationPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for nav_back_button component.
  late NavBackButtonModel navBackButtonModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBackButtonModel = createModel(context, () => NavBackButtonModel());
    pinCodeController = TextEditingController();
  }

  void dispose() {
    navBackButtonModel.dispose();
    pinCodeController?.dispose();
  }

  /// Additional helper methods are added here.

}
