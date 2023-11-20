import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/contact.model.dart'; // Correct the import statement for the Contact model

class ContactDatabase {
  static Database? database;

  Future<void> initDB() async {
    if (database == null) {
      String databasePath = await getDatabasesPath();
      String path = join(databasePath, 'voyage.db');
      database = await openDatabase(path, version: 1, onCreate: onCreate);
    }
  }

  Future<void> onCreate(Database db, int version) async {
    String sql = '''
      CREATE TABLE ${Contact.table} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom STRING,
        tel STRING
      );
    ''';
    await db.execute(sql);
  }

  Future<List<Map<String, dynamic>>> recuperer() async {
    await initDB();
    return database!.query(Contact.table);
  }

  Future<int> inserer(Contact contact) async {
    await initDB();
    return database!.insert(Contact.table, contact.toJson());
  }

  Future<int> modifier(Contact contact) async {
    await initDB();
    return database!.update(
      Contact.table,
      contact.toJson(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> supprimer(Contact contact) async {
    await initDB();
    return database!.delete(
      Contact.table,
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }
}
