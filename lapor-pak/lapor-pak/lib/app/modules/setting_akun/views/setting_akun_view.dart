import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_akun_controller.dart';

class SettingAkunView extends GetView<SettingAkunController> {
  SettingAkunView({Key? key}) : super(key: key);
  SettingAkunController controller = Get.put(SettingAkunController());
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                          'assets/profile.png',
                                          fit: BoxFit.cover,
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
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 60),
                          Text(
                            "Nama",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  width: 15,
                                ),
                                Obx(
                                  () => controller.isEdit == false
                                      ? Text(data['nama'])
                                      : Container(
                                          width: 160,
                                          child: TextField(
                                            controller: controller.nama,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: data['nama'],
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "No.Telp",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Icon(Icons.phone),
                                SizedBox(
                                  width: 15,
                                ),
                                Obx(
                                  () => controller.isEdit == false
                                      ? Text(data['no_telp'])
                                      : Container(
                                          width: 160,
                                          child: TextField(
                                            controller: controller.telp,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: data['no_telp'],
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Alamat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Icon(Icons.house),
                                SizedBox(
                                  width: 15,
                                ),
                                Obx(
                                  () => controller.isEdit == false
                                      ? Text(data['alamat'])
                                      : Container(
                                          width: 160,
                                          child: TextField(
                                            controller: controller.alamat,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: data['alamat'],
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Tempat Lahir",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Icon(Icons.child_care),
                                SizedBox(
                                  width: 15,
                                ),
                                Obx(
                                  () => controller.isEdit == false
                                      ? Text(data['tempat_lahir'])
                                      : Container(
                                          width: 160,
                                          child: TextField(
                                            controller: controller.tempat,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: data['tempat_lahir'],
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Tgl.Lahir",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(
                                  width: 15,
                                ),
                                Obx(
                                  () => controller.isEdit == false
                                      ? Text(data['tgl_lahir'])
                                      : Container(
                                          width: 160,
                                          child: TextField(
                                            controller: controller.tgllahir,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: data['tgl_lahir'],
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "NIK",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Container(
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
                                Obx(
                                  () => controller.isEdit == false
                                      ? Text(data['nik'])
                                      : Container(
                                          width: 160,
                                          child: TextField(
                                            controller: controller.nik,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: data['nik'],
                                            ),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Obx(() => controller.isEdit == false
                              ? Container(
                                  // width: Get.width,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      controller.isEdit.value = true;
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Edit",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ]),
                                  ),
                                )
                              : Container(
                                  // width: Get.width,
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      controller.saveEdit();
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.save_as_outlined,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Simpan",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ]),
                                  ),
                                ))
                        ]),
                  ));
                })));
  }
}
