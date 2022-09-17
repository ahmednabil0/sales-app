import 'package:get/get.dart';
import '../localization/local_veiw_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLocalController());
  }
}
