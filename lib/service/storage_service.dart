import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StorageService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

  }
}