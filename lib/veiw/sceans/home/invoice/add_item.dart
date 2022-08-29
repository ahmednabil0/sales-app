import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/invoice_component/get_items.dart';
import 'package:new_app/veiw/components/invoice_component/item_header.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';

// ignore: must_be_immutable
class AddItemVeiw extends GetWidget<InvoiceVeiwModel> {
  AddItemVeiw({super.key});
  @override
  final controller = Get.put(InvoiceVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Column(
          children: [
            buildAppBar2(txt: '21'.tr, controller: controller),
            buildItemHeader(),
            Expanded(
              child: SizedBox(
                child: buildGetItems(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TxtFrmFeild.buildDeliveryTxtForm(
                  controller: controller.deliveryCont,
                ),
                TxtFrmFeild.buildQVatTxtForm(
                  controller: controller.vatCont,
                ),
              ],
            ),
            SizedBox(
              height: Get.width * 0.03,
            ),
            buildItemHeaderthr(controller),
          ],
        ),
      )),
    );
  }
}
