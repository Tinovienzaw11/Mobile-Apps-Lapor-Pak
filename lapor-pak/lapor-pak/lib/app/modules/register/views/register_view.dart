import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lapor_pak/app/controllers/auth_controller.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authC = Get.find<AuthController>();
  RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: Text(
                "Pendaftaran",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
              ),
            ),
            Text("Nama"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.namaC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Nama Anda',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("NIK"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.nikC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'NIK Anda',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Email"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.emailC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Email Anda',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Alamat"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.alamatC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Alamat Tempat Tinggal',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Propinsi"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.provC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Propinsi',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Kota"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.kotaC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Kota',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Kelurahan"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.kelurahanC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Kelurahan',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Kecamatan"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.kecamatanC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Kecamatan',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Kode Pos"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.kodeposC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Kode Pos',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("No.Telepon"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.noTelpC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'No. Telepon',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Jenis Kelamin"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Obx(
                () => DropdownButton<String>(
                  isExpanded: true,
                  value: controller.dropdownValue.value,
                  style: TextStyle(fontSize: 13.0, color: Colors.black54),
                  onChanged: (String? newValue) {
                    print(newValue);
                    controller.dropdownValue.value = newValue ?? '';
                  },
                  items: <String>['Pria', 'Wanita']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Tempat Lahir"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.tmpLahirC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Tempat Lahir',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Tanggal Lahir"),
            SizedBox(height: 10),
            Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(17),
                      child: Obx(
                          () => Text('${controller.selectedDateFormatted}')),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: () {
                          controller.selectDate(context);
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 30),
            Text("Password"),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: controller.passC,
                decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 13.0),
                  hintStyle: TextStyle(fontSize: 11.0),
                  border: InputBorder.none,
                  hintText: 'Password',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
                width: Get.width,
                child: Obx(() => controller.isLoading == false
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 50),
                            // shape: StadiumBorder(),
                            backgroundColor: Color(0xff1A669D)),
                        onPressed: () {
                          authC.signup(
                              controller.emailC.text,
                              controller.passC.text,
                              controller.namaC.text,
                              controller.alamatC.text,
                              controller.nikC.text,
                              controller.kelurahanC.text,
                              controller.kecamatanC.text,
                              controller.provC.text,
                              controller.kotaC.text,
                              controller.kodeposC.text,
                              controller.noTelpC.text,
                              controller.tmpLahirC.text,
                              controller.selectedDateFormatted,
                              controller.dropdownValue.value);
                        },
                        child: Text("Simpan Data"))
                    : Center(
                        child: Row(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Mengirim data")
                          ],
                        ),
                      ))),
          ],
        ),
      ),
    ));
  }
}
