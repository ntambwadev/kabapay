import '/components/tokens/tokens_list/tokens_list_widget.dart';
import '/components/transactions/transactions_list/transactions_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_model.dart';

class HomePageTabModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for tokens_list component.
  late TokensListModel tokensListModel;
  // Model for transactions_list component.
  late TransactionsListModel transactionsListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    tokensListModel = createModel(context, () => TokensListModel());
    transactionsListModel = createModel(context, () => TransactionsListModel());
  }

  void dispose() {
    tokensListModel.dispose();
    transactionsListModel.dispose();
  }

  /// Additional helper methods are added here.

}
