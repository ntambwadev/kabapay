class EventData {
  final int index;
  final String type;
  final bool isCompleted;
  final Map<String, String> title;

  EventData({
    required this.index,
    required this.type,
    required this.isCompleted,
    required this.title,
  });

  factory EventData.fromMap(Map<String, dynamic> map) {
    return EventData(
      index: map["index"],
      type: map["type"],
      isCompleted: map["isCompleted"],
      title: Map<String, String>.from(map["title"]),
    );
  }
}