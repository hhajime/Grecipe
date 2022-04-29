import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grecipe/src/data/model/food_ingredients.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FiDBController extends GetxController {
  final usinController = TextEditingController();
  final inginfoController = TextEditingController();
  RxString ingIconName = '달걀'.obs;
  RxList ingResults2 = [].obs;
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

//결과 전달

  Future<dynamic> getFi(id) async {
    final Database db = await database;  
    final List<Map<String, dynamic>> maps = (await db.query(
      'Fi',
      where: 'id = ?',
      whereArgs: [id],
    ));

    return maps.isNotEmpty ? maps : null;
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

  getFiLength(){
    RxInt ingResultLength = 0.obs;
    getAllFi().then((list){
      ingResultLength++;
    });
    return ingResultLength.value;
  }

  getFiIngName(id){
    RxString ingName1 = '달걀'.obs;
    getAllFi().then((list){
      ingName1.value = list[id].ingName;
    });
    return ingName1;
  }

  getFiUserSpecName(id){
    RxString userSpecIngName1 = ''.obs;
    getAllFi().then((list){
      userSpecIngName1.value = list[id].userSpecIngName!;
    });
    return userSpecIngName1;
  }


  getFiShelflife(id){
    RxString shelfLife1 = 'good'.obs;
    getAllFi().then((list){
      shelfLife1.value = list[id].shelfLife;
    });
    return shelfLife1;
  }

//update

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