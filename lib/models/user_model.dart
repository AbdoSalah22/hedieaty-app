import 'dart:convert';
import 'package:crypto/crypto.dart';

class User {
  final int? id;
  final String name;
  final String email;
  final String password; // Store hashed password

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  // Hash the password using SHA-256
  static String hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to bytes
    final hash = sha256.convert(bytes);  // Generate SHA-256 hash
    return hash.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['ID'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}
