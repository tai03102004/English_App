import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Get the path to the app's documents directory
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Words.sqlite');

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // If the database doesn't exist, copy it from assets
      print('Copying database from assets...');

      // Load the asset's database file
      ByteData data = await rootBundle.load(join('lib/sources', 'Words.sqlite'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write the data to the local path
      await File(path).writeAsBytes(bytes, flush: true);
    }

    // Open the database
    return await openDatabase(path);
  }

  // Function to get around 30 random words from the 'bookmark' table
  Future<List<Map<String, dynamic>>> getRandomWords(int limit) async {
    final db = await database;
    return await db.rawQuery('SELECT * FROM bookmark ORDER BY RANDOM() LIMIT ?', [limit]);
  }
}
