import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/main.dart';
import 'package:new_app/veiw/components/bttons.dart';
import 'package:new_app/veiw/components/custom_text.dart';
import 'package:new_app/veiw/helper/consts/colors.dart';

class MyLocalController extends GetxController {
  Locale intaillocal = sharedpref!.getString('lang') == 'en'
      ? const Locale('en')
      : const Locale('ar');

  void changeLang(String codelang) async {
    Locale currentlocal = Locale(codelang);
    sharedpref!.remove('lang');
    sharedpref!.setString('lang', codelang);

    Get.updateLocale(currentlocal);
    update();
  }

  changeLan() {
    Get.defaultDialog(
      backgroundColor: AppColors.backgroundColor,
      barrierDismissible: false,
      title: '.',
      actions: [
        GetBuilder<MyLocalController>(
            builder: (controller) => InkWell(
                onTap: () {
                  Get.back();
                },
                child: CustomButton2(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    txt: '9'.tr))),
      ],
      titleStyle: const TextStyle(fontSize: 0.5),
      content: GetBuilder<MyLocalController>(
        builder: (controller) => Column(
          children: [
            AppText(
              txt: '4'.tr,
              size: Get.width * 0.065,
              fw: FontWeight.w800,
              color: AppColors.primaryColor,
            ),
            const MyStatefulWidget()
          ],
        ),
      ),
    );
  }

//

//

}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = sharedpref!.getString('lang') == 'en'
      ? SingingCharacter.jefferson
      : SingingCharacter.lafayette;
  final cont = Get.put(MyLocalController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            '6'.tr,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Get.width * 0.035,
                color: AppColors.fontColor),
          ),
          leading: Radio<SingingCharacter>(
            activeColor: AppColors.primaryColor,
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                cont.changeLang('ar');
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            '7'.tr,
            style: TextStyle(
                fontSize: Get.width * 0.035,
                fontWeight: FontWeight.w600,
                fontFamily: "Neo Sans Arabic Regular",
                color: AppColors.fontColor),
          ),
          leading: Radio<SingingCharacter>(
            activeColor: AppColors.primaryColor,
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
                cont.changeLang('en');
              });
            },
          ),
        ),
      ],
    );
  }
}
