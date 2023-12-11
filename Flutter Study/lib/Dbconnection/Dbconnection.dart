import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class Dbconnection{
  Future<Database> setdatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'bookmate');
    var db = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  Future<FutureOr<void>> _createDatabase(Database db, int version) async {
    String sql1 = "create table login(id integer primary key, username varchar(50), password varchar(50), type varchar(50))";
    await db.execute(sql1);
    String sql2 = "create table user(id integer primary key, fname varchar(50), lname varchar(50), dob varchar(50), email varchar(50), phone varchar(12), login int)";
    await db.execute(sql2);
    String sql3 = "create table category(id integer primary key, catname varchar(50))";
    await db.execute(sql3);
    String sql4 = "create table book(id integer primary key, bookname varchar(50), image varchar(50), author varchar(50), price varchar(50), bookstatus varchar(50), category int, user int)";
    await db.execute(sql4);
    String sql5 = "create table requests(id integer primary key, reqstatus varchar(50), reqdate varchar(50), user int, book int)";
    await db.execute(sql5);
    String sql6 = "create table complaints(id integer primary key, complaint varchar(500), comdate varchar(50), reply varchar(500), comstatus varchar(50), user int)";
    await db.execute(sql6);
    String sql7 = "create table feedbacks(id integer primary key, feedback varchar(500), feedbackdate varchar(50), user int)";
    await db.execute(sql7);
  }
}