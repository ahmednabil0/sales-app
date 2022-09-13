// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:new_app/main.dart';
// import 'package:new_app/models/invoice_model.dart';
// import 'package:new_app/models/online_invoice_model.dart';
// import 'package:new_app/veiw_model/functions/ckeck_internet.dart';
// import 'package:new_app/veiw_model/sql_db/sqlflite.dart';

// class OffLineInvoices extends GetxController {
//   MyDataBase db = MyDataBase();
//   List<Invoice> offline = [];
//   List<Map> ofllinList = [];
//   Future<void> getOfflineInvoices() async {
//     List myList = await db.getofflineItems(0);
//     offline = [];
//     for (var i in myList) {
//       offline.add(Invoice.fromMap(i));
//     }
//     ofllinList = [];
//     for (var i in offline) {
//       List list = await db.getPurItems(i.id!);
//       ofllinList.add({'invoice': i, 'items': list});
//     }
//     update();
//   }

//   Future<void> updateInvoce(int id) async {
//     db.update(id, {"uploaded": 1});
//   }

//   Future<void> deleteItem(int id) async {
//     db.deleteItem(id);
//   }

//   CollectionReference invoicesRef =
//       FirebaseFirestore.instance.collection('invoices');
//   bool? internet;
//   upload() async {
//     internet = await ckeckInternet();
//     if (internet == true) {
//       if (ofllinList.isNotEmpty) {
//         for (var i in ofllinList) {
//           await invoicesRef.doc().set(FirebaseInvoiceModel(
//                 id: i['invoice'].id,
//                 date: i['invoice'].date,
//                 dueDate: i['invoice'].dueDate,
//                 total: i['invoice'].total,
//                 customerName: i['invoice'].customerName,
//                 salesId: sharedpref!.getString('id')!,
//                 company: sharedpref!.getString('company')!,
//                 uploaded: 1,
//                 items: i['items'],
//                 delivery: i['invoice'].delivery,
//                 vat: i['invoice'].vat,
//                 payed: i['invoice'].payed,
//                 rent: i['invoice'].rent,
//               ).toMap());
//           updateInvoce(i['invoice'].id);
//           // deleteItem(i['invoice'].id);
//         }
//         ofllinList.clear();
//       }
//     }
//     update();
//   }

//   @override
//   void onInit() async {
//     await getOfflineInvoices();
//     await upload();
//     super.onInit();
//   }
// }
