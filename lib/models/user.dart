class User {
  final String id;
  final String name;
  final String role;
  final String? bookedSlot;
  final DateTime? bookingDate;

  User({
    required this.id,
    required this.name,
    required this.role,
    this.bookedSlot,
    this.bookingDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      bookedSlot: json['booked_slot'],
      bookingDate: json['booking_date'] != null
          ? DateTime.parse(json['booking_date'])
          : null,
    );
  }
}
