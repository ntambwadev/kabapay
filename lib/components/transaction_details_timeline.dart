import 'package:kabapay/models/transaction_model.dart';
import 'package:provider/provider.dart';

import '../components/tokens_list_placeholder_widget.dart';
import '../components/transaction_item_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';

class TransactionDetailsTimeline extends StatelessWidget {
  const TransactionDetailsTimeline({required this.transactionModel}) : super();
  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          nodeItemOverlap: true,
          connectorTheme: ConnectorThemeData(
            color: Colors.deepPurple,
            thickness: 15.0,
          ),
        ),
        padding: EdgeInsets.only(top: 20.0),
        builder: TimelineTileBuilder.connected(
          indicatorBuilder: (context, index) {
            return OutlinedDotIndicator(
              color: Colors.blue,
              backgroundColor: Colors.green,
              borderWidth: 3.0,
            );
          },
          connectorBuilder: (context, index, connectorType) {
            return SolidLineConnector(
              color: Colors.red,
            );
          },
          contentsBuilder: (context, index) {
            return SizedBox(
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(0.0),
                    child: Text('contents'),
                  ),
                ),
              ),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
