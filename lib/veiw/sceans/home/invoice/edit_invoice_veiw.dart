import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw/sceans/home/invoice/more_details_veiw.dart';
import 'package:new_app/veiw_model/invoces/edit_veiw_model.dart';

class EditInvoiceVeiw extends GetWidget<EditViewModel> {
  EditInvoiceVeiw({super.key});
  @override
  final controller = Get.put(EditViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: Column(
            children: [
              buildAppBar(
                txt: '18'.tr,
              ),
              SizedBox(
                height: Get.width * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: Get.width * 0.04,
                  ),
                  CustomButton16(
                    icon: Icons.search_rounded,
                    ontap: () {
                      controller.getData(controller.dateCont.text.trim());
                    },
                    txt: '',
                  ),
                  SizedBox(
                    width: Get.width * 0.04,
                  ),
                  Expanded(
                    flex: 2,
                    child: controller.buildDateTxtFormCust(context),
                  ),
                  SizedBox(
                    width: Get.width * 0.04,
                  ),
                ],
              ),
              Expanded(
                child: GetBuilder<EditViewModel>(
                  builder: (controller) => controller.invoiceList.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          padding: EdgeInsets.all(Get.width * 0.04),
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.invoiceList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: Get.width * 0.05),
                              child: Container(
                                width: Get.width * 0.9,
                                height: Get.width * 0.4,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: AppColors.primaryColor),
                                  borderRadius:
                                      BorderRadius.circular(Get.width * 0.07),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                          txt: '41'.tr,
                                          size: Get.width * 0.045,
                                          fw: FontWeight.w800,
                                          color: AppColors.primaryColor,
                                        ),
                                        AppText(
                                          txt:
                                              ' ${controller.invoiceList[index].id} #',
                                          size: Get.width * 0.045,
                                          fw: FontWeight.w800,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 2,
                                      height: 2,
                                      color: AppColors.primaryColor,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AppText(
                                          txt: '42'.tr,
                                          size: Get.width * 0.04,
                                          fw: FontWeight.w800,
                                          color: AppColors.primaryColor,
                                        ),
                                        AppText(
                                          txt: controller
                                              .invoiceList[index].customerName,
                                          size: Get.width * 0.04,
                                          fw: FontWeight.w800,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AppText(
                                          txt: '43'.tr,
                                          size: Get.width * 0.04,
                                          fw: FontWeight.w800,
                                          color: AppColors.primaryColor,
                                        ),
                                        AppText(
                                          txt: controller
                                              .invoiceList[index].date,
                                          size: Get.width * 0.04,
                                          fw: FontWeight.w800,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AppText(
                                          txt: '44'.tr,
                                          size: Get.width * 0.04,
                                          fw: FontWeight.w800,
                                          color: AppColors.primaryColor,
                                        ),
                                        AppText(
                                          txt: controller
                                              .invoiceList[index].total
                                              .toString(),
                                          size: Get.width * 0.04,
                                          fw: FontWeight.w800,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    CustomButton9(
                                        ontap: () {
                                          Get.to(
                                            () => EditInvoiceDetailsVeiw(
                                              controller:
                                                  controller.invoiceList[index],
                                            ),
                                          );
                                        },
                                        txt: '45'.tr)
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
