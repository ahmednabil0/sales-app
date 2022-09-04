import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/models/online_invoice_model.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';

// ignore: must_be_immutable
class EditInvoiceDetailsVeiw extends StatelessWidget {
  EditInvoiceDetailsVeiw({required this.controller, super.key});
  FirebaseInvoiceModel controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.042),
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration:
                  BoxDecoration(color: AppColors.backgroundColor, boxShadow: [
                BoxShadow(
                    color: AppColors.fontColor.withOpacity(0.42),
                    blurRadius: 5,
                    offset: const Offset(1, 1)),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
