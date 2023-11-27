import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DiskusiController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  final Stream<QuerySnapshot> laporanStream =
      FirebaseFirestore.instance.collection('diskusi').limit(20).snapshots();
  @override
  void onClose() {
    super.onClose();
  }
}
