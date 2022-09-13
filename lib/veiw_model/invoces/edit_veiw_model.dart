// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:new_app/main.dart';
// import 'package:new_app/models/customer_model.dart';
// import 'package:new_app/models/item_sql_model.dart';
// import 'package:new_app/models/items_model.dart';
// import 'package:new_app/models/online_invoice_model.dart';
// import 'package:new_app/veiw/helper/consts/colors.dart';
// import 'package:new_app/veiw_model/sql_db/sqlflite.dart';

// class EditViewModel extends GetxController {
//   final TextEditingController dateCont = TextEditingController();

//   SizedBox buildDateTxtFormCust(context) {
//     return SizedBox(
//       width: Get.width * 0.9,
//       child: TextFormField(
//         controller: dateCont,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return '5'.tr;
//           }
//           return null;
//         },
//         readOnly: true,
//         onTap: () async {
//           DateTime? date = await showDatePicker(
//               builder: (BuildContext context, Widget? child) {
//                 return Theme(
//                   data: ThemeData.light().copyWith(
//                     colorScheme: ColorScheme.fromSwatch(
//                         primarySwatch: Colors.blue,
//                         primaryColorDark:
//                             AppColors.primaryColor.withOpacity(0.5),
//                         accentColor: Colors.blueAccent,
//                         cardColor: AppColors.primaryColor.withOpacity(0.4)),
//                     dialogBackgroundColor: Colors.white,
//                   ),
//                   child: child!,
//                 );
//               },
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(1900),
//               lastDate: DateTime(2100));
//           if (date == null) {
//             dateCont.clear();
//           }
//           if (date != null) {
//             dateCont.text = Jiffy(date).format("yyyy/MM/dd");
//           }
//         },
//         style: const TextStyle(
//             color: AppColors.primaryColor, fontWeight: FontWeight.w600),
//         decoration: InputDecoration(
//           hintText: '39'.tr,
//           hintStyle: TextStyle(
//             fontSize: Get.width * 0.04,
//             fontWeight: FontWeight.w700,
//             color: AppColors.primaryColor.withOpacity(0.5),
//           ),
//           prefixIcon: const Icon(
//             Icons.date_range_outlined,
//             color: AppColors.primaryColor,
//           ),
//         ),
//       ),
//     );
//   }

//   CollectionReference invoicesRef =
//       FirebaseFirestore.instance.collection('invoices');
//   List<FirebaseInvoiceModel> invoiceList = [];
//   Future<void> getData(String date) async {
//     await invoicesRef
//         .where('salesId', isEqualTo: sharedpref!.getString('id'))
//         .where('company', isEqualTo: sharedpref!.getString('company'))
//         .where('date', isEqualTo: date)
//         .get()
//         .then((value) {
//       invoiceList.clear();
//       // // ignore: avoid_print
//       // print(value.docs);
//       // // ignore: avoid_print
//       // print('0000000000000000000000000000000');
//       for (var i in value.docs) {
//         invoiceList.add(FirebaseInvoiceModel.fromMap(i));
//       }
//       update();
//     });
//   }

// //=========================================\\
//   MyDataBase db = MyDataBase();
//   List<CustomerModel> mylist = [];
//   List<String> afterList = [];
//   CollectionReference customersRef =
//       FirebaseFirestore.instance.collection('customers');
//   Future<void> getCustomersDate() async {
//     List myList = await db.getAllCustomers();

//     if (myList.isEmpty) {
//       await customersRef.get().then((value) async {
//         for (var i in value.docs) {
//           await db.addCustomers(CustomerModel.fromMap(i));
//         }
//       });
//     }
//     update();
//   }

//   Future<void> getCustomerData() async {
//     List myList = await db.getAllCustomers();
//     for (var i in myList) {
//       mylist.add(CustomerModel.fromMap(i));
//     }
//     for (int i = 0; i < mylist.length; i++) {
//       afterList.add(mylist[i].custName);
//     }
//     update();
//   }

//   void passData(String id) {
//     intailData = id;
//   }

//   String? intailData;
//   oncganged(String? val) {
//     intailData = val.toString();
//     update();
//   }
//   //end

//   //get items data
//   //start
//   List<ItemModel> itemList = [];
//   List<ItemModel> selectedList = [];

//   CollectionReference itemsRef =
//       FirebaseFirestore.instance.collection('products');
//   Future<void> getItemData() async {
//     List myList = await db.getAllItem();
//     if (myList.isEmpty) {
//       await itemsRef
//           .where(
//             'companyName',
//             isEqualTo: sharedpref!.getString('company'),
//           )
//           .get()
//           .then((value) async {
//         for (var i in value.docs) {
//           db.addProducts(ItemModel.fromMap(i));
//         }
//       });
//     }

//     update();
//   }

//   Future<void> getProductsData() async {
//     List myList = await db.getAllItem();
//     for (var i in myList) {
//       itemList.add(ItemModel.fromMap(i));
//     }
//     update();
//   }

//   //=========================================\\
//   List<ItemSqlmodel> items = [];
//   void moveData(List list) {
//     items.clear();
//     for (var i in list) {
//       items.add(ItemSqlmodel.fromMap(i));
//     }
//     // ignore: avoid_print
//     print(list);
//   }

//   void removeItem(var i) {
//     items.remove(i);
//     update();
//   }

//   final TextEditingController qCont = TextEditingController();
//   void editQuntity(ItemSqlmodel item, int index, int i) {
//     items.remove(items[index]);
//     items.insert(
//       index,
//       ItemSqlmodel(
//         invoiceId: item.invoiceId,
//         itemId: item.itemId,
//         name: item.name,
//         price: item.price,
//         unit: item.unit,
//         quntity: i,
//       ),
//     );

//     update();
//     // ignore: avoid_print
//     print(items[index].toMap());
//   }

//   @override
//   void onInit() async {
//     await getCustomersDate();
//     await getCustomerData();
//     await getProductsData();
//     await getItemData();
//     super.onInit();
//   }
// }
