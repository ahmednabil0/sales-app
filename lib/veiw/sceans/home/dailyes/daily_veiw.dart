import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../components/app_bar.dart';
import '../../../components/back_ground.dart';
import '../../../components/bttons.dart';
import 'close_veiw.dart';

class DailyVeiw extends StatelessWidget {
  const DailyVeiw({super.key});
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
            buildAppBar(txt: '11'.tr),
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
                  Get.to(() => CloseDailyVeiw());
                },
                txt: '63'.tr),
            SizedBox(
              height: Get.width * 0.025,
            ),
            // CustomButton3(
            //   ontap: () {
            //     // Get.to(
            //     //   () => null,
            //     // );
            //   },
            //   txt: '64'.tr,
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
