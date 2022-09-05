import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/models/online_invoice_model.dart';
import 'package:new_app/veiw/components/app_bar.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/invoice_component/drob_down.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/invoces/edit_veiw_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class EditInvoiceDetailsVeiw extends GetWidget<EditViewModel> {
  EditInvoiceDetailsVeiw({required this.cont, super.key}) {
    data();
    controller.passData(cont.customerName);
    copanyCont.text = cont.company;
    dateCont.text = cont.date;
    vatCont.text = cont.vat.toString();
    deliveryCont.text = cont.delivery.toString();
    paymentCont.text = cont.payed.toString();
    rentCont.text = cont.rent.toString();
    totalCont.text = cont.total.toString();
    dueDateCont.text = cont.dueDate;
  }
  FirebaseInvoiceModel cont;
  void data() {
    controller.moveData(cont.items);
  }

  @override
  final controller = Get.put(EditViewModel());
  final TextEditingController copanyCont = TextEditingController();
  final TextEditingController dateCont = TextEditingController();
  final TextEditingController dueDateCont = TextEditingController();
  final TextEditingController vatCont = TextEditingController();
  final TextEditingController deliveryCont = TextEditingController();
  final TextEditingController totalCont = TextEditingController();
  final TextEditingController paymentCont = TextEditingController();
  final TextEditingController rentCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildBody(),
                AppText(
                  txt: '51'.tr,
                  size: Get.width * 0.05,
                  fw: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: Get.height * 0.25,
                  width: Get.width * 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width * 0.04),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1.5,
                      ),
                    ),
                    child: GetBuilder<EditViewModel>(
                      builder: (controller) => ListView.builder(
                        itemCount: controller.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          var i = controller.items[index];
                          final TextEditingController qCont =
                              TextEditingController();
                          qCont.text = i.quntity.toString();

                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppText(
                                    txt: i.name,
                                    size: Get.width * 0.045,
                                    fw: FontWeight.w500,
                                    color: AppColors.fontColor,
                                  ),
                                  AppText(
                                    txt: i.price.toString(),
                                    size: Get.width * 0.045,
                                    fw: FontWeight.w500,
                                    color: AppColors.fontColor,
                                  ),
                                  AppText(
                                    txt: i.unit.toString(),
                                    size: Get.width * 0.045,
                                    fw: FontWeight.w500,
                                    color: AppColors.fontColor,
                                  ),
                                  AppText(
                                    txt: i.quntity.toString(),
                                    size: Get.width * 0.045,
                                    fw: FontWeight.w500,
                                    color: AppColors.fontColor,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.removeItem(i);
                                    },
                                    icon: const Icon(
                                      Icons.highlight_remove_rounded,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                color: AppColors.primaryColor,
                                thickness: 1,
                              ),
                            ],
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
      ),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        buildAppBar(
          txt: '18'.tr,
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                AppText(
                  txt: '41'.tr,
                  size: Get.width * 0.045,
                  fw: FontWeight.w800,
                  color: AppColors.primaryColor,
                ),
                AppText(
                  txt: ' ${cont.id} #',
                  size: Get.width * 0.045,
                  fw: FontWeight.w800,
                  color: Colors.red,
                ),
              ],
            ),
            QrImage(
              data: cont.id.toString(),
              version: QrVersions.auto,
              size: Get.width * 0.15,
              foregroundColor: AppColors.primaryColor,
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'20'.tr} :',
              size: Get.width * 0.045,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: buildDrobDown2(controller: controller),
            )
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'48'.tr} :',
              size: Get.width * 0.045,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: TxtFrmFeild.buildnameTxtForm(
                controller: copanyCont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'43'.tr} :',
              size: Get.width * 0.039,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: TxtFrmFeild.buildDateTxtForm(
                controller: dateCont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'49'.tr} :',
              size: Get.width * 0.039,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: TxtFrmFeild.buildDateTxtForm(
                controller: dueDateCont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'33'.tr} :        ',
              size: Get.width * 0.039,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: TxtFrmFeild.buildDateTxtForm(
                controller: vatCont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'35'.tr} :        ',
              size: Get.width * 0.039,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: TxtFrmFeild.buildDateTxtForm(
                controller: deliveryCont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'34'.tr} :        ',
              size: Get.width * 0.039,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: TxtFrmFeild.buildDateTxtForm(
                controller: totalCont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'46'.tr} :',
              size: Get.width * 0.039,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: TxtFrmFeild.buildDateTxtForm(
                controller: paymentCont,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.width * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              txt: '${'47'.tr} :',
              size: Get.width * 0.039,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            SizedBox(
              width: Get.width * 0.65,
              child: TxtFrmFeild.buildDateTxtForm(
                controller: rentCont,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
