import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:new_app/main.dart';
import 'package:new_app/veiw/sceans/home/home_veiw.dart';

class LoginVeiwModel extends GetxController {
  bool opscur = true;
  void isops() {
    opscur = !opscur;
    update();
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  Future<void> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        await userRef.doc(firebaseAuth.currentUser!.uid).set({
          'id': firebaseAuth.currentUser!.uid,
          'name': 'احمد نبيل السيد',
          'email': email,
          'password': password,
          'lat': 0.0,
          'long': 0.0,
          'companyName': 'company1',
          'companyId': 125654554,
          'personalSales': 1500.00,
          'isActive': false,
          'phone': '+20 01065028467',
          'permision': 'sales',
          'branchId': 1231223,
        });
        Get.off(() => HomeVeiw(admin: email));
        sharedpref!.remove('id');
        sharedpref!.setString('id', FirebaseAuth.instance.currentUser!.uid);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('sorry', 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('sorry', 'invalid email');
      }
    } catch (e) {
      Get.snackbar(
        'sorry',
        e.toString(),
      );
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      // ignore: unused_local_variable
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        sharedpref!.remove('id');
        sharedpref!.setString('id', FirebaseAuth.instance.currentUser!.uid);
        Get.snackbar('Ok', 'sucess Sign in');
        Get.off(() => HomeVeiw(
              admin: email,
            ));
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
}
