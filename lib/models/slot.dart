class Slot {
  final String id;
  final DateTime startTime;
  final int capacity;

  Slot({
    required this.id,
    required this.startTime,
    required this.capacity,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      id: json['id'],
      startTime: DateTime.parse(json['start_time']),
      capacity: json['capacity'],
    );
  }
}
