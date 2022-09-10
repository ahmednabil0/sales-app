import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/invoice_component/drob_down.dart';
import 'package:new_app/veiw/components/invoice_component/invoice_module.dart';
import 'package:new_app/veiw/components/invoice_component/summery_invoice.dart';
import 'package:new_app/veiw/components/spaces.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/sceans/home/returns-invoices/add_items.dart';
import 'package:new_app/veiw_model/reyurns_invoice/return_invoice_view_model.dart';

class CreateReturnsVeiw extends GetWidget<ReturnIvoiceVeiwModel> {
  CreateReturnsVeiw({super.key});
  @override
  final controller = Get.put(ReturnIvoiceVeiwModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildAppBar(txt: '61'.tr),
                buildHeightSpace(0.015),
                SizedBox(
                  width: Get.width * 0.85,
                  child: Form(
                    key: _key,
                    child: GetBuilder<ReturnIvoiceVeiwModel>(
                      builder: (controller) => buildDrobDownRetun(
                        controller: controller,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                SizedBox(
                  width: Get.width * 0.85,
                  child: TxtFrmFeild.buildDateTxtForm(
                      controller: controller.dateCont),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                CustomButton4(
                  ontap: () {
                    controller.clear();
                    Get.to(() => AddItemVeiwReturns());
                  },
                  txt: '21'.tr,
                ),
                buildReturns(),

                SizedBox(
                  height: Get.width * 0.01,
                ),
                //summery
                //start
                buildSummeryReturns(),
                //end
                SizedBox(
                  height: Get.width * 0.01,
                ),

                SizedBox(
                  height: Get.width * 0.025,
                ),
                CustomButton3(
                  ontap: () async {
                    if (_key.currentState!.validate()) {
                      controller.showCircular();
                      await controller.uploadInvoice();
                      await controller.getAll();
                    }
                  },
                  txt: '37'.tr,
                ),
                SizedBox(
                  height: Get.width * 0.015,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
