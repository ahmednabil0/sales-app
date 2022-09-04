import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_app/main.dart';
import 'package:new_app/models/online_invoice_model.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';

class EditViewModel extends GetxController {
  final TextEditingController dateCont = TextEditingController();

  SizedBox buildDateTxtFormCust(context) {
    return SizedBox(
      width: Get.width * 0.9,
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
  Future<void> getData(String date) async {
    await invoicesRef
        .where('salesId', isEqualTo: sharedpref!.getString('id'))
        .where('company', isEqualTo: sharedpref!.getString('company'))
        .where('date', isEqualTo: date)
        .get()
        .then((value) {
      invoiceList.clear();
      // ignore: avoid_print
      print(value.docs);
      // ignore: avoid_print
      print('0000000000000000000000000000000');
      for (var i in value.docs) {
        invoiceList.add(FirebaseInvoiceModel.fromMap(i));
      }
      update();
    });
  }
}
