import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';

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
