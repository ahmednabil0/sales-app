import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/app_bar.dart';
import '../../../components/back_ground.dart';
import '../../../components/invoice_component/get_items.dart';
import '../../../components/invoice_component/item_header.dart';
import '../../../components/txt_frm_feilds/txt_forms.dart';
import '../../../../veiw_model/invoces/create_invoice_veiw_model.dart';

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
