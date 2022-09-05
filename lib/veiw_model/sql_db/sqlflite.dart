import 'dart:async';

import 'package:new_app/models/customer_model.dart';
import 'package:new_app/models/invoice_model.dart';
import 'package:new_app/models/item_sql_model.dart';
import 'package:new_app/models/items_model.dart';
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
        onCreate: _oncreate, version: 2, onUpgrade: _upgrade);
    return mydb;
  }

  FutureOr<void> _upgrade(Database db, int oldVersion, int newVersion) {
    // ignore: avoid_print
    print('upgraded============================');
  }

  FutureOr<void> _oncreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE "invoices" (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      "date" TEXT NOT NULL , 
      "dueDate" TEXT NOT NULL ,
      "total" REAL NOT NULL ,
      "customerName" TEXT NOT NULL ,
      "salesId" TEXT NOT NULL ,
      "company" TEXT NOT NULL ,
      "uploaded" INTEGER NOT NULL ,
      "vat" REAL NOT NULL ,
      "delivery" REAL NOT NULL ,
      "payed" REAL NOT NULL ,
      "rent" REAL NOT NULL
    )
    ''');
    await db.execute(''' 
    CREATE TABLE "items" (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
      "invoiceId" INTEGER  NOT NULL ,
      "itemId" INTEGER  NOT NULL ,
      "name" TEXT NOT NULL , 
      "price" REAL NOT NULL ,
      "unit" TEXT NOT NULL ,
      "quntity" INTEGER NOT NULL
    )
    ''');
    await db.execute(''' 
    CREATE TABLE "itemsoffline" (
      "companyId" INTEGER NOT NULL ,
      "companyName" TEXT NOT NULL ,
      "id" INTEGER NOT NULL ,
      "name" TEXT NOT NULL , 
      "price" REAL NOT NULL ,
      "quntity" INTEGER NOT NULL ,
      "unit" TEXT NOT NULL ,
      "url" TEXT NOT NULL ,
      "vat" REAL NOT NULL
    )
    ''');
    await db.execute(''' 
    CREATE TABLE "customers" (
      "cid" TEXT NOT NULL ,
      "companyId" INTEGER NOT NULL ,
      "companyName" TEXT NOT NULL ,
      "custName" TEXT NOT NULL , 
      "phone" TEXT NOT NULL ,
      "rent" INTEGER NOT NULL ,
      "rent_value" REAL NOT NULL
    )
    ''');
  }

  Future<int> createinvoice(Invoice invoice) async {
    Database? mydb = await db;
    return mydb!.insert('invoices', invoice.toMap());
  }

  Future<int> addProducts(ItemModel item) async {
    Database? mydb = await db;
    return mydb!.insert('itemsoffline', item.toMap());
  }

  Future<int> addCustomers(CustomerModel cust) async {
    Database? mydb = await db;
    return mydb!.insert('customers', cust.toMap());
  }

  Future<int> createitems(ItemSqlmodel item) async {
    Database? mydb = await db;
    int response = await mydb!.insert('items', item.toMap());
    return response;
  }

  Future<int> clear() async {
    Database? mydb = await db;
    return mydb!.delete(
      'invoices',
    );
  }

  Future<List<Map<String, Object?>>> getAllProducts() async {
    Database db = await intialDb();
    return db.query('invoices');
  }

  Future<List<Map<String, Object?>>> getAllItem() async {
    Database db = await intialDb();
    return db.query('itemsoffline');
  }

  Future<List<Map<String, Object?>>> getAllCustomers() async {
    Database db = await intialDb();
    return db.query('customers');
  }

  Future<List<Map<String, Object?>>> getAllItems() async {
    Database db = await intialDb();
    return db.query('items');
  }

  Future<List<Map<String, Object?>>> getPurItems(int invoiceId) async {
    Database db = await intialDb();
    return db.query('items', where: 'invoiceId = ?', whereArgs: [invoiceId]);
  }

  Future<List<Map<String, Object?>>> getofflineItems(int uploaded) async {
    Database db = await intialDb();
    return db.query('invoices', where: 'uploaded = ?', whereArgs: [uploaded]);
  }

  Future<int> delete(int id) async {
    Database db = await intialDb();
    return db.delete('invoices', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(int id, Map<String, Object> map) async {
    Database db = await intialDb();
    return db.update('invoices', map, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteItem(int invoiceId) async {
    Database db = await intialDb();
    return db.delete('items', where: 'invoiceId = ?', whereArgs: [invoiceId]);
  }

  myDelete() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'ahmed.db');
    // print('deeeeee');
    return deleteDatabase(path);
  }

  // Future<int> clear() async {
  //   Database db = await intialDb();
  //   return db.delete(
  //     'invoices',
  //   );
  // }

  // Future<int> update(Invoice invoice) async {
  //   Database db = await intialDb();
  //   return db.update('products', invoice.toMap(),
  //       where: 'id = ?', whereArgs: [invoice.id]);
  // }
}
