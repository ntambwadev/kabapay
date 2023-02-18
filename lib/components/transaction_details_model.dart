import '../components/transaction_summary_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

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
