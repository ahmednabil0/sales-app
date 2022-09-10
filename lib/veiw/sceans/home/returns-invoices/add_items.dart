import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/invoice_component/get_items.dart';
import 'package:new_app/veiw/components/invoice_component/item_header.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw_model/reyurns_invoice/return_invoice_view_model.dart';

// ignore: must_be_immutable
class AddItemVeiwReturns extends GetWidget<ReturnIvoiceVeiwModel> {
  AddItemVeiwReturns({super.key});
  @override
  final controller = Get.put(ReturnIvoiceVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Column(
          children: [
            buildAppBar(txt: '21'.tr),
            buildItemHeader(),
            Expanded(
              child: SizedBox(
                child: buildGetItemsRE(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TxtFrmFeild.buildQVatTxtForm(
                  controller: controller.vatCont,
                ),
              ],
            ),
            SizedBox(
              height: Get.width * 0.03,
            ),
            buildItemHeaderRe(controller),
          ],
        ),
      )),
    );
  }
}
