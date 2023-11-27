import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  final emailC = TextEditingController();
  final namaC = TextEditingController();
  final alamatC = TextEditingController();
  final kecamatanC = TextEditingController();
  final kelurahanC = TextEditingController();
  final kodeposC = TextEditingController();
  final kotaC = TextEditingController();
  final provC = TextEditingController();
  final tmpLahirC = TextEditingController();
  final tglLahirC = TextEditingController();
  final nikC = TextEditingController();
  final noTelpC = TextEditingController();
  final passC = TextEditingController();
  RxString dropdownValue = 'Pria'.obs;
  var isLoading = false.obs;

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
    emailC.dispose();
    passC.dispose();
    namaC.dispose();
    alamatC.dispose();
    nikC.dispose();
    kelurahanC.dispose();
    kecamatanC.dispose();
    provC.dispose();
    kotaC.dispose();
    kodeposC.dispose();
    noTelpC.dispose();
    tmpLahirC.dispose();

    super.onClose();
  }
}
