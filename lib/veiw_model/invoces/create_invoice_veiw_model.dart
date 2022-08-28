import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/main.dart';
import 'package:new_app/models/customer_model.dart';
import 'package:new_app/models/items_model.dart';

class InvoiceVeiwModel extends GetxController {
  TextEditingController quntityCont = TextEditingController();

  // get customers data
  //start
  List<CustomerModel> mylist = [];
  List<String> afterList = [];
  CollectionReference customersRef =
      FirebaseFirestore.instance.collection('customers');
  Future<void> getCustomersDate() async {
    await customersRef.get().then((value) {
      for (var i in value.docs) {
        mylist.add(CustomerModel.fromMap(i));
      }
      for (int i = 0; i < mylist.length; i++) {
        afterList.add(mylist[i].custName);
      }
      update();
    });
  }

  String intailData = '20'.tr;
  oncganged(String? val) {
    intailData = val.toString();
    update();
  }
  //end

  //get items data
  //start
  List<ItemModel> itemList = [];
  List<ItemModel> selectedList = [];

  CollectionReference itemsRef =
      FirebaseFirestore.instance.collection('products');
  Future<void> getItemData() async {
    await itemsRef
        .where(
          'companyName',
          isEqualTo: sharedpref!.getString('company'),
        )
        .get()
        .then((value) {
      for (var i in value.docs) {
        itemList.add(
          ItemModel.fromMap(i),
        );
      }
      update();
    });
  }

  //end
  void add(int i) {
    itemList[i].quntity++;
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

  void calTotal() {}

  @override
  void onInit() async {
    await getCustomersDate();
    await getItemData();
    super.onInit();
  }
}
