import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_app/main.dart';
import 'package:new_app/models/invoice_model.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/invoice_component/drob_down.dart';
import 'package:new_app/veiw/components/invoice_component/invoice_module.dart';
import 'package:new_app/veiw/components/invoice_component/summery_invoice.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/sceans/home/invoice/add_item.dart';
import 'package:new_app/veiw/sceans/home/invoice/completed_veiw.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';

// ignore: must_be_immutable
class CreateInvoice extends GetWidget<InvoiceVeiwModel> {
  CreateInvoice({super.key}) {
    DateTime date = DateTime.now();
    dateTime = Jiffy(date).format("yyyy/MM/dd");
    DateTime due = DateTime.now().add(const Duration(days: 7));
    dueDate = Jiffy(due).format("yyyy/MM/dd");
    dateCont.text = dateTime!;
  }
  String? dateTime;
  String? dueDate;
  final TextEditingController dateCont = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
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
                  height: Get.width * 0.08,
                ),
                CustomButton3(
                  ontap: () async {
                    if (_key.currentState!.validate()) {
                      controller.showCircular();

                      int i = await controller.insertInvoice(
                        Invoice(
                          date: dateTime!,
                          dueDate: dueDate!,
                          total: controller.total,
                          customerName: controller.intailData!,
                          salesId: sharedpref!.getString('id')!,
                          company: sharedpref!.getString('company')!,
                        ),
                      );
                      await controller.addItemsDb(i);
                      // await controller.getAll();
                      controller.clearContent();
                      Get.off(() => const CompletedScrean());
                    }
                  },
                  txt: '37'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
