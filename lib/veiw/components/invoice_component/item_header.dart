import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';

Padding buildItemHeader() {
  return Padding(
    padding: EdgeInsets.all(Get.width * 0.04),
    child: Container(
      height: Get.width * 0.13,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Get.width * 0.07),
          topRight: Radius.circular(Get.width * 0.07),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            txt: '22'.tr,
            size: Get.width * 0.05,
            fw: FontWeight.bold,
            color: AppColors.backgroundColor,
          )
        ],
      ),
    ),
  );
}

Container buildItemHeaderTwo() {
  return Container(
    height: Get.width * 0.1,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        AppColors.seconrayColor.withOpacity(0.8),
        AppColors.seconrayColor
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Get.width * 0.07),
        topRight: Radius.circular(Get.width * 0.07),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppText(
          txt: '24'.tr,
          size: Get.width * 0.04,
          fw: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
        AppText(
          txt: '25'.tr,
          size: Get.width * 0.04,
          fw: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
        AppText(
          txt: '26'.tr,
          size: Get.width * 0.04,
          fw: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
        AppText(
          txt: '27'.tr,
          size: Get.width * 0.04,
          fw: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
      ],
    ),
  );
}

InkWell buildItemHeaderthr(InvoiceVeiwModel controller) {
  return InkWell(
    onTap: () {
      controller.calTotal();
      Get.back();
    },
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04, vertical: 1),
      child: Container(
        height: Get.width * 0.13,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Get.width * 0.07),
            bottomRight: Radius.circular(Get.width * 0.07),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '28'.tr,
              size: Get.width * 0.05,
              fw: FontWeight.bold,
              color: AppColors.backgroundColor,
            )
          ],
        ),
      ),
    ),
  );
}
