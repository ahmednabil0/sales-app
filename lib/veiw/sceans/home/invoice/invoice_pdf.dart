// return Scaffold(
//       body: createBackGroundHome(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(Get.width * 0.042),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: Get.width,
//                   height: Get.height * 0.7,
//                   decoration: BoxDecoration(
//                       color: AppColors.backgroundColor,
//                       boxShadow: [
//                         BoxShadow(
//                             color: AppColors.fontColor.withOpacity(0.42),
//                             blurRadius: 5,
//                             offset: const Offset(1, 1)),
//                       ]),
//                   child: Column(
//                     children: [
//                       buildAppBar(txt: '18'.tr),
//                       const Divider(
//                         color: AppColors.primaryColor,
//                         thickness: 0.7,
//                         indent: 10,
//                         height: 2,
//                         endIndent: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Spacer(),
//                           AppText(
//                             txt: '41'.tr,
//                             size: Get.width * 0.045,
//                             fw: FontWeight.w800,
//                             color: AppColors.primaryColor,
//                           ),
//                           AppText(
//                             txt: ' ${controller.id} #',
//                             size: Get.width * 0.045,
//                             fw: FontWeight.w800,
//                             color: Colors.red,
//                           ),
//                           const Spacer(),
//                           QrImage(
//                             data: controller.id.toString(),
//                             version: QrVersions.auto,
//                             size: Get.width * 0.15,
//                             foregroundColor: AppColors.primaryColor,
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: Get.width * 0.025,
//                           ),
//                           AppText(
//                             txt: '${'48'.tr}:',
//                             size: Get.width * 0.035,
//                             fw: FontWeight.w800,
//                             color: AppColors.primaryColor,
//                           ),
//                           AppText(
//                             txt: ' ${controller.company}',
//                             size: Get.width * 0.035,
//                             fw: FontWeight.w800,
//                             color: Colors.purple,
//                           ),
//                           const Spacer(),
//                           AppText(
//                             txt: '${'42'.tr}: ',
//                             size: Get.width * 0.035,
//                             fw: FontWeight.w800,
//                             color: AppColors.primaryColor,
//                           ),
//                           AppText(
//                             txt: ' ${controller.customerName}',
//                             size: Get.width * 0.035,
//                             fw: FontWeight.w800,
//                             color: Colors.purple,
//                           ),
//                           SizedBox(
//                             width: Get.width * 0.025,
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: Get.width * 0.025,
//                           ),
//                           AppText(
//                             txt: '${'43'.tr}:',
//                             size: Get.width * 0.035,
//                             fw: FontWeight.w800,
//                             color: AppColors.primaryColor,
//                           ),
//                           AppText(
//                             txt: ' ${controller.date}',
//                             size: Get.width * 0.035,
//                             fw: FontWeight.w800,
//                             color: Colors.purple,
//                           ),
//                           const Spacer(),
//                           AppText(
//                             txt: '${'49'.tr}: ',
//                             size: Get.width * 0.035,
//                             fw: FontWeight.w800,
//                             color: AppColors.primaryColor,
//                           ),
//                           AppText(
//                             txt: ' ${controller.dueDate}',
//                             size: Get.width * 0.035,
//                             fw: FontWeight.w800,
//                             color: Colors.purple,
//                           ),
//                           SizedBox(
//                             width: Get.width * 0.025,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: Get.width * 0.05,
//                       ),
//                       SizedBox(
//                         child: Padding(
//                           padding: EdgeInsets.all(Get.width * 0.02),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.circular(Get.width * 0.03),
//                               border: Border.all(
//                                 color: AppColors.primaryColor,
//                                 width: 2,
//                               ),
//                             ),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     AppText(
//                                       txt: '24'.tr,
//                                       size: Get.width * 0.045,
//                                       fw: FontWeight.bold,
//                                       color: AppColors.primaryColor,
//                                     ),
//                                     AppText(
//                                       txt: '25'.tr,
//                                       size: Get.width * 0.045,
//                                       fw: FontWeight.bold,
//                                       color: AppColors.primaryColor,
//                                     ),
//                                     AppText(
//                                       txt: '27'.tr,
//                                       size: Get.width * 0.045,
//                                       fw: FontWeight.bold,
//                                       color: AppColors.primaryColor,
//                                     ),
//                                     AppText(
//                                       txt: '23'.tr,
//                                       size: Get.width * 0.045,
//                                       fw: FontWeight.bold,
//                                       color: AppColors.primaryColor,
//                                     ),
//                                   ],
//                                 ),
//                                 const Divider(
//                                   color: AppColors.primaryColor,
//                                   thickness: 1,
//                                 ),
//                                 SizedBox(
//                                   height: Get.height * 0.3,
//                                   child: ListView.builder(
//                                     itemCount: controller.items.length,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       return Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               AppText(
//                                                 txt: controller.items[index]
//                                                     ['name'],
//                                                 size: Get.width * 0.045,
//                                                 fw: FontWeight.bold,
//                                                 color: AppColors.primaryColor,
//                                               ),
//                                               AppText(
//                                                 txt: controller.items[index]
//                                                         ['price']
//                                                     .toString(),
//                                                 size: Get.width * 0.045,
//                                                 fw: FontWeight.bold,
//                                                 color: AppColors.primaryColor,
//                                               ),
//                                               AppText(
//                                                 txt: controller.items[index]
//                                                     ['unit'],
//                                                 size: Get.width * 0.045,
//                                                 fw: FontWeight.bold,
//                                                 color: AppColors.primaryColor,
//                                               ),
//                                               AppText(
//                                                 txt: controller.items[index]
//                                                         ['quntity']
//                                                     .toString(),
//                                                 size: Get.width * 0.045,
//                                                 fw: FontWeight.bold,
//                                                 color: AppColors.primaryColor,
//                                               ),
//                                             ],
//                                           ),
//                                           const Divider(
//                                             color: AppColors.primaryColor,
//                                             thickness: 1,
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       SizedBox(
//                         height: Get.width * 0.021,
//                       ),
//                       const Divider(
//                         color: AppColors.primaryColor,
//                         thickness: 0.7,
//                         indent: 10,
//                         height: 5,
//                         endIndent: 10,
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: Get.width * 0.1,
//                           ),
//                           AppText(
//                             txt: '${'34'.tr}:',
//                             size: Get.width * 0.04,
//                             fw: FontWeight.w800,
//                             color: AppColors.primaryColor,
//                           ),
//                           AppText(
//                             txt: ' ${controller.total}',
//                             size: Get.width * 0.04,
//                             fw: FontWeight.w800,
//                             color: Colors.purple,
//                           ),
//                           const Spacer(),
//                           AppText(
//                             txt: '${'50'.tr}: ',
//                             size: Get.width * 0.04,
//                             fw: FontWeight.w800,
//                             color: AppColors.primaryColor,
//                           ),
//                           AppText(
//                             txt: ' ${controller.payed}',
//                             size: Get.width * 0.04,
//                             fw: FontWeight.w800,
//                             color: Colors.purple,
//                           ),
//                           SizedBox(width: Get.width * 0.1),
//                         ],
//                       ),
//                       SizedBox(
//                         height: Get.width * 0.02,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );