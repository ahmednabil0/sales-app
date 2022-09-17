import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../components/app_bar.dart';
import '../../../components/back_ground.dart';
import '../../../components/bttons.dart';
import 'create_return_veiw.dart';
import '../../../../veiw_model/reyurns_invoice/return_invoice_view_model.dart';

class ReturnInvoiceVeiw extends GetWidget<ReturnIvoiceVeiwModel> {
  ReturnInvoiceVeiw({super.key});
  @override
  final controller = Get.put(ReturnIvoiceVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Get.width * 0.01,
            ),
            buildAppBar(txt: '14'.tr),
            SizedBox(
              height: Get.width * 0.253,
            ),
            SvgPicture.asset(
              'assets/svg/print_invoic.svg',
              height: Get.width * 0.4,
            ),
            SizedBox(
              height: Get.width * 0.2,
            ),
            CustomButton3(
                ontap: () {
                  Get.to(() => CreateReturnsVeiw());
                },
                txt: '61'.tr),
            SizedBox(
              height: Get.width * 0.025,
            ),
            // CustomButton3(
            //   ontap: () {
            //     Get.to(
            //       () => null,
            //     );
            //   },
            //   txt: '62'.tr,
            // ),
            SizedBox(
              height: Get.width * 0.025,
            ),
          ],
        ),
      )),
    );
  }
}
