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

class TimelineTest extends StatelessWidget {
  const TimelineTest({required this.transactionModel}) : super();
  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          nodeItemOverlap: true,
          connectorTheme: ConnectorThemeData(
            color: Color(0xffe6e7e9),
            thickness: 15.0,
          ),
        ),
        padding: EdgeInsets.only(top: 20.0),
        builder: TimelineTileBuilder.connected(
          indicatorBuilder: (context, index) {
            final statusIndex = transactionModel.status.index;
            return OutlinedDotIndicator(
              color: transactionModel.status.color,
              backgroundColor: transactionModel.status.color,
              borderWidth: 3.0,
            );
          },
          connectorBuilder: (context, index, connectorType) {
            return SolidLineConnector(
              color: transactionModel.status.color,
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
