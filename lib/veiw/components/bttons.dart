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
class CustomButton4 extends StatelessWidget {
  CustomButton4({
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
        width: Get.width * 0.85,
        height: Get.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.02,
          ),
          gradient: LinearGradient(
              colors: [Colors.grey.shade600, Colors.grey.shade400],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.055,
          fw: FontWeight.bold,
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

// ignore: must_be_immutable
class CustomButton5 extends StatelessWidget {
  CustomButton5({
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
        width: Get.width * 0.15,
        height: Get.width * 0.1,
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
          size: Get.width * 0.035,
          fw: FontWeight.w700,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton6 extends StatelessWidget {
  CustomButton6({
    required this.icon,
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          width: Get.width * 0.12,
          height: Get.width * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Get.width * 0.02,
            ),
            gradient: LinearGradient(colors: [
              AppColors.primaryColor.withOpacity(0.35),
              AppColors.primaryColor.withOpacity(0.28)
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          child: Icon(
            icon,
            color: AppColors.backgroundColor,
          )),
    );
  }
}

// ignore: must_be_immutable
class CustomButton7 extends StatelessWidget {
  CustomButton7({
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
        width: Get.width * 0.912,
        height: Get.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Get.width * 0.07),
            bottomRight: Radius.circular(Get.width * 0.07),
          ),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.78)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.05,
          fw: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton8 extends StatelessWidget {
  CustomButton8({
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
        width: Get.width * 0.16,
        height: Get.width * 0.09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.78)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.04,
          fw: FontWeight.w900,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton9 extends StatelessWidget {
  CustomButton9({
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
        width: Get.width * 0.97,
        height: Get.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Get.width * 0.05),
            bottomRight: Radius.circular(Get.width * 0.05),
          ),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.78)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.05,
          fw: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
