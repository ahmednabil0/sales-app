import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/invoice_component/edit_invoice_card.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';

class AddInvoiceRent extends StatelessWidget {
  const AddInvoiceRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.9,
              child: buildinvoiceCard(),
            ),
          ],
        ),
      )),
    );
  }
}
