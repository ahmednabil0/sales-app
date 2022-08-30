import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/invoces/offline_invoices.dart';

GetBuilder<OffLineInvoices> buildOflineInvoices() {
  return GetBuilder<OffLineInvoices>(
    builder: (controller) => controller.ofllinList.isEmpty
        ? Center(
            child: AppText(
              txt: 'لا يوجد فواتير اوفلاين',
              size: Get.width * 0.07,
              fw: FontWeight.w900,
              color: AppColors.primaryColor,
            ),
          )
        : ListView.builder(
            itemCount: controller.ofllinList.length,
            itemBuilder: (BuildContext context, int index) {
              Map i = controller.ofllinList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Get.width * 0.9,
                  height: Get.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width * 0.05),
                      color: AppColors.backgroundColor,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.fontColor.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(2.5, 2.5))
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                              txt: 'رقم الفاتورة',
                              size: Get.width * 0.05,
                              fw: FontWeight.bold,
                              color: AppColors.primaryColor),
                          SizedBox(
                            width: Get.width * 0.01,
                          ),
                          AppText(
                              txt: '#${i['invoice'].id.toString()}',
                              size: Get.width * 0.05,
                              fw: FontWeight.bold,
                              color: AppColors.primaryColor),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            txt: '${'34'.tr} : ',
                            size: Get.width * 0.04,
                            fw: FontWeight.bold,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i['invoice'].total.toString(),
                            size: Get.width * 0.04,
                            fw: FontWeight.bold,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: '20'.tr,
                            size: Get.width * 0.04,
                            fw: FontWeight.bold,
                            color: AppColors.fontColor,
                          ),
                          AppText(
                            txt: i['invoice'].customerName,
                            size: Get.width * 0.04,
                            fw: FontWeight.bold,
                            color: AppColors.fontColor,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt: 'تاريخ الفاتورة : ',
                            size: Get.width * 0.04,
                            fw: FontWeight.bold,
                            color: AppColors.fontColor,
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          AppText(
                            txt: i['invoice'].date,
                            size: Get.width * 0.04,
                            fw: FontWeight.bold,
                            color: AppColors.fontColor,
                          ),
                        ],
                      ),
                      const Spacer(),
                      CustomButton9(
                          ontap: () {
                            Get.defaultDialog(
                              title: 'تفاصيل الفاتورة',
                              content: Column(
                                children: [
                                  AppText(
                                    txt: i['items'].toString(),
                                    size: Get.width * 0.025,
                                    fw: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            );
                          },
                          txt: 'عرض تفاصيل الفاتورة')
                    ],
                  ),
                ),
              );
            },
          ),
  );
}
