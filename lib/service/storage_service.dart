import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class StorageService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // Find the device's app data directory, then build the database file path.
    final databaseDirectory = await getDatabasesPath();
    final databasePath = path.join(databaseDirectory, 'splitmate.db');

    // Open the database file (SQLite creates it the first time) and keep
    // the handle so future calls can reuse it.
    _database = await openDatabase(databasePath, version: 1);
    return _database!;
  }
}
