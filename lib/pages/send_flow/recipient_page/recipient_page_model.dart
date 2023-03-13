import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_model.dart';

class RecipientPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? walletAdressController;
  String? Function(BuildContext, String?)? walletAdressValidator;
  // State field(s) for TextField widget.
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameValidator;
  // State field(s) for TextField widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    walletAdressController?.dispose();
    fullNameController?.dispose();
    phoneNumberController?.dispose();
  }

  /// Additional helper methods are added here.

}
