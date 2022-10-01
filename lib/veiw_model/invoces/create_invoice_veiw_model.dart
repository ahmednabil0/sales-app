import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../main.dart';
import '../../models/customer_model.dart';
import '../../models/invoice_model.dart';
import '../../models/item_sql_model.dart';
import '../../models/items_model.dart';
import '../../models/online_invoice_model.dart';
import '../../veiw/sceans/home/invoice/completed_veiw.dart';
import '../functions/ckeck_internet.dart';
import '../sql_db/sqlflite.dart';

class InvoiceVeiwModel extends GetxController {
  TextEditingController quntityCont = TextEditingController();
  TextEditingController deliveryCont = TextEditingController();
  TextEditingController payedCont = TextEditingController();
  TextEditingController rentCont = TextEditingController();
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
  //sssssssss

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
    List list1 = await db.getAllProducts();
    List list2 = await db.getAllItems();
    // ignore: avoid_print
    print(list1);
    // ignore: avoid_print
    print(list2);
  }

  void deltaa() async {
    db.myDelete();
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

  //upload invoice
  //stert
  bool? internet;
  CollectionReference invoicesRef =
      FirebaseFirestore.instance.collection('invoices');
  Future<void> uploadInvoice() async {
    internet = await ckeckInternet();
    // ignore: avoid_print
    print(internet);
    if (internet == false) {
      int i = await insertInvoice(
        Invoice(
          date: dateTime!,
          dueDate: dueDate!,
          total: total,
          customerName: intailData!,
          salesId: sharedpref!.getString('id')!,
          company: sharedpref!.getString('company')!,
          uploaded: 0,
          delivery: double.parse(deliveryCont.text),
          vat: double.parse(vatCont.text),
          payed: double.parse(payedCont.text),
          rent: double.parse(rentCont.text),
        ),
      );
      await addItemsDb(i);
      // await controller.getAll();
      clearContent();
      Get.off(() => const CompletedScrean());
    }
    if (internet == true) {
      int i = await insertInvoice(
        Invoice(
          date: dateTime!,
          dueDate: dueDate!,
          total: total,
          customerName: intailData!,
          salesId: sharedpref!.getString('id')!,
          company: sharedpref!.getString('company')!,
          uploaded: 1,
          delivery: double.parse(deliveryCont.text),
          vat: double.parse(vatCont.text),
          payed: double.parse(payedCont.text),
          rent: double.parse(rentCont.text),
        ),
      );
      await addItemsDb(i);
      List myList = await getSpecficItem(i);
      await invoicesRef.doc().set(FirebaseInvoiceModel(
            id: i,
            date: dateTime!,
            dueDate: dueDate!,
            total: total,
            customerName: intailData!,
            salesId: sharedpref!.getString('id')!,
            company: sharedpref!.getString('company')!,
            uploaded: 1,
            items: myList,
            delivery: double.parse(deliveryCont.text),
            payed: double.parse(payedCont.text),
            rent: double.parse(rentCont.text),
            vat: double.parse(vatCont.text),
          ).toMap());

      clearContent();
      Get.off(() => const CompletedScrean());
    }
  }

  // end

  // send offline invoices
  //start
  List<Invoice> offline = [];
  List<Map> ofllinList = [];
  Future<void> getOfflineInvoices() async {
    List myList = await db.getofflineItems(0);
    offline = [];
    for (var i in myList) {
      offline.add(Invoice.fromMap(i));
    }
    ofllinList = [];
    for (var i in offline) {
      List list = await db.getPurItems(i.id!);
      ofllinList.add({'invoice': i, 'items': list});
    }
    update();
  }

  Future<void> updateInvoce(int id) async {
    db.update(id, {"uploaded": 1});
  }

  Future<void> deleteItem(int id) async {
    db.deleteItem(id);
  }

  CollectionReference ofinvoicesRef =
      FirebaseFirestore.instance.collection('invoices');
  bool? internetc;
  upload() async {
    internetc = await ckeckInternet();
    if (internetc == true) {
      if (ofllinList.isNotEmpty) {
        for (var i in ofllinList) {
          await ofinvoicesRef.doc().set(FirebaseInvoiceModel(
                id: i['invoice'].id,
                date: i['invoice'].date,
                dueDate: i['invoice'].dueDate,
                total: i['invoice'].total,
                customerName: i['invoice'].customerName,
                salesId: sharedpref!.getString('id')!,
                company: sharedpref!.getString('company')!,
                uploaded: 1,
                items: i['items'],
                delivery: i['invoice'].delivery,
                vat: i['invoice'].vat,
                payed: i['invoice'].payed,
                rent: i['invoice'].rent,
              ).toMap());
          updateInvoce(i['invoice'].id);
          // deleteItem(i['invoice'].id);
        }
        // print('00000000000000000000');
        ofllinList.clear();
      }
    }
    update();
  }
  //end

  Future<List> getSpecficItem(int id) async {
    List itemlista = await db.getPurItems(id);
    return itemlista;
  }

  String? dateTime;
  String? dueDate;
  final TextEditingController dateCont = TextEditingController();
  @override
  void onInit() async {
    await getOfflineInvoices();
    await upload();
    DateTime date = DateTime.now();
    dateTime = Jiffy(date).format("yyyy/MM/dd");
    DateTime due = DateTime.now().add(const Duration(days: 7));
    dueDate = Jiffy(due).format("yyyy/MM/dd");
    dateCont.text = dateTime!;
    await getCustomersDate();
    await getCustomerData();
    await getItemData();
    await getProductsData();
    deliveryCont.text = '0.0';
    vatCont.text = '0.0';
    super.onInit();
  }
}
