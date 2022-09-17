import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/app_bar.dart';
import '../../../components/back_ground.dart';
import '../../../components/invoice_component/get_items.dart';
import '../../../components/invoice_component/item_header.dart';
import '../../../../veiw_model/quantites_veiw_model/quantities_veiw_model.dart';

class AddItemToBr extends GetWidget<QuantitiesVeiwModel> {
  AddItemToBr({super.key});
  @override
  final controller = Get.put(QuantitiesVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Column(
          children: [
            buildAppBar(txt: '21'.tr),
            buildItemHeader(),
            Expanded(
              child: SizedBox(
                child: buildGetItemsBr(),
              ),
            ),
            SizedBox(
              height: Get.width * 0.03,
            ),
            buildItemHeaderBr(),
          ],
        ),
      )),
    );
  }
}
