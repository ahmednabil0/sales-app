import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_app/main.dart';
import 'package:new_app/models/invoice_model.dart';
import 'package:new_app/models/rents_model.dart';
import 'package:new_app/models/return.dart';
import 'package:new_app/veiw_model/sql_db/sqlflite.dart';

class DailyVeiwModel extends GetxController {
  MyDataBase db = MyDataBase();
  List invoice = [];
  List rents = [];
  List returns = [];
  List<Invoice> invoiceList = [];
  List<RentsModel> rentsList = [];
  List<ReturnModel> returnsList = [];

  Future<void> getInvoices() async {
    invoiceList.clear();
    invoice.clear();
    List myList = await db.getAllProducts();
    for (var i in myList) {
      invoiceList.add(Invoice.fromMap(i));
      invoice.add(i);
    }
    update();
  }

  Future<void> getRents() async {
    rentsList.clear();
    rents.clear();
    List myList = await db.getAllRents();
    for (var i in myList) {
      rentsList.add(RentsModel.fromMap(i));
      rents.add(i);
    }
    update();
  }

  Future<void> getReturns() async {
    returnsList.clear();
    returns.clear();
    List myList = await db.getAllReturns();
    for (var i in myList) {
      returnsList.add(ReturnModel.fromMap(i));
      returns.add(i);
    }
    // print(rentsList);
    // print(returnsList);
    // print(invoiceList);
    update();
  }

  String? dateTime;

  CollectionReference dailyRef =
      FirebaseFirestore.instance.collection('dailyes');
  Future<void> closeDaily() async {
    if (invoiceList.isNotEmpty ||
        rentsList.isNotEmpty ||
        returnsList.isNotEmpty) {
      Get.defaultDialog(title: '', content: const CircularProgressIndicator());
      DateTime date = DateTime.now();
      dateTime = Jiffy(date).format("yyyy/MM/dd");
      await dailyRef.doc().set({
        "date": dateTime,
        "salesId": sharedpref!.getString('id'),
        "items": invoice,
        "rents": rents,
        "returns": returns,
        "total": 0.0,
        "company": sharedpref!.getString('company'),
      });

      await db.clearInvoices();
      await db.clearItems();
      await db.clearRents();
      await db.clearReturns();
      await db.clearItemwReturns();
      Get.back();
      Get.back();
      Get.back();
    } else {
      Get.snackbar('عذرا ,', 'لاتوجد بيانات مسجلة حتي الان');
    }
  }

  @override
  void onInit() async {
    await getInvoices();
    await getRents();
    await getReturns();
    super.onInit();
  }
}
