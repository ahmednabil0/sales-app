import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../veiw/sceans/home/home_veiw.dart';
import '../functions/ckeck_internet.dart';

class LoginVeiwModel extends GetxController {
  bool opscur = true;
  void isops() {
    opscur = !opscur;
    update();
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  Future<void> signIn(String email, String password) async {
    try {
      // ignore: unused_local_variable
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        await userRef
            .where('id', isEqualTo: firebaseAuth.currentUser!.uid)
            .get()
            .then((value) {
          sharedpref!.remove('id');
          sharedpref!.remove('company');
          sharedpref!.remove('companyId');
          sharedpref!.setString('id', value.docs[0]['id']);
          sharedpref!.setString('name', value.docs[0]['name']);
          sharedpref!.setString('company', value.docs[0]['companyName']);
          sharedpref!.setInt('companyId', value.docs[0]['companyId']);
          // print(value.docs[0]['id']);
          // print(value.docs[0]['companyName']);
          // print(value.docs[0]['companyId']);
        });

        Get.snackbar('Ok', 'sucess Sign in');
        Get.off(
          () => HomeVeiw(
            admin: sharedpref!.getString('name'),
          ),
        );
      }
      // ignore: unnecessary_null_comparison
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('erreo', 'user not found');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('error', 'wrong password');
      }
    }

    // ignore: unnecessary_null_comparison
  }

  bool? res;
  datd() async {
    res = await ckeckInternet();
    // ignore: avoid_print
    print(res);
  }

  @override
  void onInit() {
    datd();
    super.onInit();
  }
}
