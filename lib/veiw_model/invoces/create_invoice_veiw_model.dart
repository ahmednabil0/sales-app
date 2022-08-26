import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InvoiceVeiwModel extends GetxController {
  CollectionReference ref = FirebaseFirestore.instance.collection('');
}
