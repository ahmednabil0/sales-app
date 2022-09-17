import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/consts/colors.dart';

Container createBackGround({required Widget child}) {
  return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.seconrayColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: child);
}

Container createBackGroundHome({required Widget child}) {
  return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.grey.shade100.withBlue(255),
          Colors.grey.shade100.withBlue(240)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: child);
}
