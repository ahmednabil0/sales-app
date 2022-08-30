import 'package:get/get.dart';
import 'package:new_app/models/invoice_model.dart';
import 'package:new_app/veiw_model/sql_db/sqlflite.dart';

class OffLineInvoices extends GetxController {
  MyDataBase db = MyDataBase();
  List<Invoice> offline = [];
  List<Map> ofllinList = [];
  Future<void> getOfflineInvoices() async {
    List myList = await db.getofflineItems(0);
    offline = [];
    for (var i in myList) {
      offline.add(Invoice.fromMap(i));
    }
    ofllinList = [];
    for (var i in offline) {
      List list = await db.getPurItems(i.id!);
      ofllinList.add({'invoice': i, 'items': list});
    }
    update();
  }

  @override
  void onInit() {
    getOfflineInvoices();
    super.onInit();
  }
}
