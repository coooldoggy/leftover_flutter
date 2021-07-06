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

}