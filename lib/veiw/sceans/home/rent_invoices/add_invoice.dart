import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/invoice_component/edit_invoice_card.dart';

class AddInvoiceRent extends StatelessWidget {
  const AddInvoiceRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Column(
          children: [
            buildAppBar(txt: '12'.tr),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.8,
                  child: buildinvoiceCard(),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
