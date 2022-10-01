import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../main.dart';
import '../../models/customer_model.dart';
import '../../models/online_invoice_model.dart';
import '../../models/rents_model.dart';
import '../../veiw/helper/consts/colors.dart';
import '../sql_db/sqlflite.dart';

class RentInvoiceViewModel extends GetxController {
  final TextEditingController dateCont = TextEditingController();
  final TextEditingController payedCont = TextEditingController();
  final TextEditingController rentCont = TextEditingController();
  final TextEditingController willPayCont = TextEditingController();
  CollectionReference rentRef = FirebaseFirestore.instance.collection('rents');
  //=========================================\\
  MyDataBase db = MyDataBase();
  List<CustomerModel> mylist = [];
  List<String> afterList = [];
  CollectionReference customersRef =
      FirebaseFirestore.instance.collection('customers');
  Future<void> getCustomersDate() async {
    List myList = await db.getAllCustomers();

    if (myList.isEmpty) {
      await customersRef
          .where('companyName', isEqualTo: sharedpref!.getString('company'))
          .where('companyId', isEqualTo: sharedpref!.getInt('companyId'))
          .get()
          .then((value) async {
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

  void passData(String id) {
    intailData = id;
  }

  String? intailData;
  oncganged(String? val) {
    intailData = val.toString();
    update();
  }
  //end

  //=========================================\\
  SizedBox buildDateTxtFormCust(context) {
    return SizedBox(
      width: Get.width * 0.85,
      child: TextFormField(
        controller: dateCont,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }
          return null;
        },
        readOnly: true,
        onTap: () async {
          DateTime? date = await showDatePicker(
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.blue,
                        primaryColorDark:
                            AppColors.primaryColor.withOpacity(0.5),
                        accentColor: Colors.blueAccent,
                        cardColor: AppColors.primaryColor.withOpacity(0.4)),
                    dialogBackgroundColor: Colors.white,
                  ),
                  child: child!,
                );
              },
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100));
          if (date == null) {
            dateCont.clear();
          }
          if (date != null) {
            dateCont.text = Jiffy(date).format("yyyy/MM/dd");
          }
        },
        style: const TextStyle(
            color: AppColors.primaryColor, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: '39'.tr,
          hintStyle: TextStyle(
            fontSize: Get.width * 0.04,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
          prefixIcon: const Icon(
            Icons.date_range_outlined,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  CollectionReference invoicesRef =
      FirebaseFirestore.instance.collection('invoices');
  List<FirebaseInvoiceModel> invoiceList = [];
  Future<void> getData(String date, String name) async {
    await invoicesRef
        .where('salesId', isEqualTo: sharedpref!.getString('id'))
        .where('company', isEqualTo: sharedpref!.getString('company'))
        // .where('companyId', isEqualTo: sharedpref!.getInt('companyId'))
        .where('customerName', isEqualTo: name)
        .where('date', isEqualTo: date)
        .get()
        .then((value) {
      invoiceList.clear();
      // // ignore: avoid_print
      // print(value.docs);
      // // ignore: avoid_print
      // print('0000000000000000000000000000000');
      for (var i in value.docs) {
        invoiceList.add(FirebaseInvoiceModel.fromMap(i));
      }

      update();
    });
  }

  List<FirebaseInvoiceModel> confirmInvoiceList = [];
  void addToList(FirebaseInvoiceModel model) {
    confirmInvoiceList.clear();
    confirmInvoiceList.add(model);
    dateCont.text = "${dateCont.text} ___ ${'41'.tr} # ${model.id}";
    payedCont.text = model.payed.toStringAsFixed(2).toString();
    rentCont.text = model.rent.toStringAsFixed(2).toString();
    update();
  }

  void addMoney(FirebaseInvoiceModel model) async {
    Get.defaultDialog(title: '', content: const CircularProgressIndicator());
    if (double.parse(willPayCont.text).isGreaterThan(0.0)) {
      payedCont.text = (double.parse(payedCont.text.trim()) +
              double.parse(willPayCont.text.trim()))
          .toStringAsFixed(2)
          .toString();
      rentCont.text =
          (confirmInvoiceList[0].total - double.parse(payedCont.text.trim()))
              .toStringAsFixed(2)
              .toString();
      await Future.delayed(const Duration(milliseconds: 200));
      await invoicesRef
          .where('id', isEqualTo: model.id)
          .where('salesId', isEqualTo: model.salesId)
          .where('company', isEqualTo: sharedpref!.getString('company'))
          // .where('companyId', isEqualTo: sharedpref!.getInt('companyId'))
          .where('customerName', isEqualTo: model.customerName)
          .where('date', isEqualTo: model.date)
          .get()
          .then((value) async {
        for (var i in value.docs) {
          invoicesRef.doc(i.id).update(FirebaseInvoiceModel(
                id: model.id,
                date: model.date,
                dueDate: model.dueDate,
                total: model.total,
                customerName: model.customerName,
                salesId: model.salesId,
                company: model.company,
                uploaded: model.uploaded,
                items: model.items,
                vat: model.vat,
                delivery: model.delivery,
                payed: double.parse(willPayCont.text) + model.payed,
                rent: double.parse(rentCont.text),
              ).toMap());

          rentRef.doc().set({
            "invoiceId": model.id,
            "oldSalesId": model.salesId,
            "salesId": sharedpref!.getString('id'),
            "payed": double.parse(willPayCont.text),
            "totalPayed": double.parse(willPayCont.text) + model.payed,
            "rent": double.parse(rentCont.text),
            "customer": model.customerName,
            "company": model.company,
            "invoiceDate": model.date,
            "date": Jiffy(DateTime.now()).format("yyyy/MM/dd"),
            "totalInvoice": model.total
          });
          MyDataBase db = MyDataBase();
          await db.createRents(
            RentsModel(
              date: Jiffy(DateTime.now()).format("yyyy/MM/dd"),
              invoiceDate: model.date,
              invoiceid: model.id,
              totalInvoice: model.total,
              customer: model.customerName,
              salesId: sharedpref!.getString('id')!,
              oldSalesId: model.salesId,
              company: model.company,
              rent: double.parse(rentCont.text),
              payed: double.parse(willPayCont.text),
              totalPayed: double.parse(willPayCont.text) + model.payed,
            ),
          );
          // List mylist = await db.getAllRents();
          // print(mylist);
        }
      });
      Get.back();
      Get.back();
    } else {
      Get.snackbar('invalid', 'عملية غير صالحة');
    }
  }

  @override
  void onInit() async {
    await getCustomersDate();
    await getCustomerData();
    super.onInit();
  }
}
