import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PelaporanController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  final box = GetStorage();
  final Stream<QuerySnapshot> laporanStream =
      FirebaseFirestore.instance.collection('laporan').limit(20).snapshots();
}
