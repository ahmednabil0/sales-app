// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_app/veiw/components/app_bar.dart';
// import 'package:new_app/veiw/components/back_ground.dart';
// import 'package:new_app/veiw/components/bttons.dart';
// import 'package:new_app/veiw/components/invoice_component/edit_invoice_card.dart';
// import 'package:new_app/veiw_model/invoces/edit_veiw_model.dart';

// class EditInvoiceVeiw extends GetWidget<EditViewModel> {
//   EditInvoiceVeiw({super.key});
//   @override
//   final controller = Get.put(EditViewModel());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: createBackGroundHome(
//         child: SafeArea(
//           child: Column(
//             children: [
//               buildAppBar(
//                 txt: '18'.tr,
//               ),
//               SizedBox(
//                 height: Get.width * 0.04,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     width: Get.width * 0.04,
//                   ),
//                   CustomButton16(
//                     icon: Icons.search_rounded,
//                     ontap: () {
//                       controller.getData(controller.dateCont.text.trim());
//                     },
//                     txt: '',
//                   ),
//                   SizedBox(
//                     width: Get.width * 0.04,
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: controller.buildDateTxtFormCust(context),
//                   ),
//                   SizedBox(
//                     width: Get.width * 0.04,
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: buildEditinvoiceCard(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
