import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DiskusiCreateController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  final box = GetStorage();
  RxString dropdownValue = 'Jalan dan trotoar'.obs;
  final image = Rx<File?>(null);
  final kategoriC = TextEditingController();
  final judulC = TextEditingController();
  final isiC = TextEditingController();

  var selectedKategori = "".obs;
  @override
  void onInit() async {
    super.onInit();
  }

  Future<QuerySnapshot<Object?>> getKategoriLaporan() async {
    CollectionReference kategoriLaporan =
        firestore.collection("kategori_laporan");

    return kategoriLaporan.get();
  }

  Future<void> sendDiskusi() async {
    User? user = FirebaseAuth.instance.currentUser;

    var imageFile;
    var base64Img;
    if (image.value != null) {
      imageFile = image.value;
      var bytes = imageFile!.readAsBytesSync();
      base64Img = base64Encode(bytes);
    }

    final nama = box.read("nama");

    CollectionReference diskusi = firestore.collection("diskusi");
    DateTime tglDiskusi = DateTime.now();
    Timestamp tglDiskusiTimestamp = Timestamp.fromDate(tglDiskusi);

    try {
      await diskusi.add({
        "foto": image.value != null ? base64Img : '',
        "uid": user!.uid,
        "kategori": dropdownValue.value,
        "isi": isiC.text,
        "judul": judulC.text,
        "penulis": nama,
        "timestamp": tglDiskusiTimestamp
      });

      Fluttertoast.showToast(
          msg: "Diskusi berhasil terkirim",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xff1A669D),
          textColor: Colors.white,
          fontSize: 16.0);

      Get.back();
      Get.back();
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: "Gagal menyimpan diskusi.");
    }
  }

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      final File pickedImageFile = File(imagePicked.path);
      image.value = pickedImageFile;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    kategoriC.dispose();
    isiC.dispose();
    judulC.dispose();
    super.onClose();
  }
}
