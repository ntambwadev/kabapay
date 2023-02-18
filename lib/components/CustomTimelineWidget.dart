import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class Event {
  final String title;
  final bool isCompleted;

  Event({required this.title, required this.isCompleted});
}

class CustomTimelineWidget extends StatelessWidget {
  final List<Event> events;

  const CustomTimelineWidget({required this.events});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
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
          itemCount: events.length,
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              events[index].title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ),
          connectorBuilder: (context, index, connectorType) {
            final event = events[index];
            final color = event.isCompleted ? Colors.green : Colors.grey;
            return SolidLineConnector(
              color: color,
              thickness: 5.0,
            );
          },
          indicatorBuilder: (context, index) {
            final event = events[index];
            final color = event.isCompleted ? Colors.green : Colors.grey;
            return DotIndicator(
              color: color,
              child: SizedBox(
                width: 22.0,
                height: 22.0,
                child: event.isCompleted
                    ? Icon(Icons.check, color: Colors.white, size: 12.0)
                    : Icon(Icons.access_alarm_outlined, color: Colors.white, size: 12.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
