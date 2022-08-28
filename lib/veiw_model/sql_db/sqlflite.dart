import 'dart:async';

import 'package:new_app/models/invoice_model.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'ahmed.db');
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 1, onUpgrade: _upgrade);
    return mydb;
  }

  FutureOr<void> _upgrade(Database db, int oldVersion, int newVersion) {}

  FutureOr<void> _oncreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE "invoices" (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
      "date" TEXT NOT NULL , 
      "dueDate" TEXT NOT NULL,
      "total" REAL NOT NULL,
      "customerName" TEXT NOT NULL,
      "salesId" INTEGER NOT NULL,
      "company" TEXT NOT NULL,
    )
    ''');
    await db.execute(''' 
    CREATE TABLE "items" (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
      "invoiceId" INTEGER  NOT NULL ,
      "itemId" INTEGER  NOT NULL ,
      "name" TEXT NOT NULL , 
      "price" REAL NOT NULL,
      "unit" TEXT NOT NULL,
      "quntity" INTEGER NOT NULL,
    )
    ''');
  }

  Future<int> createinvoice(Invoice invoice) async {
    Database db = await intialDb();
    return db.insert('invoices', invoice.toMap());
  }

  Future<List<Map<String, Object?>>> getAllProducts() async {
    Database db = await intialDb();
    return db.query('invoices');
  }

  Future<int> delete(int id) async {
    Database db = await intialDb();
    return db.delete('invoices', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> clear() async {
    Database db = await intialDb();
    return db.delete(
      'invoices',
    );
  }

  Future<int> update(Invoice invoice) async {
    Database db = await intialDb();
    return db.update('products', invoice.toMap(),
        where: 'id = ?', whereArgs: [invoice.id]);
  }
}
