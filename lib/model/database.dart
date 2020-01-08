import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'docket.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, "DocketsDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Dockets("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "isDone BIT"
          ")");
    });
  }

  Future<List<Docket>> getAllDockets() async {
    final db = await database;
    var res = await db.query("Dockets");
    List<Docket> list =
        res.isNotEmpty ? res.map((f) => Docket.fromJson(f)).toList() : [];

    return list;
  }

  newDocket(Docket docket) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Dockets");
    int id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into Client(id, name, isDone)"
        " VALUES(?, ?, ?)",
        [id, docket.name, docket.isDone]);
    return raw;
  }
}
