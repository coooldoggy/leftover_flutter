import 'package:leftover_flutter/data/TicketInfo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBHelper {
  final String mainTableName = "leftovertickets";
  var _db;

  /// 데이터 베이스 생성
  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      join(await getDatabasesPath(), 'leftovertickets.db'),
      onCreate: (db, version) => createDB(db),
      version: 1,
    );
    return _db;
  }

  static void createDB(Database db){
    db.execute(
        "CREATE TABLE leftovertickets(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, totalCnt INTEGER, "
            "leftCnt INTEGER, color INTEGER, startDate TEXT, endDate TEXT, location TEXT, memo TEXT)"
    );
  }

  ///insert
  Future<void> insertTicket(TicketInfo ticketInfo) async {
    final db = await database;
    await db.insert(mainTableName, ticketInfo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///get all
  Future<List<TicketInfo>> getAllTicket() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(mainTableName);
    return List.generate(maps.length, (i){
      return TicketInfo(id: maps[i]['id'], name: maps[i]['name'], totalCnt: maps[i]['totalCnt'], leftCnt: maps[i]['leftCnt'], color: maps[i]['color'], startDate: maps[i]['startDate'],
          endDate: maps[i]['endDate'], location: maps[i]['location'], memo: maps[i]['memo']);
    });
  }

  ///get one
  Future<dynamic> getTicket(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = (await db.query(mainTableName, where: "id = ?", whereArgs: [id]));
    return maps.isNotEmpty ? maps.first['id'] : null;
  }

  ///update
  Future<void> updateTicketInfo(TicketInfo ticketInfo) async {
    final db = await database;
    await db.update(mainTableName, ticketInfo.toMap(), where: "id = ?", whereArgs: [ticketInfo.id]);
  }


  ///delete
 Future<void> deleteTicket(int id) async {
   final db = await database;
   await db.delete(mainTableName, where: "id = ?", whereArgs: [id]);
 }

}