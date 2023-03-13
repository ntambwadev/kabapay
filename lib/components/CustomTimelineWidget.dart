import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:expandable/expandable.dart';

import '../models/transaction_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/internationalization.dart';
import '../models/EventData.dart';

class Event {
  final String title;
  final bool isCompleted;

  Event({required this.title, required this.isCompleted});
}

class CustomTimelineWidget extends StatelessWidget {
  final List<EventData> events;

  const CustomTimelineWidget({required this.events});

  @override
  Widget build(BuildContext context) {
    var txCancelledStatus = TransactionStatus.PAYIN_TRANSACTION_CANCELLED.value;
    var txFailedStatus = TransactionStatus.PAYIN_CRYPTO_TRANSFER_FAILED.value;

    events.sort((a, b) => a.index.compareTo(b.index));
    var completedEvents = events.where((event) => event.isCompleted).toList();
    for (var i = 0; i < completedEvents.length; i++) {
      completedEvents[i].index = i;
    }
    var isTxCancelled = events.length > 0 && events.any((event) => event.type == txCancelledStatus && event.isCompleted);

    var height = events.length > 1 ? (events.length - 1) * 40.0 : 70.0;
    if (isTxCancelled) {
      height = completedEvents.length > 1 ? (completedEvents.length - 1) * 70.0 : 70;
    }

    var itemCount = events.length - 2;
    if (isTxCancelled) {
      itemCount = events.length;
    }

    return Container(
        width: double.infinity,
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: ExpandableNotifier(
          initialExpanded: true,
          child: ExpandablePanel(
            header:
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
              child: Text(
                FFLocalizations.of(context).getText(
                  'lw2h6xsc' /* Transaction Status */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            collapsed: Container(),
            expanded: Container(
              width: double.infinity,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: FixedTimeline.tileBuilder(
                      theme: TimelineThemeData(
                        nodePosition: 0,
                        color: Colors.green,
                        connectorTheme: ConnectorThemeData(
                          color: Colors.green,
                          thickness: 5.0,
                        ),
                      ),
                      builder: TimelineTileBuilder.connected(
                        connectionDirection: ConnectionDirection.before,
                        itemCount: itemCount,
                        contentsBuilder: (context, index) {
                          List<EventData> events = isTxCancelled ? completedEvents : this.events;
                          if (isTxCancelled && !events.any((event) => event.index == index)) {
                            return null;
                          }
                          final event = events.firstWhere((event) => event.index == index);
                          String title = event.title?[FFLocalizations.of(context).languageCode] ?? '';
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              title,
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 13
                              ),
                            ),
                          );
                        },
                        connectorBuilder: (context, index, connectorType) {
                          List<EventData> events = isTxCancelled ? completedEvents : this.events;
                          if (isTxCancelled && !events.any((event) => event.index == index)) {
                            return null;
                          }
                          final event = events.firstWhere((event) => event.index == index);
                          Color color = event.isCompleted ? Colors.green : Colors.grey;

                          if ((event.type == txFailedStatus || event.type == txCancelledStatus) && event.isCompleted) {
                            color = Colors.red;
                          }
                          return SolidLineConnector(
                            color: color,
                            thickness: 5.0,
                          );
                        },
                        indicatorBuilder: (context, index) {
                          List<EventData> events = isTxCancelled ? completedEvents : this.events;
                          if (isTxCancelled && !events.any((event) => event.index == index)) {
                            return null;
                          }
                          final event = events.firstWhere((event) => event.index == index);
                          Color color = event.isCompleted ? Colors.green : Colors.grey;
                          Icon icon = event.isCompleted
                              ? Icon(Icons.check, color: Colors.white, size: 12.0)
                              : Icon(Icons.access_alarm_outlined, color: Colors.white, size: 12.0);

                          if ((event.type == txFailedStatus
                              || event.type == txCancelledStatus) && event.isCompleted) {
                            color = Colors.red;
                            icon = Icon(Icons.dangerous, color: Colors.white, size: 12.0);
                          }
                          return DotIndicator(
                            color: color,
                            child: SizedBox(
                              width: 22.0,
                              height: 22.0,
                              child: icon,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: true,
            ),
          ),
        ),
      ) ;
  }
}
