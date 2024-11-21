// This is a join table and might not be used in code.

class Friend {
  final int userID;
  final int friendID;

  Friend({required this.userID, required this.friendID});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'friendID': friendID,
    };
  }

  factory Friend.fromMap(Map<String, dynamic> map) {
    return Friend(
      userID: map['userID'],
      friendID: map['friendID'],
    );
  }
}
