import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/sceans/home/invoice/create_invoice.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';

class InvoiceVeiw extends GetWidget<InvoiceVeiwModel> {
  InvoiceVeiw({super.key});
  @override
  final controller = Get.put(InvoiceVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Get.width * 0.01,
            ),
            buildAppBar(txt: '12'.tr),
            SizedBox(
              height: Get.width * 0.253,
            ),
            SvgPicture.asset(
              'assets/svg/print_invoic.svg',
              height: Get.width * 0.4,
            ),
            SizedBox(
              height: Get.width * 0.2,
            ),
            CustomButton3(
                ontap: () {
                  Get.to(() => CreateInvoice());
                },
                txt: '17'.tr),
            SizedBox(
              height: Get.width * 0.025,
            ),
            CustomButton3(ontap: () {}, txt: '18'.tr),
            SizedBox(
              height: Get.width * 0.025,
            ),
            CustomButton3(ontap: () {}, txt: '19'.tr),
          ],
        ),
      )),
    );
  }
}
