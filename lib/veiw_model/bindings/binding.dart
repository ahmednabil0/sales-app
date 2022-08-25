import 'package:get/get.dart';
import 'package:new_app/veiw_model/localization/local_veiw_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLocalController());
  }
}
