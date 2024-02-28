import 'package:flutter/material.dart';
import 'package:my_contacts/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'contacts.db'),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE if not exists contacts(name TEXT NOT NULL, phno TEXT NOT NULL)");
      },
      version: 1,
    );
  }

  Future<void> createItem(Contact contact) async {
    int result = 0;
    final Database db = await initializeDB();
    print('now executing the query');
    await db.execute(
        "CREATE TABLE if not exists contacts(name TEXT NOT NULL, phno TEXT NOT NULL)");
    print("Adding to Database");
    final phno = await db.insert('contacts', contact.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Contact>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('contacts');
    return queryResult.map((e) => Contact.fromMap(e)).toList();
  }

  Future<void> deleteItem(String phno) async {
    final db = await initializeDB();

    try {
      await db.delete("contacts", where: "phno = ?", whereArgs: [phno]);
    } catch (err) {
      debugPrint("Err : $err");
    }
  }
}
