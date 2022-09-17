import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../veiw_model/invoces/create_invoice_veiw_model.dart';
import '../helper/consts/colors.dart';
import 'custom_text.dart';

Row buildAppBar({
  required String txt,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
          size: Get.width * 0.08,
        ),
      ),
      AppText(
        txt: txt,
        size: Get.width * 0.05,
        fw: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      Icon(
        Icons.home_rounded,
        color: AppColors.primaryColor,
        size: Get.width * 0.08,
      ),
    ],
  );
}

Row buildAppBar2({required String txt, required InvoiceVeiwModel controller}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          controller.clear();
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
          size: Get.width * 0.08,
        ),
      ),
      AppText(
        txt: txt,
        size: Get.width * 0.05,
        fw: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      Icon(
        Icons.home_rounded,
        color: AppColors.primaryColor,
        size: Get.width * 0.08,
      ),
    ],
  );
}
