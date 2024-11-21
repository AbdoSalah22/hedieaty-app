class Event {
  final int? id;
  final String name;
  final String date;
  final String location;
  final String? description;
  final int userID;

  Event({
    this.id,
    required this.name,
    required this.date,
    required this.location,
    this.description,
    required this.userID,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'name': name,
      'date': date,
      'location': location,
      'description': description,
      'userID': userID,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['ID'],
      name: map['name'],
      date: map['date'],
      location: map['location'],
      description: map['description'],
      userID: map['userID'],
    );
  }
}
