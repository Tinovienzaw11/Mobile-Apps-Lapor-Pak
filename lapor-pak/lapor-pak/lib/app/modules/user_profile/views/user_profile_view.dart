import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:lapor_pak/app/controllers/auth_controller.dart';

import '../../../routes/app_pages.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  UserProfileView({Key? key}) : super(key: key);
  final authC = Get.find<AuthController>();
  final UserProfileController controller = Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1A669D),
        appBar: AppBar(
          backgroundColor: Color(0xff1A669D),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: StreamBuilder<DocumentSnapshot<Object?>>(
                stream: controller.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  Uint8List _bytesImage;
                  String _imgString = data['foto'];
                  _bytesImage = Base64Decoder().convert(_imgString);

                  return Center(
                      child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(children: [
                      InkWell(
                          onTap: () {
                            controller.getImage();
                          },
                          child: Stack(
                            children: [
                              data['foto'] != ''
                                  ? ClipOval(
                                      child: Image.memory(
                                        _bytesImage,
                                        fit: BoxFit.cover,
                                        width: Get.width *
                                            .35, // Set the width of the image
                                        height: Get.width *
                                            .35, // Set the height of the image
                                      ),
                                    )
                                  : Image.asset(
                                      'assets/profile.png', fit: BoxFit.cover,
                                      width: Get.width *
                                          .35, // Set the width of the image
                                      height: Get.width * .35,
                                    ),
                              Positioned(
                                top: 100,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white.withOpacity(.5),
                                  size: 50,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 30),
                      Text(
                        data['nama'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      SizedBox(height: 60),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SETTING_AKUN);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Icon(Icons.settings),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Setting Informasi Akun")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: data['nama'],
                              content: Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "NIK",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data['nik'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Alamat",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data['alamat'] +
                                          ", " +
                                          data['kecamatan'] +
                                          ", " +
                                          data['kelurahan'] +
                                          " - " +
                                          data['kota'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Tempat / Tgl.Lahir",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data['tempat_lahir'] +
                                          " / " +
                                          data['tgl_lahir'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "No.Telepon",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data['no_telp'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Icon(Icons.credit_card),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Data KTP")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Icon(Icons.lock_person_outlined),
                              SizedBox(
                                width: 15,
                              ),
                              Text("Privacy Policy")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 120),
                      Container(
                        width: Get.width,
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () => authC.logout(),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Keluar",
                                  style: TextStyle(color: Colors.white),
                                )
                              ]),
                        ),
                      ),
                    ]),
                  ));
                })));
  }
}
