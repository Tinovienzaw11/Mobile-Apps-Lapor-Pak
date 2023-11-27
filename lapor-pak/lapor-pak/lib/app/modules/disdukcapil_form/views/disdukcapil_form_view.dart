import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/disdukcapil_form_controller.dart';

class DisdukcapilFormView extends GetView<DisdukcapilFormController> {
  DisdukcapilFormView({Key? key}) : super(key: key);
  DisdukcapilFormController controller = Get.put(DisdukcapilFormController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                            child: Text(
                              "Form Pembuatan E-KTP",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 30),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Nama Lengkap")),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: controller.namalengkap,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 13.0),
                                hintStyle: TextStyle(fontSize: 11.0),
                                border: InputBorder.none,
                                hintText: 'Isi Nama Lengkap ',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Jenis Kelamin")),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: Obx(
                              () => DropdownButton<String>(
                                isExpanded: true,
                                value: controller.ddGender.value,
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.black54),
                                onChanged: (String? newValue) {
                                  print(newValue);
                                  controller.ddGender.value = newValue ?? '';
                                },
                                items: <String>[
                                  'Pria',
                                  'Wanita'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Tempat Lahir")),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: controller.tempatlahir,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 13.0),
                                hintStyle: TextStyle(fontSize: 11.0),
                                border: InputBorder.none,
                                hintText: 'Isi Tempat Lahir ',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Tanggal Lahir")),
                          // Container(
                          //   width: Get.width,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: Colors.black12),
                          //   child: TextField(
                          //     keyboardType: TextInputType.multiline,
                          //     maxLines: null,
                          //     controller: controller.tgllahir,
                          //     decoration: InputDecoration(
                          //       labelStyle: TextStyle(fontSize: 13.0),
                          //       hintStyle: TextStyle(fontSize: 11.0),
                          //       border: InputBorder.none,
                          //       hintText: 'Isi Tanggal Lahir ',
                          //       contentPadding: EdgeInsets.symmetric(
                          //           horizontal: 16.0, vertical: 12.0),
                          //     ),
                          //   ),
                          // ),
                          Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12,
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(17),
                                    child: Obx(() => Text(
                                        '${controller.selectedDateFormatted}',
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black54))),
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
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Agama")),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: Obx(
                              () => DropdownButton<String>(
                                isExpanded: true,
                                value: controller.ddAgama.value,
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.black54),
                                onChanged: (String? newValue) {
                                  print(newValue);
                                  controller.ddAgama.value = newValue ?? '';
                                },
                                items: <String>[
                                  'Islam',
                                  'Protestan',
                                  'Katolik',
                                  'Hindu',
                                  'Budha',
                                  'Konghucu'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Alamat lengkap")),
                          Container(
                            width: Get.width,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: TextField(
                              controller: controller.alamat,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 13.0),
                                hintStyle: TextStyle(fontSize: 11.0),
                                border: InputBorder.none,
                                hintText:
                                    'Isi Alamat lengkap, nama jalan, nomor rumah, RT/RW, kelurahan/desa, kecamatan, kota/kabupaten, dan kode pos.',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Kewarganegaraan")),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: Obx(
                              () => DropdownButton<String>(
                                isExpanded: true,
                                value: controller.ddWNI.value,
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.black54),
                                onChanged: (String? newValue) {
                                  print(newValue);
                                  controller.ddWNI.value = newValue ?? '';
                                },
                                items: <String>[
                                  'WNI',
                                  'WNA'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Nomor Telp.")),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: controller.telp,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 13.0),
                                hintStyle: TextStyle(fontSize: 11.0),
                                border: InputBorder.none,
                                hintText: 'Isi Nomor Telp. ',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Email")),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: controller.email,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 13.0),
                                hintStyle: TextStyle(fontSize: 11.0),
                                border: InputBorder.none,
                                hintText: 'Isi Email ',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Nomor Kartu Keluarga")),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              controller: controller.kk,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontSize: 13.0),
                                hintStyle: TextStyle(fontSize: 11.0),
                                border: InputBorder.none,
                                hintText: 'Isi Nomor Kartu Keluarga ',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 12.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Lampiran Dokumen")),
                          Container(
                              width: Get.width,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12),
                              child: Obx(() => controller.image.value != null
                                  ? InkWell(
                                      onTap: () async {
                                        await controller.getImage();
                                      },
                                      child: Container(
                                        width: Get.width,
                                        height: 300,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Image.file(
                                          controller.image.value!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () async {
                                        await controller.getImage();
                                      },
                                      child: Center(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.camera_alt,
                                            size: 30,
                                          ),
                                          SizedBox(height: 5),
                                          Text("Foto Dokumen Pelengkap")
                                        ],
                                      )),
                                    ))),
                          SizedBox(height: 15),
                          SizedBox(
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () async {
                                await controller.saveData();
                              },
                              child: Text(
                                "Simpan Data",
                                style: TextStyle(
                                  fontSize: 16, // Set the text size to 20
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 40),
                                backgroundColor: Color(0xff1A669D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        10), // Set the border radius to 20
                                  ),
                                ),
                              ),
                            ),
                          )
                        ])))));
  }
}
