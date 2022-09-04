import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/veiw/helper/theme/theme.dart';
import 'package:new_app/veiw/sceans/auth/sign_veiw.dart';
import 'package:new_app/veiw/sceans/home/home_veiw.dart';
import 'package:new_app/veiw_model/localization/local.dart';
import 'package:new_app/veiw_model/localization/local_veiw_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedpref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.intaillocal,
      translations: MyLocal(),
      title: 'Flutter Demo',
      theme: getThemeDate(),
      home: sharedpref!.getString('id') == null ? SignVeiw() : HomeVeiw(),
    );
  }
}
