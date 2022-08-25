import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/components/back_ground.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';
import 'package:new_app/veiw/sceans/home/home_veiw.dart';
import 'package:new_app/veiw_model/localization/local_veiw_model.dart';

class SignVeiw extends StatelessWidget {
  SignVeiw({super.key});
  final TextEditingController userCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
                  height: Get.width * 0.05,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: Get.width * 0.4,
                ),
                SizedBox(height: Get.width * 0.1),
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
                      TxtFrmFeild.buildpasswordTxtForm(
                          controller: passCont, obs: true, onPressed: () {}),
                      SizedBox(
                        height: Get.width * 0.1,
                      ),
                      CustomButton(
                        txt: '1'.tr,
                        ontap: () {
                          if (_key.currentState!.validate()) {
                            Get.off(
                              () => HomeVeiw(
                                admin: userCont.text,
                              ),
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
