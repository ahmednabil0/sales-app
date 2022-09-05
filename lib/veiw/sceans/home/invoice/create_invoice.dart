import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/invoice_component/drob_down.dart';
import 'package:new_app/veiw/components/invoice_component/invoice_module.dart';
import 'package:new_app/veiw/components/invoice_component/summery_invoice.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/sceans/home/invoice/add_item.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';

// ignore: must_be_immutable
class CreateInvoice extends GetWidget<InvoiceVeiwModel> {
  CreateInvoice({super.key});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<FormState> _key2 = GlobalKey<FormState>();
  @override
  final controller = Get.put(InvoiceVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.width * 0.01,
                ),
                buildAppBar(txt: '17'.tr),
                SizedBox(
                  width: Get.width * 0.85,
                  child: Form(
                    key: _key,
                    child: buildDrobDown(
                      controller: controller,
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
                    Get.to(() => AddItemVeiw());
                  },
                  txt: '21'.tr,
                ),
                buildInvoce(),

                SizedBox(
                  height: Get.width * 0.01,
                ),
                //summery
                //start
                buildSummeryinvoice(),
                //end
                SizedBox(
                  height: Get.width * 0.01,
                ),
                Form(
                  key: _key2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TxtFrmFeild.buildPayedTxtForm(
                            cont: controller,
                            controller: controller.payedCont,
                          ),
                          GetBuilder<InvoiceVeiwModel>(
                            builder: (controller) =>
                                TxtFrmFeild.buildRentTxtForm(
                              controller: controller.rentCont,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.025,
                ),
                CustomButton3(
                  ontap: () async {
                    if (_key.currentState!.validate() &&
                        _key2.currentState!.validate()) {
                      controller.showCircular();
                      await controller.uploadInvoice();
                      await controller.getAll();
                      controller.rentCont.clear();
                      controller.payedCont.clear();
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
