class Gift {
  final int? id;
  final String name;
  final String? description;
  final String? category;
  final double? price;
  final String? status;
  final int eventID;

  Gift({
    this.id,
    required this.name,
    this.description,
    this.category,
    this.price,
    this.status,
    required this.eventID,
  });

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'status': status,
      'eventID': eventID,
    };
  }

  factory Gift.fromMap(Map<String, dynamic> map) {
    return Gift(
      id: map['ID'],
      name: map['name'],
      description: map['description'],
      category: map['category'],
      price: map['price'],
      status: map['status'],
      eventID: map['eventID'],
    );
  }
}
