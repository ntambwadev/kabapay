import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/transactions/transaction_summary/transaction_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmationPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for transaction_summary component.
  late TransactionSummaryModel transactionSummaryModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    transactionSummaryModel =
        createModel(context, () => TransactionSummaryModel());
  }

  void dispose() {
    transactionSummaryModel.dispose();
  }

  /// Additional helper methods are added here.

}
