import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/invoice_component/drob_down.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/sceans/home/invoice/add_item.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';

class CreateInvoice extends GetWidget<InvoiceVeiwModel> {
  CreateInvoice({super.key}) {
    DateTime date = DateTime.now();
    String dateTime = Jiffy(date).format("yyyy/mm/dd");
    dateCont.text = dateTime;
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
                  child: TxtFrmFeild.buildDateTxtForm(controller: dateCont),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                CustomButton4(
                    ontap: () {
                      controller.clear();
                      Get.to(() => AddItemVeiw());
                    },
                    txt: '21'.tr)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
