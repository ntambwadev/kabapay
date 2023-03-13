import '/components/transactions/payment_instructions/payment_instructions_widget.dart';
import '/components/transactions/transaction_summary/transaction_summary_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_model.dart';

class TransactionDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for payment_instructions component.
  late PaymentInstructionsModel paymentInstructionsModel;
  // Model for transaction_summary component.
  late TransactionSummaryModel transactionSummaryModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    paymentInstructionsModel =
        createModel(context, () => PaymentInstructionsModel());
    transactionSummaryModel =
        createModel(context, () => TransactionSummaryModel());
  }

  void dispose() {
    paymentInstructionsModel.dispose();
    transactionSummaryModel.dispose();
  }

  /// Additional helper methods are added here.

}
