import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/spaces.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/quantites_veiw_model/receive_veiw_model.dart';

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
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: Get.width,
                                color: AppColors.primaryColor,
                                child: Column(
                                  children: [
                                    AppText(
                                      txt: 'تاريخ طلب الكمية :  ${Jiffy(
                                        controller.dataList[0].dateDetails,
                                      ).fromNow()}',
                                      size: Get.width * 0.045,
                                      fw: FontWeight.bold,
                                      color: AppColors.backgroundColor,
                                    ),
                                    AppText(
                                      txt:
                                          '${'70'.tr}   ${controller.dataList[index].from}',
                                      size: Get.width * 0.045,
                                      fw: FontWeight.bold,
                                      color: AppColors.backgroundColor,
                                    ),
                                    AppText(
                                      txt:
                                          '${'71'.tr}   ${controller.dataList[index].to}',
                                      size: Get.width * 0.045,
                                      fw: FontWeight.bold,
                                      color: AppColors.backgroundColor,
                                    ),
                                    buildHeightSpace(0.02),
                                    AppText(
                                      txt:
                                          '${'48'.tr} : ${controller.dataList[index].company}',
                                      size: Get.width * 0.045,
                                      fw: FontWeight.bold,
                                      color: AppColors.backgroundColor,
                                    ),
                                    Container(
                                      color: Colors.red,
                                      height: Get.width * 0.24,
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
                                    )
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
