import '/components/transactions/transaction_summary/transaction_summary_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_model.dart';
import '/flutter_flow/flutter_flow_model.dart';

class ConfirmationPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for transaction_summary component.
  late TransactionSummaryModel transactionSummaryModel;
  bool isAuthenticated = false;

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
