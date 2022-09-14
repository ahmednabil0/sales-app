import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_app/main.dart';
import 'package:new_app/models/bransh_model.dart';
import 'package:new_app/models/items_model.dart';
import 'package:new_app/veiw_model/sql_db/sqlflite.dart';

class QuantitiesVeiwModel extends GetxController {
  // get branshes data
  // start
  String? intailData;
  oncganged(String? val) {
    intailData = val.toString();
    update();
  }

  String? intailData2;
  oncganged2(String? val) {
    intailData2 = val.toString();
    update();
  }

  List<String> dataList = [];
  List<BranshModel> branshesList = [];
  CollectionReference dataRef =
      FirebaseFirestore.instance.collection('branshes');
  Future<void> getBranshData() async {
    dataList.clear();
    branshesList.clear();
    await dataRef
        .where('companyName', isEqualTo: sharedpref!.getString('company'))
        .where('companyId', isEqualTo: sharedpref!.getInt('companyId'))
        .get()
        .then((value) {
      for (var i in value.docs) {
        branshesList.add(BranshModel.fromMap(i));
      }
      for (BranshModel i in branshesList) {
        dataList.add(i.bransh);
      }
      update();
    });
  }

  // end

  // get items data
  //start
  //get items data
  //start
  List<ItemModel> itemList = [];
  List<ItemModel> selectedList = [];
  MyDataBase db = MyDataBase();
  CollectionReference itemsRef =
      FirebaseFirestore.instance.collection('products');
  Future<void> getItemData() async {
    List myList = await db.getAllItem();
    if (myList.isEmpty) {
      await itemsRef
          .where(
            'companyName',
            isEqualTo: sharedpref!.getString('company'),
          )
          .get()
          .then((value) async {
        for (var i in value.docs) {
          db.addProducts(ItemModel.fromMap(i));
        }
      });
    }

    update();
  }

  Future<void> getProductsData() async {
    List myList = await db.getAllItem();
    for (var i in myList) {
      itemList.add(ItemModel.fromMap(i));
    }
    update();
  }

  void add(int i) {
    itemList[i].quntity = itemList[i].quntity + 20;
    update();
  }

  void sub(int i) {
    if (itemList[i].quntity > 1) {
      itemList[i].quntity--;
    }
    update();
  }

  void addItem(var i) {
    if (!selectedList.contains(i)) {
      selectedList.add(i);
    }
    // print(selectedList);
    update();
  }

  void clear() {
    selectedList.clear();
    update();
  }
  //end

  //send data
  //start
  showCircular() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: '',
        content: const LinearProgressIndicator());
  }

  CollectionReference ref = FirebaseFirestore.instance.collection('applicants');

  Future<void> sendData() async {
    List list = [];
    for (var element in selectedList) {
      list.add(element.toMap());
    }
    showCircular();
    DateTime date = DateTime.now();
    String dateTime = Jiffy(date).format('MM/dd/yyyy hh:mm:ss a');
    Random random = Random();
    int min = 10;
    int max = 1000000000;
    int min2 = 1000;
    int max2 = 100000000;

    int result = min + random.nextInt(max - min) + random.nextInt(max2 - min2);
    await ref.doc().set({
      'id': result,
      "date": dateTime,
      "salesId": sharedpref!.getString('id'),
      "items": list,
      "company": sharedpref!.getString('company'),
      "companyId": sharedpref!.getInt('companyId'),
      "accept": false,
      "delivered": false,
      "from": intailData,
      "to": intailData2,
      "dateDetails": date,
      "deliverDate": DateTime.now(),
      "receivedDate": DateTime.now(),
      "delivering": false,
      "received": false,
    });
    Get.back();
    Get.back();
  }

  //end
  @override
  void onInit() async {
    await getBranshData();
    await getItemData();
    await getProductsData();
    super.onInit();
  }
}
