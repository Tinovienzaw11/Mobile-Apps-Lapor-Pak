import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/diskusi_create_controller.dart';

class DiskusiCreateView extends GetView<DiskusiCreateController> {
  DiskusiCreateView({Key? key}) : super(key: key);
  DiskusiCreateController controller = Get.put(DiskusiCreateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Buat Diskusi",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text("Kategori Diskusi")),
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black12),
            child: Obx(
              () => DropdownButton<String>(
                isExpanded: true,
                value: controller.dropdownValue.value,
                style: TextStyle(fontSize: 13.0, color: Colors.black54),
                onChanged: (String? newValue) {
                  print(newValue);
                  controller.dropdownValue.value = newValue ?? '';
                },
                items: <String>[
                  'Jalan dan trotoar',
                  'Lampu jalan',
                  'Drainase dan saluran air',
                  'Taman dan area publik',
                  'Fasilitas kesehatan',
                  'Fasilitas pendidikan',
                  'Sampah dan lingkungan',
                  'Fasilitas transportasi umum',
                  'Listrik, air, dan gas',
                  'Hewan liar dan keselamatan lalu lintas'
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
              margin: EdgeInsets.only(bottom: 5), child: Text("Topik Diskusi")),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black12),
            child: TextField(
              controller: controller.judulC,
              decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 13.0),
                hintStyle: TextStyle(fontSize: 11.0),
                border: InputBorder.none,
                hintText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(margin: EdgeInsets.only(bottom: 5), child: Text("Isi")),
          Container(
            width: Get.width,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black12),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: controller.isiC,
              decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 13.0),
                hintStyle: TextStyle(fontSize: 11.0),
                border: InputBorder.none,
                hintText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text("Sertakan Foto Jika Ada (Tidak wajib)")),
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
                            borderRadius: BorderRadius.circular(20)),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                          SizedBox(height: 5),
                          Text("Ambil foto")
                        ],
                      )),
                    ))),
          SizedBox(height: 15),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              onPressed: () async {
                await controller.sendDiskusi();
              },
              child: Text(
                "Simpan",
                style: TextStyle(
                  fontSize: 16, // Set the text size to 20
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
                backgroundColor: Color(0xff1A669D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10), // Set the border radius to 20
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
