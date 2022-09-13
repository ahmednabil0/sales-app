import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/invoice_component/drob_down.dart';
import 'package:new_app/veiw/components/spaces.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw/sceans/home/quntities_convert/add_items.dart';
import 'package:new_app/veiw_model/quantites_veiw_model/quantities_veiw_model.dart';

class AplicantQuantityVeiw extends GetWidget<QuantitiesVeiwModel> {
  AplicantQuantityVeiw({super.key});
  @override
  final controller = Get.put(QuantitiesVeiwModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildAppBar(txt: '15'.tr),
                buildHeightSpace(0.1),
                SvgPicture.asset(
                  'assets/svg/invoice.svg',
                  height: Get.width * 0.4,
                ),
                buildHeightSpace(0.08),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            txt: '70'.tr,
                            size: Get.width * 0.05,
                            fw: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                          GetBuilder<QuantitiesVeiwModel>(
                            builder: (controller) => buildDrobDownBranshes(
                              controller: controller,
                            ),
                          )
                        ],
                      ),
                      buildHeightSpace(0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            txt: '71'.tr,
                            size: Get.width * 0.05,
                            fw: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                          GetBuilder<QuantitiesVeiwModel>(
                            builder: (controller) => buildDrobDownBranshes2(
                              controller: controller,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                buildHeightSpace(0.07),
                CustomButton4(
                  ontap: () {
                    Get.to(() => AddItemToBr());
                  },
                  txt: '21'.tr,
                ),
                GetBuilder<QuantitiesVeiwModel>(
                  builder: (controller) => Container(
                    margin: EdgeInsets.all(Get.width * 0.03),
                    height: Get.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Get.width * 0.02),
                        border: Border.all(width: Get.width * 0.005)),
                    child: ListView.builder(
                      itemCount: controller.selectedList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppText(
                              txt:
                                  '${'24'.tr} : ${controller.selectedList[index].name}',
                              size: Get.width * 0.045,
                              fw: FontWeight.bold,
                              color: index.isOdd
                                  ? AppColors.primaryColor
                                  : AppColors.seconrayColor,
                            ),
                            AppText(
                              txt:
                                  '${'23'.tr} : ${controller.selectedList[index].quntity}',
                              size: Get.width * 0.045,
                              fw: FontWeight.bold,
                              color: index.isOdd
                                  ? AppColors.primaryColor
                                  : AppColors.seconrayColor,
                            ),
                            AppText(
                              txt:
                                  '${'27'.tr} : ${controller.selectedList[index].unit}',
                              size: Get.width * 0.045,
                              fw: FontWeight.bold,
                              color: index.isOdd
                                  ? AppColors.primaryColor
                                  : AppColors.seconrayColor,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                CustomButton3(
                    ontap: () async {
                      if (_key.currentState!.validate()) {
                        await controller.sendData();
                      }
                    },
                    txt: '28'.tr)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
