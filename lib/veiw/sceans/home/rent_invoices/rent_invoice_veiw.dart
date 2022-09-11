import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/invoice_component/drob_down.dart';
import 'package:new_app/veiw/components/spaces.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw/sceans/home/rent_invoices/add_invoice.dart';
import 'package:new_app/veiw_model/rent_invoices/rent_invoice_veiw_model.dart';

class RentInvoiceVeiw extends GetWidget<RentInvoiceViewModel> {
  RentInvoiceVeiw({super.key});
  @override
  final controller = Get.put(RentInvoiceViewModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<FormState> _key2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildAppBar(txt: '52'.tr),
                buildHeightSpace(0.04),
                Form(
                    key: _key,
                    child: Column(
                      children: [
                        GetBuilder<RentInvoiceViewModel>(
                            builder: (controller) =>
                                buildDrobDown3(controller: controller)),
                        buildHeightSpace(0.02),
                        controller.buildDateTxtFormCust(context),
                        buildHeightSpace(0.02),
                        CustomButton16(
                          icon: Icons.search_rounded,
                          ontap: () async {
                            if (_key.currentState!.validate()) {
                              await controller.getData(
                                controller.dateCont.text.trim(),
                                controller.intailData.toString(),
                              );
                              Get.to(() => const AddInvoiceRent());
                            }
                          },
                          txt: '',
                        ),
                        buildHeightSpace(0.02),
                        GetBuilder<RentInvoiceViewModel>(
                            builder: (controller) => controller
                                    .confirmInvoiceList.isEmpty
                                ? const SizedBox()
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.width * 0.05),
                                    child: Container(
                                      width: Get.width * 0.9,
                                      height: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2,
                                            color: AppColors.primaryColor),
                                        borderRadius: BorderRadius.circular(
                                            Get.width * 0.07),
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
                                                    ' ${controller.confirmInvoiceList[0].id} #',
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
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: AppColors.primaryColor,
                                              ),
                                              AppText(
                                                txt: controller
                                                    .confirmInvoiceList[0]
                                                    .customerName,
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: Colors.red,
                                              ),
                                              AppText(
                                                txt: '48'.tr,
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: AppColors.primaryColor,
                                              ),
                                              AppText(
                                                txt: controller
                                                    .confirmInvoiceList[0]
                                                    .company,
                                                size: Get.width * 0.035,
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
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: AppColors.primaryColor,
                                              ),
                                              AppText(
                                                txt: controller
                                                    .confirmInvoiceList[0].date,
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: Colors.red,
                                              ),
                                              AppText(
                                                txt: '49'.tr,
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: AppColors.primaryColor,
                                              ),
                                              AppText(
                                                txt: controller
                                                    .confirmInvoiceList[0]
                                                    .dueDate,
                                                size: Get.width * 0.035,
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
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: AppColors.primaryColor,
                                              ),
                                              AppText(
                                                txt: controller
                                                    .confirmInvoiceList[0].total
                                                    .toStringAsFixed(2),
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: Colors.red,
                                              ),
                                              AppText(
                                                txt: '50'.tr,
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: AppColors.primaryColor,
                                              ),
                                              AppText(
                                                txt: controller
                                                    .confirmInvoiceList[0].payed
                                                    .toStringAsFixed(2),
                                                size: Get.width * 0.035,
                                                fw: FontWeight.w800,
                                                color: Colors.red,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                      ],
                    )),
                GetBuilder<RentInvoiceViewModel>(
                  builder: (controller) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt: '   ${'46'.tr} :  ',
                            size: Get.width * 0.04,
                            fw: FontWeight.w800,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: Get.width * 0.4,
                            child: TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              controller: controller.payedCont,
                              decoration: InputDecoration(hintText: '46'.tr),
                            ),
                          ),
                        ],
                      ),
                      buildHeightSpace(0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt: '   ${'47'.tr} :  ',
                            size: Get.width * 0.04,
                            fw: FontWeight.w800,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: Get.width * 0.41,
                            child: TextFormField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              controller: controller.rentCont,
                              decoration: InputDecoration(hintText: '47'.tr),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                buildHeightSpace(0.04),
                Form(
                  key: _key2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        txt: '   ${'58'.tr} :  ',
                        size: Get.width * 0.035,
                        fw: FontWeight.w800,
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'\d*\.?\d*'))
                          ],
                          controller: controller.willPayCont,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '60'.tr;
                            }
                            if (controller.confirmInvoiceList.isEmpty) {
                              return 'قم باختيار فاتورة ';
                            }
                            if (double.parse(
                                    controller.willPayCont.text.trim()) >
                                controller.confirmInvoiceList[0].rent) {
                              return 'big amount';
                            }

                            return null;
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(hintText: '59'.tr),
                        ),
                      ),
                    ],
                  ),
                ),
                buildHeightSpace(0.08),
                CustomButton3(
                  ontap: () {
                    if (_key2.currentState!.validate()) {
                      controller.addMoney(
                        controller.confirmInvoiceList[0],
                      );
                    }
                  },
                  txt: '28'.tr,
                ),
                buildHeightSpace(0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
