import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class Dbconnection{
  Future<Database> setdatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'sqlitesample1');
    var db = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  Future<FutureOr<void>> _createDatabase(Database db, int version) async {
    String sql = "create table data1(id integer primary key, name varchar(50))";
    await db.execute(sql);
  }
}