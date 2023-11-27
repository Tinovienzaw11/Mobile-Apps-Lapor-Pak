import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../controllers/detail_laporan_controller.dart';
import 'package:open_route_service/open_route_service.dart';

class DetailLaporanView extends GetView<DetailLaporanController> {
  const DetailLaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot<Object?>>(
            future: controller.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data!.data() as Map<String, dynamic>;

              Uint8List _bytesImage;
              String _imgString = data['foto'];
              _bytesImage = Base64Decoder().convert(_imgString);

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height * .3,
                      decoration: BoxDecoration(color: Colors.grey[300]),
                      child: Image.memory(
                        _bytesImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(data['tgl_lapor'])
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(data['nama_pelapor'])
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: data['status'] == 'Selesai'
                                          ? Color.fromARGB(255, 207, 230, 181)
                                          : Colors.amber[300],
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(data['status'],
                                      style: TextStyle(fontSize: 11)),
                                )
                              ],
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Keterangan Laporan : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      data['keterangan'],
                                      style:
                                          TextStyle(fontSize: 16, height: 1.5),
                                    )
                                  ]),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Lokasi : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      data['lokasi'],
                                      style:
                                          TextStyle(fontSize: 16, height: 1.5),
                                    ),
                                    SizedBox(height: 10),
                                  ]),
                            )
                          ]),
                    )
                  ],
                ),
              );
            }));
  }
}
