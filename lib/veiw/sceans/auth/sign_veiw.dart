import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/main.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw_model/auth/login_veiw_model.dart';
import 'package:new_app/veiw_model/localization/local_veiw_model.dart';

class SignVeiw extends GetWidget<LoginVeiwModel> {
  SignVeiw({super.key});
  final TextEditingController userCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  final controller = Get.put(LoginVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGround(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: Get.width * 0.12,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: Get.width * 0.5,
                ),
                SizedBox(height: Get.width * 0.00),
                AppText(
                  txt: '1'.tr,
                  size: Get.width * 0.065,
                  fw: FontWeight.w800,
                  color: AppColors.backgroundColor,
                ),
                SizedBox(height: Get.width * 0.1),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      TxtFrmFeild.buildUserTxtForm(
                        controller: userCont,
                      ),
                      SizedBox(
                        height: Get.width * 0.04,
                      ),
                      GetBuilder<LoginVeiwModel>(
                        builder: (controller) =>
                            TxtFrmFeild.buildpasswordTxtForm(
                          controller: passCont,
                          obs: controller.opscur,
                          onPressed: () {
                            controller.isops();
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.width * 0.1,
                      ),
                      CustomButton(
                        txt: '1'.tr,
                        ontap: () async {
                          if (_key.currentState!.validate()) {
                            sharedpref!.setString('company', 'company1');
                            await controller.signIn(
                              userCont.text,
                              passCont.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                CustomButton(
                  txt: '4'.tr,
                  ontap: () {
                    final cont = Get.put(MyLocalController());
                    cont.changeLan();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
