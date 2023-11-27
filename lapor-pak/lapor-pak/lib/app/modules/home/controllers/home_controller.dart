import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final searchC = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> myList = [
    "disdukcapil",
    "pelaporan",
    "dimas",
    "news",
    "ktp",
    "berita"
  ];
  String searchString = "";

  GetStorage box = GetStorage();

  void search() {
    final s = myList.contains(searchString);
    print(s);
  }

  void saveState(String nama) {
    box.write('nama', nama);
  }

  Stream<DocumentSnapshot<Object?>> getData() {
    DocumentReference docRef = firestore.collection("users").doc(user!.uid);

    return docRef.snapshots();
  }

  Stream<DocumentSnapshot<Object?>> ktpUpdate() {
    DocumentReference docRef =
        firestore.collection("disdukcapil").doc(user!.uid);

    return docRef.snapshots();
  }

  @override
  void onInit() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      LocationPermission permission = await Geolocator.requestPermission();
    }
    print(permission);
    super.onInit();
  }
}
