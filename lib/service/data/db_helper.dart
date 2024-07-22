import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  Future<sql.Database> db() async {
    return sql.openDatabase('data.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  createTable(sql.Database datebase) async {
    await datebase.execute('''
      CREATE TABLE popular_products (
        id TEXT PRIMARY KEY,
        type TEXT,
        title TEXT,
        contents TEXT
      )
    ''');
    await datebase.execute('''
      CREATE TABLE categories (
        id TEXT PRIMARY KEY,
        type TEXT,
        title TEXT,
        contents TEXT
      )
    ''');
    await datebase.execute('''
      CREATE TABLE banner_slider (
        id TEXT PRIMARY KEY,
        type TEXT,
        title TEXT,
        contents TEXT
      )
    ''');
    await datebase.execute('''
      CREATE TABLE banner_single (
        id TEXT PRIMARY KEY,
        type TEXT,
        title TEXT,
        image_url TEXT
      )
    ''');
    await datebase.execute('''
      CREATE TABLE featured_products (
        id TEXT PRIMARY KEY,
        type TEXT,
        title TEXT,
        contents TEXT
      )
    ''');
  }

  Future<void> insertData(String table, Map<String, dynamic> data) async {
    sql.Database database = await db();
    await database.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData(String table) async {
    sql.Database database = await db();
    return await database.query(table);
  }
}
