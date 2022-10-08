import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/app_bar.dart';
import '../../../components/back_ground.dart';
import '../../../components/bttons.dart';
import '../../../components/custom_text.dart';
import '../../../components/spaces.dart';
import '../../../helper/consts/colors.dart';
import '../../../../veiw_model/dailyes/daily_veiw_model.dart';

class CloseDailyVeiw extends GetWidget<DailyVeiwModel> {
  CloseDailyVeiw({super.key});
  @override
  final controller = Get.put(DailyVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildAppBar(txt: '63'.tr),
                buildHeightSpace(0.01),
                Row(
                  children: [
                    buildWirthSpace(0.02),
                    AppText(
                      txt: '12'.tr,
                      size: Get.width * 0.05,
                      fw: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
                buildInvoiceCard(),
                buildHeightSpace(0.02),
                Row(
                  children: [
                    buildWirthSpace(0.02),
                    AppText(
                      txt: '13'.tr,
                      size: Get.width * 0.05,
                      fw: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ],
                ),
                buildRentCard(),
                buildHeightSpace(0.02),
                Row(
                  children: [
                    buildWirthSpace(0.02),
                    AppText(
                      txt: '14'.tr,
                      size: Get.width * 0.05,
                      fw: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
                buildReturnCard(),
                buildHeightSpace(0.12),
                Container(
                  height: Get.width * 0.1,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width * 0.065),
                    color: Colors.red.withOpacity(
                      0.9,
                    ),
                  ),
                  child: GetBuilder<DailyVeiwModel>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppText(
                          txt: '${'12'.tr} : ${controller.invoiceList.length}',
                          size: Get.width * 0.045,
                          fw: FontWeight.bold,
                          color: AppColors.backgroundColor,
                        ),
                        AppText(
                          txt: '${'13'.tr} : ${controller.rentsList.length}',
                          size: Get.width * 0.045,
                          fw: FontWeight.bold,
                          color: AppColors.backgroundColor,
                        ),
                        AppText(
                          txt: '${'14'.tr} : ${controller.returnsList.length}',
                          size: Get.width * 0.045,
                          fw: FontWeight.bold,
                          color: AppColors.backgroundColor,
                        ),
                      ],
                    ),
                  ),
                ),
                buildHeightSpace(0.02),
                CustomButton3(
                  ontap: () {
                    controller.closeDaily();
                  },
                  txt: '63'.tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildReturnCard() {
    return SizedBox(
      height: Get.width * 0.28,
      child: GetBuilder<DailyVeiwModel>(
        builder: (controller) => controller.returnsList.isEmpty
            ? Center(
                child: AppText(
                  txt: 'لا توجود مرتجعات حتي الان',
                  size: Get.width * 0.045,
                  fw: FontWeight.w800,
                  color: AppColors.primaryColor,
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.returnsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.width * 0.0),
                    child: Container(
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(Get.width * 0.07),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildWirthSpace(0.1),
                              const Spacer(),
                              AppText(
                                txt: '66'.tr,
                                size: Get.width * 0.045,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: ' ${controller.returnsList[index].id} #',
                                size: Get.width * 0.045,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              const Spacer(),
                              buildWirthSpace(0.05)
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            height: 2,
                            color: AppColors.primaryColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                txt: '42'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.returnsList[index].customer,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              AppText(
                                txt: '48'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.returnsList[index].company,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                txt: '67'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.returnsList[index].date,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              AppText(
                                txt: '50'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.returnsList[index].total
                                    .toStringAsFixed(2),
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                txt: '33'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              buildWirthSpace(0.03),
                              AppText(
                                txt: controller.returnsList[index].vat
                                    .toStringAsFixed(2),
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  SizedBox buildRentCard() {
    return SizedBox(
      height: Get.width * 0.28,
      child: GetBuilder<DailyVeiwModel>(
        builder: (controller) => controller.rentsList.isEmpty
            ? Center(
                child: AppText(
                  txt: 'لا توجود تحصيلات حتي الان',
                  size: Get.width * 0.045,
                  fw: FontWeight.w800,
                  color: AppColors.primaryColor,
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.rentsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.width * 0.0),
                    child: Container(
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(Get.width * 0.07),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildWirthSpace(0.1),
                              const Spacer(),
                              AppText(
                                txt: '65'.tr,
                                size: Get.width * 0.045,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: ' ${controller.rentsList[index].id} #',
                                size: Get.width * 0.045,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              const Spacer(),
                              buildWirthSpace(0.05)
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            height: 2,
                            color: AppColors.primaryColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                txt: '42'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.rentsList[index].customer,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              AppText(
                                txt: '48'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.rentsList[index].company,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                txt: '67'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.rentsList[index].date,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              AppText(
                                txt: '43'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.rentsList[index].invoiceDate,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                txt: '50'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.rentsList[index].payed
                                    .toStringAsFixed(2),
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              AppText(
                                txt: '68'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.rentsList[index].totalPayed
                                    .toStringAsFixed(2),
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  SizedBox buildInvoiceCard() {
    return SizedBox(
      height: Get.width * 0.28,
      child: GetBuilder<DailyVeiwModel>(
        builder: (controller) => controller.invoiceList.isEmpty
            ? Center(
                child: AppText(
                  txt: 'لا توجود فواتير حتي الان',
                  size: Get.width * 0.045,
                  fw: FontWeight.w800,
                  color: AppColors.primaryColor,
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.invoiceList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.width * 0.0),
                    child: Container(
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 2, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(Get.width * 0.04),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildWirthSpace(0.1),
                              const Spacer(),
                              AppText(
                                txt: '41'.tr,
                                size: Get.width * 0.045,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: ' ${controller.invoiceList[index].id} #',
                                size: Get.width * 0.045,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.center,
                                width: Get.width * 0.19,
                                height: Get.width * 0.08,
                                decoration: BoxDecoration(
                                  color: controller.invoiceList[index].rent > 0
                                      ? Colors.orange
                                      : AppColors.primaryColor,
                                  borderRadius:
                                      BorderRadius.circular(Get.width * 0.04),
                                ),
                                child: AppText(
                                  txt: controller.invoiceList[index].rent > 0
                                      ? '56'.tr
                                      : '57'.tr,
                                  size: Get.width * 0.04,
                                  fw: FontWeight.w900,
                                  color: AppColors.backgroundColor,
                                ),
                              ),
                              buildWirthSpace(0.05)
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            height: 2,
                            color: AppColors.primaryColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                txt: '42'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.invoiceList[index].customerName,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              AppText(
                                txt: '48'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.invoiceList[index].company,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                txt: '43'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.invoiceList[index].date,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              AppText(
                                txt: '49'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.invoiceList[index].dueDate,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                txt: '44'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.invoiceList[index].total
                                    .toString(),
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                              AppText(
                                txt: '50'.tr,
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: AppColors.primaryColor,
                              ),
                              AppText(
                                txt: controller.invoiceList[index].payed
                                    .toStringAsFixed(2),
                                size: Get.width * 0.03,
                                fw: FontWeight.w800,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
