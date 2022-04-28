import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/model/food_ingredients.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FiDBController extends GetxController {
  final usinController = TextEditingController();
  final inginfoController = TextEditingController();
  RxString ingIconName = '달걀'.obs;
  var _db;

  Future<int?> getCount() async {
    //database connection
    Database db = await database;
    var x = await db.rawQuery('SELECT COUNT (*) from $Fi');
    int? count = Sqflite.firstIntValue(x);
    if(count == null){
      count = 1;
    }
    return count;
}
  
  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'Fi.db'),
        onCreate: (db, version) => _createDb(db), version: 1);
    return _db;
  }
  
  static void _createDb(Database db) {
    db.execute(
      "CREATE TABLE Fi(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, ingName TEXT, userSpecIngName TEXT, shelfLife TEXT, ingMemo TEXT)",
    );
  }

  Future<void> insertFi(Fi fi) async {
    final Database db = await database;
    await db.insert(
      'Fi',
      fi.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Fi>> getAllFi() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Fi');
    return List.generate(maps.length, (i) {
      return Fi(
        id: maps[i]['id'],
        ingName: maps[i]['ingName'],
        userSpecIngName: maps[i]['userSpecIngName'],
        shelfLife: maps[i]['shelfLife'],
        ingMemo: maps[i]['ingMemo'],
      );
    });
  }

  Future<void> updateFi(Fi fi) async {
    final db = await database;
    await db.update(
      'Fi',
      fi.toMap(),
      where: "id = ?",
      whereArgs: [fi.id],
    );
  }  

  Future<void> deleteFi(int id) async {
    final db = await database;
    await db.delete(
      'Fi',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}