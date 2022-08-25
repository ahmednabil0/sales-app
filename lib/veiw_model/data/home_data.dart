import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/models/home_card_model.dart';
import 'package:new_app/veiw/sceans/home/invoice/invoice.dart';

class Homedata {
  static List<HomeCardModel> homeList = [
    HomeCardModel(
        type: '11'.tr, ontap: () {}, icon: Icons.backup_table_outlined),
    HomeCardModel(
        type: '12'.tr,
        ontap: () {
          Get.to(() => const InvoiceVeiw());
        },
        icon: Icons.backup_table_outlined),
    HomeCardModel(
        type: '13'.tr, ontap: () {}, icon: Icons.backup_table_outlined),
    HomeCardModel(
        type: '14'.tr, ontap: () {}, icon: Icons.backup_table_outlined),
    HomeCardModel(
        type: '15'.tr, ontap: () {}, icon: Icons.backup_table_outlined),
    HomeCardModel(
        type: '16'.tr, ontap: () {}, icon: Icons.backup_table_outlined),
  ];
}
