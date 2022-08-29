import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/invoice_component/drob_down.dart';
import 'package:new_app/veiw/components/invoice_component/invoice_module.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw/sceans/home/invoice/add_item.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';

class CreateInvoice extends GetWidget<InvoiceVeiwModel> {
  CreateInvoice({super.key}) {
    DateTime date = DateTime.now();
    String dateTime = Jiffy(date).format("yyyy/MM/dd");
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
                  txt: '21'.tr,
                ),
                buildInvoce(),

                SizedBox(
                  height: Get.width * 0.01,
                ), //summery
                //start
                GetBuilder<InvoiceVeiwModel>(
                  builder: (controller) => Container(
                    height: Get.width * 0.355,
                    width: Get.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Get.width * 0.05,
                      ),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1.5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              txt: '32'.tr,
                              size: Get.width * 0.05,
                              fw: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        const Divider(
                          color: AppColors.primaryColor,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              txt: '${'33'.tr} : ',
                              size: Get.width * 0.04,
                              fw: FontWeight.bold,
                              color: AppColors.fontColor,
                            ),
                            AppText(
                              txt: controller.vatCont.text,
                              size: Get.width * 0.04,
                              fw: FontWeight.bold,
                              color: AppColors.fontColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              txt: '${'35'.tr}  : ',
                              size: Get.width * 0.04,
                              fw: FontWeight.bold,
                              color: AppColors.fontColor,
                            ),
                            AppText(
                              txt: controller.deliveryCont.text,
                              size: Get.width * 0.04,
                              fw: FontWeight.bold,
                              color: AppColors.fontColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              txt: '   ${'34'.tr}       : ',
                              size: Get.width * 0.04,
                              fw: FontWeight.bold,
                              color: AppColors.fontColor,
                            ),
                            AppText(
                              txt: controller.total.toString(),
                              size: Get.width * 0.04,
                              fw: FontWeight.bold,
                              color: AppColors.fontColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                //end
              ],
            ),
          ),
        ),
      ),
    );
  }
}
