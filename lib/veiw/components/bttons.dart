import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.9,
        height: Get.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.02,
          ),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor.withOpacity(0.35),
            AppColors.primaryColor.withOpacity(0.28)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.05,
          fw: FontWeight.w700,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton2 extends StatelessWidget {
  CustomButton2({
    required this.color,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.width * 0.22,
      height: Get.width * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.02,
          ),
          color: color),
      child: AppText(
        txt: txt,
        size: Get.width * 0.05,
        fw: FontWeight.w700,
        color: AppColors.backgroundColor,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton3 extends StatelessWidget {
  CustomButton3({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.8,
        height: Get.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.02,
          ),
          gradient: LinearGradient(colors: [
            AppColors.seconrayColor,
            AppColors.primaryColor.withOpacity(0.8),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.043,
          fw: FontWeight.w700,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
