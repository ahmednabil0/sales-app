import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_app/models/customer_model.dart';

class InvoiceVeiwModel extends GetxController {
  List<CustomerModel> mylist = [];
  List<String> afterList = [];
  CollectionReference ref = FirebaseFirestore.instance.collection('customers');
  Future<void> getCustomersDate() async {
    await ref.get().then((value) {
      for (var i in value.docs) {
        mylist.add(CustomerModel.fromMap(i));
      }
      for (int i = 0; i < mylist.length; i++) {
        afterList.add(mylist[i].custName);
      }
      update();
    });
  }

  String intailData = '20'.tr;
  oncganged(String? val) {
    intailData = val.toString();
    update();
  }

  @override
  void onInit() async {
    await getCustomersDate();
    super.onInit();
  }
}
