import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../flutter_flow/flutter_flow_theme.dart';
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
    return Container(
      width: double.infinity,
      height: events.length > 1 ? (events.length - 1) * 45.0 + 70 : 45.0 + 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                itemCount: events.length > 1 ? (events.length - 1): events.length,
                contentsBuilder: (context, index) {
                  final event = events.firstWhere((event) => event.index == index);
                  String title = event.title?[FFLocalizations.of(context).languageCode] ?? '';

                  if (events.contains((event) => event.type == "PAYIN_CRYPTO_TRANSFER_FAILED" && event.isCompleted)) {
                    final failedEvent = events.firstWhere((event) => event.type == "PAYIN_CRYPTO_TRANSFER_FAILED");
                    title = failedEvent.title?[FFLocalizations.of(context).languageCode] ?? '';
                  }
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
                  final event = events.firstWhere((event) => event.index == index);
                  Color color = event.isCompleted ? Colors.green : Colors.grey;

                  if (events.contains((event) => event.type == "PAYIN_CRYPTO_TRANSFER_FAILED" && event.isCompleted)) {
                    color = Colors.red;
                  }
                  return SolidLineConnector(
                    color: color,
                    thickness: 5.0,
                  );
                },
                indicatorBuilder: (context, index) {
                  final event = events.firstWhere((event) => event.index == index);
                  Color color = event.isCompleted ? Colors.green : Colors.grey;
                  Icon icon = event.isCompleted
                      ? Icon(Icons.check, color: Colors.white, size: 12.0)
                      : Icon(Icons.access_alarm_outlined, color: Colors.white, size: 12.0);

                  if (events.contains((event) => event.type == "PAYIN_CRYPTO_TRANSFER_FAILED" && event.isCompleted)) {
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
    );
  }
}
