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

class DisdukcapilFormController extends GetxController {
  RxString ddWNI = 'WNI'.obs;
  RxString ddGender = 'Pria'.obs;
  RxString ddAgama = 'Islam'.obs;
  RxString ddStatus = 'Belum Menikah'.obs;
  final image = Rx<File?>(null);
  final namalengkap = TextEditingController();
  final alamat = TextEditingController();
  final tempatlahir = TextEditingController();
  final tgllahir = TextEditingController();
  final telp = TextEditingController();
  final email = TextEditingController();
  final kk = TextEditingController();

  var selectedDate = DateTime.now().obs;

  String getCurrentDateTime() {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(now);
  }

  void selectDate(BuildContext context) async {
    print("date picker");
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate.value) {
      var formatter = DateFormat('dd-MM-yyyy');

      print(picked);
      selectedDate.value = picked;
    }
  }

  String get selectedDateFormatted {
    return DateFormat('dd-MM-yyyy').format(selectedDate.value);
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  final box = GetStorage();

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      final File pickedImageFile = File(imagePicked.path);
      image.value = pickedImageFile;
    }
  }

  Future<void> saveData() async {
    User? user = FirebaseAuth.instance.currentUser;

    final imageFile = image.value;
    final bytes = imageFile!.readAsBytesSync();
    final baset64Img = base64Encode(bytes);

    CollectionReference ktp = firestore.collection("disdukcapil");
    DateTime tglPengajuan = DateTime.now();
    Timestamp tglPengajuanTimestamp = Timestamp.fromDate(tglPengajuan);

    try {
      await ktp.doc(user!.uid).set({
        'nama': namalengkap.text,
        'jenis_kelamin': ddGender.value,
        'agama': ddAgama.value,
        'alamat': alamat.text,
        'email': email.text,
        'kewarganegaraan': ddWNI.value,
        'nomor_kk': kk.text,
        'telepon': telp.text,
        'tempat_lahir': tempatlahir.text,
        'tgl_lahir': selectedDateFormatted,
        'foto': baset64Img,
        'timestamp': tglPengajuanTimestamp,
        'status': 'Diproses'
      });

      Fluttertoast.showToast(
          msg: "Form pendaftaran berhasil tersimpan.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xff1A669D),
          textColor: Colors.white,
          fontSize: 16.0);

      Get.back();
      Get.back();
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: "Gagal menyimpan data.");
    }
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
