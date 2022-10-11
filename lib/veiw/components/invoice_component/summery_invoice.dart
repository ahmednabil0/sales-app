import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/invoces/create_invoice_veiw_model.dart';
import '../../../veiw_model/reyurns_invoice/return_invoice_view_model.dart';
import '../../helper/consts/colors.dart';
import '../custom_text.dart';

GetBuilder<InvoiceVeiwModel> buildSummeryinvoice() {
  return GetBuilder<InvoiceVeiwModel>(
    builder: (controller) => Container(
      height: Get.width * 0.34,
      width: Get.width * 0.87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Get.width * 0.05,
        ),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                txt: '32'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.w900,
                color: Colors.red,
              ),
            ],
          ),
          const Divider(
            color: AppColors.primaryColor,
            thickness: 1,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      txt: '${'33'.tr} : ',
                      size: Get.width * 0.03,
                      fw: FontWeight.bold,
                      color: AppColors.fontColor,
                    ),
                    AppText(
                      txt: controller.vatCont.text,
                      size: Get.width * 0.03,
                      fw: FontWeight.bold,
                      color: AppColors.fontColor,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      txt: '${'35'.tr} : ',
                      size: Get.width * 0.03,
                      fw: FontWeight.bold,
                      color: AppColors.fontColor,
                    ),
                    AppText(
                      txt: controller.deliveryCont.text,
                      size: Get.width * 0.03,
                      fw: FontWeight.bold,
                      color: AppColors.fontColor,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      txt: '${'34'.tr} : ',
                      size: Get.width * 0.03,
                      fw: FontWeight.bold,
                      color: AppColors.fontColor,
                    ),
                    AppText(
                      txt: controller.total.toString(),
                      size: Get.width * 0.03,
                      fw: FontWeight.bold,
                      color: AppColors.fontColor,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

GetBuilder<ReturnIvoiceVeiwModel> buildSummeryReturns() {
  return GetBuilder<ReturnIvoiceVeiwModel>(
    builder: (controller) => Container(
      height: Get.width * 0.28,
      width: Get.width * 0.87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Get.width * 0.05,
        ),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                txt: '32'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.w900,
                color: Colors.red,
              ),
            ],
          ),
          const Divider(
            color: AppColors.primaryColor,
            thickness: 1,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      txt: '${'34'.tr} : ',
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
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
