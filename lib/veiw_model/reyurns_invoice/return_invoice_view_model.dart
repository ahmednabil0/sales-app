import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../main.dart';
import '../../models/customer_model.dart';
import '../../models/firebase_reurn_model.dart';
import '../../models/item_sql_model.dart';
import '../../models/items_model.dart';
import '../../models/return.dart';
import '../../veiw/sceans/home/invoice/completed_veiw.dart';
import '../functions/ckeck_internet.dart';
import '../sql_db/sqlflite.dart';

class ReturnIvoiceVeiwModel extends GetxController {
  TextEditingController vatCont = TextEditingController();

  // get customers data
  //start
  List<CustomerModel> mylist = [];
  List<String> afterList = [];
  CollectionReference customersRef =
      FirebaseFirestore.instance.collection('customers');
  Future<void> getCustomersDate() async {
    List myList = await db.getAllCustomers();

    if (myList.isEmpty) {
      await customersRef.get().then((value) async {
        for (var i in value.docs) {
          await db.addCustomers(CustomerModel.fromMap(i));
        }
      });
    }
    update();
  }

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

  Future<void> getCustomerData() async {
    List myList = await db.getAllCustomers();
    for (var i in myList) {
      mylist.add(CustomerModel.fromMap(i));
    }
    for (int i = 0; i < mylist.length; i++) {
      afterList.add(mylist[i].custName);
    }
    update();
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
  final MyDataBase db = MyDataBase();
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

  //end
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
      total = total - (double.parse(vatCont.text) * total);
      total = double.parse(total.toStringAsFixed(2));
    }
    update();
  }

  showCircular() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: '',
        content: const LinearProgressIndicator());
  }

  Future<void> insertItem(ItemSqlmodel item) async {
    await db.createitemsReturns(item);
  }

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

  Future<int> insertInvoice(ReturnModel invoice) async {
    int i = await db.createRrturns(invoice);
    return i;
  }

  Future<void> getAll() async {
    List list1 = await db.getAllReturns();
    List list2 = await db.getAllPItemsReturns();
    // ignore: avoid_print
    print(list1);
    // ignore: avoid_print
    print(list2);
  }

  //upload invoice
  //stert
  bool? internet;
  CollectionReference invoicesRef =
      FirebaseFirestore.instance.collection('returns');
  Future<void> uploadInvoice() async {
    internet = await ckeckInternet();
    // ignore: avoid_print
    print(internet);
    if (internet == false) {
      int i = await insertInvoice(
        ReturnModel(
          date: dateCont.text,
          customer: intailData!,
          salesId: sharedpref!.getString('id')!,
          company: sharedpref!.getString('company')!,
          total: total,
          vat: double.parse(vatCont.text),
          uploaded: 0,
        ),
      );
      await addItemsDb(i);
      // await controller.getAll();
      clearContent();
      Get.off(() => const CompletedScrean());
    }
    if (internet == true) {
      int i = await insertInvoice(
        ReturnModel(
          date: dateCont.text,
          customer: intailData!,
          salesId: sharedpref!.getString('id')!,
          company: sharedpref!.getString('company')!,
          total: total,
          vat: double.parse(vatCont.text),
          uploaded: 1,
        ),
      );
      await addItemsDb(i);
      List myList = await getSpecficItem(i);
      await invoicesRef.doc().set(FirebaseReturnModel(
            id: i,
            date: dateCont.text,
            customer: intailData!,
            salesId: sharedpref!.getString('id')!,
            company: sharedpref!.getString('company')!,
            total: total,
            vat: double.parse(vatCont.text),
            uploaded: 1,
            items: myList,
          ).toMap());

      clearContent();
      Get.off(() => const CompletedScrean());
    }
  }

  void clearContent() {
    selectedList.clear();
    intailData = null;
    vatCont.text = '0.0';
    total = 0.0;
    update();
  }

  Future<List> getSpecficItem(int id) async {
    List itemlista = await db.getPurRetrns(id);
    return itemlista;
  }

  String? dateTime;
  String? dueDate;
  final TextEditingController dateCont = TextEditingController();
  @override
  void onInit() async {
    DateTime date = DateTime.now();
    dateTime = Jiffy(date).format("yyyy/MM/dd");
    DateTime due = DateTime.now().add(const Duration(days: 7));
    dueDate = Jiffy(due).format("yyyy/MM/dd");
    dateCont.text = dateTime!;
    await getCustomersDate();
    await getCustomerData();
    await getItemData();
    await getProductsData();
    vatCont.text = '0.0';
    await getOfflineInvoices();
    await upload();
    super.onInit();
  }

  //upload offline
  //start
  List<ReturnModel> offline = [];
  List<Map> ofllinList = [];
  Future<void> getOfflineInvoices() async {
    List myList = await db.getofflineReturns(0);
    offline = [];
    for (var i in myList) {
      offline.add(ReturnModel.fromMap(i));
    }
    ofllinList = [];
    for (var i in offline) {
      List list = await db.getPurRetrns(i.id!);
      ofllinList.add({'returns': i, 'items': list});
    }
    update();
  }

  Future<void> updateInvoce(int id) async {
    db.updateReturn(id, {"uploaded": 1});
  }

  Future<void> deleteItem(int id) async {
    db.deleteItem(id);
  }

  upload() async {
    internet = await ckeckInternet();
    if (internet == true) {
      if (ofllinList.isNotEmpty) {
        for (var i in ofllinList) {
          await invoicesRef.doc().set(FirebaseReturnModel(
                  id: i['returns'].id,
                  date: i['returns'].date,
                  customer: i['returns'].customer,
                  salesId: i['returns'].salesId,
                  company: i['returns'].company,
                  total: i['returns'].total,
                  vat: i['returns'].vat,
                  uploaded: 1,
                  items: i['items'])
              .toMap());
          updateInvoce(i['returns'].id);
          // deleteItem(i['invoice'].id);
        }
        ofllinList.clear();
      }
    }
    update();
  }
  //end
}
