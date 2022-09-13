import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/invoice_component/item_header.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/invoces/create_invoice_veiw_model.dart';
import 'package:new_app/veiw_model/quantites_veiw_model/quantities_veiw_model.dart';
import 'package:new_app/veiw_model/reyurns_invoice/return_invoice_view_model.dart';

GetBuilder<InvoiceVeiwModel> buildGetItems() {
  return GetBuilder<InvoiceVeiwModel>(
    builder: (controller) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.itemList.length,
        itemBuilder: (context, index) {
          TextEditingController txtCont = TextEditingController();
          txtCont.text = '${controller.itemList[index].quntity}';
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04, vertical: Get.width * 0.015),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.074),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildItemHeaderTwo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppText(
                        txt: controller.itemList[index].name,
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: '\$${controller.itemList[index].price}',
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: '${controller.itemList[index].vat}%',
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: controller.itemList[index].unit,
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton6(
                        ontap: () {
                          controller.add(index);
                        },
                        txt: '',
                        icon: Icons.add,
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TxtFrmFeild.buildQuntityTxtForm(
                        controller: txtCont,
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      CustomButton6(
                        ontap: () {
                          controller.sub(index);
                        },
                        txt: '',
                        icon: Icons.minimize_rounded,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton7(
                          ontap: () {
                            controller.addItem(controller.itemList[index]);
                          },
                          txt: 'add'),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
  );
}

GetBuilder<QuantitiesVeiwModel> buildGetItemsBr() {
  return GetBuilder<QuantitiesVeiwModel>(
    builder: (controller) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.itemList.length,
        itemBuilder: (context, index) {
          TextEditingController txtCont = TextEditingController();
          txtCont.text = '${controller.itemList[index].quntity}';
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04, vertical: Get.width * 0.015),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.074),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildItemHeaderTwo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppText(
                        txt: controller.itemList[index].name,
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: '\$${controller.itemList[index].price}',
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: '${controller.itemList[index].vat}%',
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: controller.itemList[index].unit,
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton6(
                        ontap: () {
                          controller.add(index);
                        },
                        txt: '',
                        icon: Icons.add,
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TxtFrmFeild.buildQuntityTxtForm(
                        controller: txtCont,
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      CustomButton6(
                        ontap: () {
                          controller.sub(index);
                        },
                        txt: '',
                        icon: Icons.minimize_rounded,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton7(
                          ontap: () {
                            controller.addItem(controller.itemList[index]);
                          },
                          txt: 'add'),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
  );
}

GetBuilder<ReturnIvoiceVeiwModel> buildGetItemsRE() {
  return GetBuilder<ReturnIvoiceVeiwModel>(
    builder: (controller) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.itemList.length,
        itemBuilder: (context, index) {
          TextEditingController txtCont = TextEditingController();
          txtCont.text = '${controller.itemList[index].quntity}';
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04, vertical: Get.width * 0.015),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Get.width * 0.074),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildItemHeaderTwo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppText(
                        txt: controller.itemList[index].name,
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: '\$${controller.itemList[index].price}',
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: '${controller.itemList[index].vat}%',
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                      AppText(
                        txt: controller.itemList[index].unit,
                        size: Get.width * 0.04,
                        fw: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton6(
                        ontap: () {
                          controller.add(index);
                        },
                        txt: '',
                        icon: Icons.add,
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      TxtFrmFeild.buildQuntityTxtForm(
                        controller: txtCont,
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      CustomButton6(
                        ontap: () {
                          controller.sub(index);
                        },
                        txt: '',
                        icon: Icons.minimize_rounded,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton7(
                          ontap: () {
                            controller.addItem(controller.itemList[index]);
                          },
                          txt: 'add'),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
  );
}
