import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/models/items_model.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';
import 'package:new_app/veiw_model/reyurns_invoice/return_invoice_view_model.dart';

Padding buildInvoce() {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Get.width * 0.073,
      vertical: Get.width * 0.03,
    ),
    child: Container(
      height: Get.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Get.width * 0.05,
        ),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                txt: '24'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              AppText(
                txt: '25'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              AppText(
                txt: '26'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              AppText(
                txt: '27'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              AppText(
                txt: '23'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          const Divider(
            color: AppColors.primaryColor,
            thickness: 1,
          ),
          Expanded(
            child: GetBuilder<InvoiceVeiwModel>(
              builder: (controller) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.selectedList.length,
                itemBuilder: (BuildContext context, int index) {
                  ItemModel i = controller.selectedList[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            txt: i.name,
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i.price.toString(),
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i.vat.toString(),
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i.unit,
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i.quntity.toString(),
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.primaryColor,
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Padding buildReturns() {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Get.width * 0.073,
      vertical: Get.width * 0.03,
    ),
    child: Container(
      height: Get.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Get.width * 0.05,
        ),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                txt: '24'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              AppText(
                txt: '25'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              AppText(
                txt: '26'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              AppText(
                txt: '27'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              AppText(
                txt: '23'.tr,
                size: Get.width * 0.045,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          const Divider(
            color: AppColors.primaryColor,
            thickness: 1,
          ),
          Expanded(
            child: GetBuilder<ReturnIvoiceVeiwModel>(
              builder: (controller) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.selectedList.length,
                itemBuilder: (BuildContext context, int index) {
                  ItemModel i = controller.selectedList[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            txt: i.name,
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i.price.toString(),
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i.vat.toString(),
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i.unit,
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i.quntity.toString(),
                            size: Get.width * 0.045,
                            fw: FontWeight.w500,
                            color: AppColors.fontColor,
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.primaryColor,
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
