import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/main.dart';
import 'package:new_app/models/customer_model.dart';
import 'package:new_app/models/invoice_model.dart';
import 'package:new_app/models/item_sql_model.dart';
import 'package:new_app/models/items_model.dart';
import 'package:new_app/veiw_model/sql_db/sqlflite.dart';

class InvoiceVeiwModel extends GetxController {
  TextEditingController quntityCont = TextEditingController();
  TextEditingController deliveryCont = TextEditingController();
  TextEditingController vatCont = TextEditingController();

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

  String? intailData;
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
    update();
  }

  void clear() {
    selectedList.clear();
    update();
  }

  double total = 0.0;
  void calTotal() {
    if (selectedList.isNotEmpty) {
      total = 0.0;
      for (ItemModel element in selectedList) {
        total = total + (element.price * element.quntity);
      }
      total = total +
          double.parse(deliveryCont.text) +
          (double.parse(vatCont.text) * total);
    }
    update();
  }

  //sql
  //start
  MyDataBase db = MyDataBase();

  Future<int> insertInvoice(Invoice invoice) async {
    int i = await db.createinvoice(invoice);
    return i;
  }

  Future<void> insertItem(ItemSqlmodel item) async {
    await db.createitems(item);
  }

  Future<void> getAll() async {
    await db.getAllProducts();
    await db.getAllItems();
  }
  //end

  Future<void> addItemsDb(int num) async {
    for (var i in selectedList) {
      await insertItem(ItemSqlmodel(
          invoiceId: num,
          itemId: i.id,
          name: i.name,
          price: i.price,
          unit: i.unit,
          quntity: i.quntity));
    }
  }

  showCircular() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: '',
        content: const LinearProgressIndicator());
  }

  void clearContent() {
    selectedList.clear();
    intailData = null;
    vatCont.text = '0.0';
    deliveryCont.text = '0.0';
    total = 0.0;
    update();
  }

  @override
  void onInit() async {
    await getCustomersDate();
    await getItemData();
    deliveryCont.text = '0.0';
    vatCont.text = '0.0';
    super.onInit();
  }
}
