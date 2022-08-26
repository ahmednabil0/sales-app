import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/drob_down.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';

class CreateInvoice extends GetWidget<InvoiceVeiwModel> {
  CreateInvoice({super.key}) {
    DateTime date = DateTime.now();
    dateCont.text = '${date.year}/${date.month}/${date.day}';
  }
  final TextEditingController dateCont = TextEditingController();
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
                  child: buildDrobDown(controller: controller),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                SizedBox(
                    width: Get.width * 0.85,
                    child: TxtFrmFeild.buildDateTxtForm(controller: dateCont))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
