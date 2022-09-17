import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../components/back_ground.dart';
import '../../../components/custom_text.dart';
import '../home_veiw.dart';

class CompletedScrean extends StatefulWidget {
  const CompletedScrean({super.key});

  @override
  State<CompletedScrean> createState() => _CompletedScreanState();
}

class _CompletedScreanState extends State<CompletedScrean> {
  @override
  void initState() {
    maina();
    super.initState();
  }

  void maina() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Get.off(() => HomeVeiw());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                txt: ' تم انشاء الفاتورة بنجاح ✅',
                size: Get.width * 0.07,
                fw: FontWeight.bold,
                color: Colors.green,
              ),
              SvgPicture.asset(
                'assets/svg/undraw_completing_re_i7ap.svg',
                height: Get.width * 0.7,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
