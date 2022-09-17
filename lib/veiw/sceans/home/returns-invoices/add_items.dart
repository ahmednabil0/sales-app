import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../veiw_model/reyurns_invoice/return_invoice_view_model.dart';
import '../../../components/app_bar.dart';
import '../../../components/back_ground.dart';
import '../../../components/invoice_component/get_items.dart';
import '../../../components/invoice_component/item_header.dart';
import '../../../components/txt_frm_feilds/txt_forms.dart';

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
