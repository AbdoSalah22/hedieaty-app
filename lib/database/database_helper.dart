import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'hedieaty.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create tables
    await db.execute('''
      CREATE TABLE Users (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS Events (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        date TEXT NOT NULL,
        location TEXT NOT NULL,
        description TEXT,
        userID INTEGER NOT NULL,
        FOREIGN KEY (userID) REFERENCES Users (ID) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS Gifts (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        category TEXT,
        price REAL,
        status TEXT,
        eventID INTEGER NOT NULL,
        FOREIGN KEY (eventID) REFERENCES Events (ID) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS Friends (
        userID INTEGER NOT NULL,
        friendID INTEGER NOT NULL,
        PRIMARY KEY (userID, friendID),
        FOREIGN KEY (userID) REFERENCES Users (ID) ON DELETE CASCADE,
        FOREIGN KEY (friendID) REFERENCES Users (ID) ON DELETE CASCADE
      )
    ''');
  }

  // Method to close the database
  Future<void> close() async {
    final db = await database;
    db.close();
  }

  // Function to insert new user into database
  Future<int> insertUser(User user) async {
    final db = await database;
    final result = await db.insert('Users', user.toMap());
    return result;
  }

  // Method to verify if user exists in database
  Future<bool> verifyUser(String email, String plainPassword) async {
    final db = await database;
    final result = await db.query(
      'Users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      final storedHashedPassword = result.first['password'];
      final hashedInputPassword = User.hashPassword(plainPassword);

      return storedHashedPassword == hashedInputPassword;
    }

    return false; // User not found or password mismatch
  }
}
