import '../components/tokens_list_placeholder_widget.dart';
import '../components/transaction_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsListWidget extends StatefulWidget {
  const TransactionsListWidget({Key? key}) : super(key: key);

  @override
  _TransactionsListWidgetState createState() => _TransactionsListWidgetState();
}

class _TransactionsListWidgetState extends State<TransactionsListWidget> {
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
          final items = List.generate(random_data.randomInteger(5, 5),
                  (index) => random_data.randomName(true, false))
              .toList()
              .take(5)
              .toList();
          if (items.isEmpty) {
            return Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: TokensListPlaceholderWidget(),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, itemsIndex) {
              final itemsItem = items[itemsIndex];
              return TransactionItemWidget(
                key: UniqueKey(),
              );
            },
          );
        },
      ),
    );
  }
}
