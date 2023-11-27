import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lapor_pak/app/controllers/auth_controller.dart';

class UserProfileController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthController auth = AuthController();
  final image = Rx<File?>(null);

  Stream<DocumentSnapshot<Object?>> getData() {
    DocumentReference docRef = firestore.collection("users").doc(user!.uid);

    return docRef.snapshots();
  }

  Future<void> getImage() async {
    print(user!.uid);
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      final File pickedImageFile = File(imagePicked.path);
      image.value = pickedImageFile;
      final imageFile = image.value;
      final bytes = imageFile!.readAsBytesSync();
      final base64Img = base64Encode(bytes);
      await users
          .doc(user!.uid)
          .update({'foto': base64Img})
          .then((value) => Get.defaultDialog(
              title: "Berhasil", middleText: "Photo profile berhasil diubah"))
          .catchError((error) => {
                Get.defaultDialog(
                    title: "Gagal",
                    middleText: "Gagal memperbaharui foto profile")
              });
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
