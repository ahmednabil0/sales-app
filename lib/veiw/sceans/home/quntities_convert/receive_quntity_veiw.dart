import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../components/app_bar.dart';
import '../../../components/back_ground.dart';
import '../../../components/bttons.dart';
import '../../../components/custom_text.dart';
import '../../../components/spaces.dart';
import '../../../helper/consts/colors.dart';
import '../../../../veiw_model/quantites_veiw_model/receive_veiw_model.dart';

class ReceiveQuntityVeiw extends GetWidget<ReceiveVeiwModel> {
  ReceiveQuntityVeiw({super.key});
  @override
  final controller = Get.put(ReceiveVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: Column(
            children: [
              buildAppBar(txt: '16'.tr),
              buildHeightSpace(0.02),
              Expanded(
                child: GetBuilder<ReceiveVeiwModel>(
                  builder: (controller) => controller.dataList.isEmpty
                      ? AppText(
                          txt: 'no data ....',
                          size: Get.width * 0.045,
                          fw: FontWeight.bold,
                          color: AppColors.seconrayColor,
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            await controller.getData();
                          },
                          child: ListView.builder(
                            itemCount: controller.dataList.length,
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04,
                              vertical: Get.width * 0.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(
                                  bottom: Get.width * 0.04,
                                ),
                                height: Get.width * 0.8,
                                decoration: BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(
                                      Get.width * 0.06,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          color: AppColors.fontColor
                                              .withOpacity(0.5),
                                          offset: const Offset(4, 4))
                                    ]),
                                child: Column(
                                  children: [
                                    AppText(
                                      txt: 'تاريخ طلب الكمية :  ${Jiffy(
                                        controller.dataList[0].dateDetails,
                                      ).fromNow()}',
                                      size: Get.width * 0.045,
                                      fw: FontWeight.bold,
                                      color: AppColors.fontColor,
                                    ),
                                    AppText(
                                      txt:
                                          '${'70'.tr}   ${controller.dataList[index].from}',
                                      size: Get.width * 0.045,
                                      fw: FontWeight.bold,
                                      color: AppColors.fontColor,
                                    ),
                                    AppText(
                                      txt:
                                          '${'71'.tr}   ${controller.dataList[index].to}',
                                      size: Get.width * 0.045,
                                      fw: FontWeight.bold,
                                      color: AppColors.fontColor,
                                    ),
                                    buildHeightSpace(0.02),
                                    AppText(
                                      txt:
                                          '${'48'.tr} : ${controller.dataList[index].company}',
                                      size: Get.width * 0.045,
                                      fw: FontWeight.bold,
                                      color: AppColors.fontColor,
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: Get.width * 0.24,
                                      width: Get.width * 0.9,
                                      decoration: BoxDecoration(
                                        color: AppColors.seconrayColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            Get.width * 0.06,
                                          ),
                                          topRight: Radius.circular(
                                            Get.width * 0.06,
                                          ),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      child: ListView.builder(
                                        itemCount: controller
                                            .dataList[index].items.length,
                                        itemBuilder:
                                            (BuildContext context, int i) {
                                          return Center(
                                            child: AppText(
                                              txt:
                                                  '${'24'.tr} : ${controller.dataList[index].items[i]['name']}            ${'23'.tr} : ${controller.dataList[index].items[i]['quntity']}',
                                              size: Get.width * 0.045,
                                              fw: FontWeight.bold,
                                              color: AppColors.backgroundColor,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    controller.dataList[index].delivering
                                        ? CustomButton22(
                                            ontap: () {
                                              Get.defaultDialog(
                                                title: '',
                                                content: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svg/rent.svg',
                                                      height: Get.width * 0.4,
                                                    ),
                                                    buildHeightSpace(0.04),
                                                    AppText(
                                                      txt:
                                                          '${'74'.tr}  ${Jiffy(controller.dataList[index].deliverDate).fromNow()} ',
                                                      size: Get.width * 0.045,
                                                      fw: FontWeight.bold,
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            txt: '73'.tr)
                                        : const SizedBox(),
                                    CustomButton9(
                                        ontap: () {
                                          controller.updateDate(
                                              controller.dataList[index]);
                                        },
                                        txt: '72'.tr)
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
