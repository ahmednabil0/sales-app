import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:new_app/main.dart';
import 'package:new_app/models/applicant_model.dart';

class ReceiveVeiwModel extends GetxController {
  CollectionReference ref = FirebaseFirestore.instance.collection('applicants');
  List<ApplicantModel> dataList = [];
  Future<void> getData() async {
    dataList.clear();
    await ref
        .where('salesId', isEqualTo: sharedpref!.getString('id'))
        .where('companyId', isEqualTo: sharedpref!.getInt('companyId'))
        .where('accept', isEqualTo: true)
        .get()
        .then((value) {
      for (var i in value.docs) {
        dataList.add(ApplicantModel.fromMap(i));
      }
      update();
    });
  }

  @override
  void onInit() async {
    await Jiffy.locale('ar');
    await getData();
    super.onInit();
  }
}
