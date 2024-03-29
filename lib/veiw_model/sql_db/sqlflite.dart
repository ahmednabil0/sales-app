import 'dart:async';
import '../../models/customer_model.dart';
import '../../models/invoice_model.dart';
import '../../models/item_sql_model.dart';
import '../../models/items_model.dart';
import '../../models/rents_model.dart';
import '../../models/return.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
// create data base
// start
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
// end

// create tables
//start
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
    CREATE TABLE "itemsReturns" (
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
    await db.execute(''' 
    CREATE TABLE "rents" (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      "date" TEXT NOT NULL , 
      "invoiceId" INTEGER NOT NULL ,
      "invoiceDate" TEXT NOT NULL ,
      "totalInvoice" REAL NOT NULL ,
      "customer" TEXT NOT NULL ,
      "salesId" TEXT NOT NULL ,
      "oldSalesId" TEXT NOT NULL ,
      "company" TEXT NOT NULL ,
      "payed" REAL NOT NULL ,
      "totalPayed" REAL NOT NULL ,
      "rent" REAL NOT NULL
    )
    ''');
    await db.execute(''' 
    CREATE TABLE "returns" (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      "date" TEXT NOT NULL , 
      "customer" TEXT NOT NULL ,
      "salesId" TEXT NOT NULL ,
      "company" TEXT NOT NULL ,
      "total" REAL NOT NULL ,
      "uploaded" INTEGER NOT NULL ,
      "vat" REAL NOT NULL 
    )
    ''');
  }
//end

// add data to data base
//start
  Future<int> createinvoice(Invoice invoice) async {
    Database? mydb = await db;
    return mydb!.insert('invoices', invoice.toMap());
  }

  Future<int> createRents(RentsModel rent) async {
    Database? mydb = await db;
    return mydb!.insert('rents', rent.toMap());
  }

  Future<int> createRrturns(ReturnModel returns) async {
    Database? mydb = await db;
    return mydb!.insert('returns', returns.toMap());
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

  Future<int> createitemsReturns(ItemSqlmodel item) async {
    Database? mydb = await db;
    int response = await mydb!.insert('itemsReturns', item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }
//end

// clear data base
// start
  Future<int> clearInvoices() async {
    Database? mydb = await db;
    return mydb!.delete(
      'invoices',
    );
  }

  Future<int> clearItems() async {
    Database? mydb = await db;
    return mydb!.delete(
      'items',
    );
  }

  Future<int> clearRents() async {
    Database? mydb = await db;
    return mydb!.delete(
      'rents',
    );
  }

  Future<int> clearReturns() async {
    Database? mydb = await db;
    return mydb!.delete(
      'returns',
    );
  }

  Future<int> clearItemwReturns() async {
    Database? mydb = await db;
    return mydb!.delete(
      'itemsReturns',
    );
  }
  //end

// get data from data base
// start
  Future<List<Map<String, Object?>>> getAllProducts() async {
    Database db = await intialDb();
    return db.query('invoices');
  }

  Future<List<Map<String, Object?>>> getAllPItemsReturns() async {
    Database db = await intialDb();
    return db.query('itemsReturns');
  }

  Future<List<Map<String, Object?>>> getAllRents() async {
    Database db = await intialDb();
    return db.query('rents');
  }

  Future<List<Map<String, Object?>>> getAllReturns() async {
    Database db = await intialDb();
    return db.query('returns');
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

  Future<List<Map<String, Object?>>> getPurRetrns(int invoiceId) async {
    Database db = await intialDb();
    return db
        .query('itemsReturns', where: 'invoiceId = ?', whereArgs: [invoiceId]);
  }

  Future<List<Map<String, Object?>>> getofflineItems(int uploaded) async {
    Database db = await intialDb();
    return db.query('invoices', where: 'uploaded = ?', whereArgs: [uploaded]);
  }

  Future<List<Map<String, Object?>>> getofflineReturns(int uploaded) async {
    Database db = await intialDb();
    return db.query('returns', where: 'uploaded = ?', whereArgs: [uploaded]);
  }

//end

// delete data
// start
  Future<int> delete(int id) async {
    Database db = await intialDb();
    return db.delete('invoices', where: 'id = ?', whereArgs: [id]);
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
// end

//  update date
//start
  Future<int> update(int id, Map<String, Object> map) async {
    Database db = await intialDb();
    return db.update('invoices', map, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateReturn(int id, Map<String, Object> map) async {
    Database db = await intialDb();
    return db.update('returns', map, where: 'id = ?', whereArgs: [id]);
  }
// end

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
