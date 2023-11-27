import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BeritaDetailController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Map arguments = Get.arguments;

  Future<DocumentSnapshot<Object?>> getData() async {
    String docID = arguments['id'];

    DocumentReference docRef = firestore.collection("berita").doc(docID);

    return docRef.get();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
