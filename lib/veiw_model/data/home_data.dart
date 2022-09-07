import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/models/home_card_model.dart';
import 'package:new_app/veiw/sceans/home/invoice/invoice.dart';
import 'package:new_app/veiw/sceans/home/rent_invoices/rent_invoice_veiw.dart';

class Homedata {
  static List<HomeCardModel> homeList = [
    HomeCardModel(
        type: '11'.tr, ontap: () {}, icon: Icons.backup_table_outlined),
    HomeCardModel(
        type: '12'.tr,
        ontap: () {
          Get.to(() => InvoiceVeiw());
        },
        icon: Icons.inventory_outlined),
    HomeCardModel(
        type: '13'.tr,
        ontap: () {
          Get.to(() => RentInvoiceVeiw());
        },
        icon: Icons.move_to_inbox_sharp),
    HomeCardModel(type: '14'.tr, ontap: () {}, icon: Icons.backup_outlined),
    HomeCardModel(
        type: '15'.tr, ontap: () {}, icon: Icons.content_paste_go_outlined),
    HomeCardModel(
        type: '16'.tr, ontap: () {}, icon: Icons.check_circle_outlined),
  ];
}
