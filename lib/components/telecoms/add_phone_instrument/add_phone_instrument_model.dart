import '/components/telecoms/telecom_selector/telecom_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_model.dart';

class AddPhoneInstrumentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  // Model for top_separator component.
  late TelecomSelectorModel telecomSelectorModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    telecomSelectorModel = createModel(context, () => TelecomSelectorModel());
  }

  void dispose() {
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}
