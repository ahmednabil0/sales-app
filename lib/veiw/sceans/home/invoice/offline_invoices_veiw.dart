import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/invoice_component/oflfine_invoces.dart';
import 'package:new_app/veiw_model/invoces/offline_invoices.dart';

class OfflineInvoicesVeiw extends GetWidget<OffLineInvoices> {
  OfflineInvoicesVeiw({super.key});
  @override
  final controller = Get.put(OffLineInvoices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: Column(
            children: [
              buildAppBar(txt: 'الفواتير المعلقة'),
              Expanded(
                child: buildOflineInvoices(),
              ),
              CustomButton3(ontap: () {}, txt: 'ارسال الفواتير المعلقة'),
              SizedBox(
                height: Get.width * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
