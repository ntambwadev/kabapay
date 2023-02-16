import 'package:kabapay/models/transaction_model.dart';
import 'package:provider/provider.dart';

import '../components/tokens_list_placeholder_widget.dart';
import '../components/transaction_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transactions_list_model.dart';
export 'transactions_list_model.dart';
import '../flutter_flow/flutter_flow_model.dart';

class TransactionsListWidget extends StatefulWidget {
  const TransactionsListWidget({Key? key}) : super(key: key);

  @override
  _TransactionsListWidgetState createState() => _TransactionsListWidgetState();
}

class _TransactionsListWidgetState extends State<TransactionsListWidget> {
  late TransactionsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionsListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).lineColor,
      ),
      child: Builder(
        builder: (context) {
          List<TransactionModel> transactions = Provider.of<List<TransactionModel>>(context);
          if (transactions.isEmpty) {
            return Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: TokensListPlaceholderWidget(),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              //TODO refresh transactions list
            },
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: transactions.length,
              itemBuilder: (context, itemIndex) {
                final transactionItem = transactions[itemIndex];
                return TransactionItemWidget(
                  key: UniqueKey(),
                  transaction: transactionItem,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
