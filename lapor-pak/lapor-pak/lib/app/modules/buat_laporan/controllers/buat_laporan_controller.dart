import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BuatLaporanController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  final box = GetStorage();
  RxString dropdownValue = 'Jalan dan trotoar'.obs;
  final image = Rx<File?>(null);
  final kategoriC = TextEditingController();
  final lokasiC = TextEditingController();
  final keteranganC = TextEditingController();

  late double _lat;
  late double _lng;

  final count = 0.obs;
  var selectedKategori = "".obs;
  @override
  void onInit() async {
    bool servicestatus = await Geolocator.isLocationServiceEnabled();
    print(servicestatus);
    if (servicestatus) {
      _getCurrentLocation();
    } else {
      print("GPS service is disabled.");
    }
    super.onInit();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Get the device's current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      _lat = position.latitude;
      _lng = position.longitude;
    } catch (e) {
      // Handle any errors that occur while getting the current location
      print('Error getting current location: $e');
    }
  }

  Future<QuerySnapshot<Object?>> getKategoriLaporan() async {
    CollectionReference kategoriLaporan =
        firestore.collection("kategori_laporan");

    return kategoriLaporan.get();
  }

  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('dd MMM yyyy');
    return formatter.format(now);
  }

  Future<void> sendLaporan() async {
    User? user = FirebaseAuth.instance.currentUser;

    final imageFile = image.value;
    final bytes = imageFile!.readAsBytesSync();
    final baset64Img = base64Encode(bytes);
    final nama = box.read("nama");

    CollectionReference laporan = firestore.collection("laporan");
    DateTime tglLapor = DateTime.now();
    Timestamp tglLaporTimestamp = Timestamp.fromDate(tglLapor);

    try {
      await laporan.add({
        "foto": baset64Img,
        "id_pelapor": user!.uid,
        "kategori_laporan": dropdownValue.value,
        "keterangan": keteranganC.text,
        "latitude": _lat,
        "longitude": _lng,
        "lokasi": lokasiC.text,
        "nama_pelapor": nama,
        "status": "Menunggu",
        "tgl_lapor": getCurrentDateTime().toString(),
        "timestamp": tglLaporTimestamp
      });

      Fluttertoast.showToast(
          msg: "Laporan berhasil terkirim",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xff1A669D),
          textColor: Colors.white,
          fontSize: 16.0);

      Get.back();
      Get.back();
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: "Gagal mengirim laporan.");
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
    lokasiC.dispose();
    keteranganC.dispose();
    super.onClose();
  }
}
