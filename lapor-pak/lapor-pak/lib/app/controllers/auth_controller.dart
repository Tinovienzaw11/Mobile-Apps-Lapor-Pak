import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lapor_pak/app/modules/register/controllers/register_controller.dart';
import 'package:lapor_pak/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../modules/login/controllers/login_controller.dart';

class AuthController extends GetxController {
  RegisterController regController = Get.put(RegisterController());
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  Stream documentStream = FirebaseFirestore.instance
      .collection('users')
      .doc("e6Axa0wQ05hhAMofo5sSRZ5I5LX2")
      .snapshots();

  final LoginController loginController = Get.put(LoginController());

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            backgroundColor: Color(0xff1A669D),
            titleStyle: TextStyle(color: Colors.white),
            middleTextStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.all(20),
            titlePadding: EdgeInsets.all(20),
            title: "Login Failed",
            middleText: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            backgroundColor: Color(0xff1A669D),
            titleStyle: TextStyle(color: Colors.white),
            middleTextStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.all(20),
            titlePadding: EdgeInsets.all(20),
            title: "Login Failed",
            middleText: 'Wrong password.');
      }
    }
  }

  void resetPass(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  void logout() async {
    print("sign out");
    await auth.signOut();

    Get.offAllNamed(Routes.LOGIN);
  }

  void signup(
      String email,
      String password,
      String nama,
      String alamat,
      String nik,
      String kelurahan,
      String kecamatan,
      String propinsi,
      String kota,
      String kode_pos,
      String no_telp,
      String tempat_lahir,
      String tgl_lahir,
      String jenis_kelamin) async {
    try {
      regController.isLoading.value = true;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'nama': nama,
        'alamat': alamat,
        'nik': nik,
        'kelurahan': kelurahan,
        'kecamatan': kecamatan,
        'propinsi': propinsi,
        'kota': kota,
        'kode_pos': kode_pos,
        'no_telp': no_telp,
        'tempat_lahir': tempat_lahir,
        'tgl_lahir': tgl_lahir,
        'jenis_kelamin': jenis_kelamin,
        'foto': '',
        "role": "user"
      });

      regController.isLoading.value = false;
      Fluttertoast.showToast(
          msg: "Registrasi Berhasil",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: Color(0xff1A669D),
          textColor: Colors.white,
          fontSize: 16.0);

      Get.back();
      Get.back();
    } on FirebaseAuthException catch (e) {
      regController.isLoading.value = false;
      if (e.code == 'weak-password') {
        Get.defaultDialog(
            backgroundColor: Color(0xff1A669D),
            titleStyle: TextStyle(color: Colors.white),
            middleTextStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.all(20),
            titlePadding: EdgeInsets.all(20),
            title: "Login Failed",
            middleText: 'Password is to weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            backgroundColor: Color(0xff1A669D),
            titleStyle: TextStyle(color: Colors.white),
            middleTextStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.all(20),
            titlePadding: EdgeInsets.all(20),
            title: "Login Failed",
            middleText: 'The account already exists for that email.');
      }
    } catch (e) {
      regController.isLoading.value = false;
      print(e);
    }
  }
}
