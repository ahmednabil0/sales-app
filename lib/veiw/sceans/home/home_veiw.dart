import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/data/home_data.dart';
import 'package:new_app/veiw_model/invoces/offline_invoices.dart';

// ignore: must_be_immutable
class HomeVeiw extends StatelessWidget {
  HomeVeiw({this.admin, super.key}) {
    upload();
  }
  String? admin;
  OffLineInvoices instance = OffLineInvoices();
  void upload() async {
    await instance.upload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100.withBlue(255),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu_rounded,
              color: AppColors.primaryColor,
            )),
      ),
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppTextWidgtt(
                  txt: '10'.tr,
                  txt2: 'customer name',
                  size: Get.width * 0.05,
                  fw: FontWeight.bold,
                  color: AppColors.primaryColor.withOpacity(0.69),
                ),
                SizedBox(
                  height: Get.width * 0.04,
                ),
                SizedBox(
                  height: Get.height * 0.78,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Get.width * 0.075),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: Get.width * 0.07,
                          mainAxisSpacing: Get.width * 0.05,
                          childAspectRatio: Get.width * 0.3 / Get.width * 2.9),
                      itemCount: Homedata.homeList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int i) {
                        return InkWell(
                          onTap: Homedata.homeList[i].ontap,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(
                                  Get.width * 0.06,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color:
                                          AppColors.fontColor.withOpacity(0.5),
                                      offset: const Offset(5, 5))
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Homedata.homeList[i].icon,
                                  color: AppColors.primaryColor,
                                  size: Get.width * 0.15,
                                ),
                                SizedBox(
                                  height: Get.width * 0.025,
                                ),
                                AppText(
                                  txt: Homedata.homeList[i].type,
                                  size: Get.width * 0.04,
                                  fw: FontWeight.bold,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.8),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
