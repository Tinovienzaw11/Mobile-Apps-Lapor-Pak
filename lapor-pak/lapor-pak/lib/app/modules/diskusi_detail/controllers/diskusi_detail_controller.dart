import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DiskusiDetailController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
  final tanggapanC = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Map arguments = Get.arguments;
  RxString judul = "".obs;
  RxString isi = "".obs;
  final box = GetStorage();
  Stream<QuerySnapshot> getDiscussionStream() {
    String id_diskusi = arguments['id'];
    return FirebaseFirestore.instance
        .collection('diskusi_detail')
        .where('id_diskusi', isEqualTo: id_diskusi)
        .snapshots();
  }

  Future<void> saveComment() async {
    CollectionReference diskusiDetail = firestore.collection("diskusi_detail");
    DateTime tglDiskusi = DateTime.now();
    Timestamp tglDiskusiTimestamp = Timestamp.fromDate(tglDiskusi);
    String id_diskusi = arguments['id'];
    final nama = box.read("nama");
    try {
      await diskusiDetail.add({
        "id_diskusi": id_diskusi,
        "balasan": tanggapanC.text,
        "timestamp": tglDiskusiTimestamp,
        "nama": nama
      });
      Fluttertoast.showToast(
          msg: "Tanggapan berhasil terkirim",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xff1A669D),
          textColor: Colors.white,
          fontSize: 16.0);

      Get.back();
    } catch (e) {
      Get.defaultDialog(
          title: "Error", middleText: "Gagal menyimpan tanggapan diskusi.");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    tanggapanC.dispose();
    super.onClose();
  }
}
